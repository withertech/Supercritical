#include <typeinfo>
#include "AstNode.h"
#include "CodeGenContext.h"
#include "parser.hpp"
#include "llvm/Support/DynamicLibrary.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include "llvm/Linker/Linker.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/IR/ModuleSummaryIndex.h"
#include <stdarg.h>
#include <stdio.h>
#include <algorithm>
#include <cmath>
#include <fstream>

#include "VisitorSyntaxCheck.h"
#include "VisitorPrettyPrint.h"

using namespace std;
using namespace llvm;

#if defined(_MSC_VER)
#if defined(_M_X64)
#define UseInt64
#else
#define UseInt32
#endif
#endif

#if defined(__GNUC__)
#if defined(__x86_64)
#define UseInt64
#else
#define UseInt32
#endif
#endif
namespace supercritical
{

CodeGenContext::CodeGenContext(std::ostream &outs, std::list<std::string> libFiles) : outs(outs), libFiles(libFiles)
{
	llvm::InitializeNativeTarget();
	llvm::InitializeNativeTargetAsmParser();
	llvm::InitializeNativeTargetAsmPrinter();
	module = new llvm::Module("supercritical", llvmContext);
}

#define MAKE_LLVM_EXTERNAL_NAME(a) #a
void CodeGenContext::setupTypes()
{
	intType = getGenericIntegerType();
	doubleType = Type::getDoubleTy(getGlobalContext());
	stringType = Type::getInt8PtrTy(getGlobalContext());
	boolType = Type::getInt1Ty(getGlobalContext());
	voidType = Type::getVoidTy(getGlobalContext());
	varType = StructType::create(getGlobalContext(), "var");
	llvmTypeMap["int"] = intType;
	llvmTypeMap["double"] = doubleType;
	llvmTypeMap["string"] = stringType;
	llvmTypeMap["boolean"] = boolType;
	llvmTypeMap["void"] = voidType;
	llvmTypeMap["var"] = varType;


}

bool CodeGenContext::generateCode(Block &root)
{
	outs << "Generating code...\n";

	/* Create the top level interpreter function to call as entry */
	vector<Type*> argTypes;
	FunctionType *ftype = FunctionType::get(Type::getVoidTy(getGlobalContext()), argTypes, false);
	mainFunction = Function::Create(ftype, GlobalValue::ExternalLinkage, "main", getModule());
	BasicBlock *bblock = BasicBlock::Create(getGlobalContext(), "entry", mainFunction, 0);
	setupTypes();
	/* Push a new variable/block context */
	newScope(bblock);
	root.codeGen(*this); /* emit byte code for the top level block */
	if (errors)
	{
		outs << "Compilation error(s). Abort.\n";
		return false;
	}
	if (currentBlock()->getTerminator() == nullptr)
	{
		ReturnInst::Create(getGlobalContext(), 0, currentBlock());
	}
	endScope();

	outs << "Code is generated.\n";

	outs << "verifying... ";
	if (verifyModule(*getModule()))
	{
		outs << ": Error constructing function!\n";
#if !defined(LLVM_NO_DUMP)
      module->dump();
#endif
		return false;
	}
	outs << "done.\n";

//	if (!debug)
//	{
//		optimize();
//	}
#if !defined(LLVM_NO_DUMP) // Only the debug build of LLVM has a dump() method.
   /* Print the byte code in a human-readable format
    *     to see if o
    *     ur program compiled properly
    */
   if (verbose)
      module->dump();
#endif
	return true;
}


void CodeGenContext::printCodeGeneration(class Block &root, std::ostream &outstream)
{
	VisitorPrettyPrint visitor(outstream);
	root.Accept(visitor);
}

llvm::Module* CodeGenContext::getModule()
{
	return module;
}

void CodeGenContext::link()
{
	llvm::Linker linker(*module);
	SMDiagnostic Err;
	for (const auto &File : libFiles)
	{
		std::unique_ptr<Module> M = llvm::parseIRFile(File, Err, getGlobalContext());
		linker.linkInModule(std::move(M));
	}
}


void CodeGenContext::newScope(BasicBlock *bb, ScopeType scopeType)
{
	currentScopeType = scopeType;
	if (bb == nullptr)
	{
		bb = llvm::BasicBlock::Create(getGlobalContext(), "scope");
	}
	codeBlocks.push_front(new CodeGenBlock(bb));
}

void CodeGenContext::endScope()
{
	CodeGenBlock *top = codeBlocks.front();
	codeBlocks.pop_front();
	delete top;
	currentScopeType = ScopeType::CodeBlock;
}

AllocaInst* CodeGenContext::findVariable(std::string varName)
{
	if (currentScopeType == ScopeType::FunctionDeclaration)
	{
		// Only look in current scope, since outer scope isn't valid while in function declaration.
		auto &names = locals();
		if (names.find(varName) != names.end())
		{
			return names[varName];
		}
		return nullptr;
	}

	// Traverse from inner to outer scope (block) to find the variable.
	for (auto &cb : codeBlocks)
	{
		auto &names = cb->getValueNames();
		if (names.find(varName) != names.end())
		{
			return names[varName];
		}
	}

	// If we are in a class then check the calls variables, too.
	if (self)
	{
		ValueNames &vnames = self->getValueNames();
		if (vnames.find(varName) != vnames.end())
		{
			return vnames[varName];
		}
	}
	return nullptr;
}

void CodeGenContext::deleteVariable(std::string varName)
{
	ValueNames &names = locals();
	auto &typeMap = codeBlocks.front()->getTypeMap();
	if (names.find(varName) != names.end())
	{
		names.erase(varName);
		if (typeMap.count(varName))
		{
			typeMap.erase(varName);
		}
	}
}

void CodeGenContext::renameVariable(std::string oldVarName, std::string newVarName)
{
	ValueNames &names = locals();
	if (names.find(oldVarName) != names.end())
	{
		auto value = names[oldVarName];
		names.erase(oldVarName);
		names[newVarName] = value;
		auto &typeMap = codeBlocks.front()->getTypeMap();
		if (typeMap.count(oldVarName))
		{
			auto val = typeMap[oldVarName];
			typeMap.erase(oldVarName);
			typeMap[newVarName] = val;
		}
	}
}

void CodeGenContext::newKlass(std::string name)
{
	self = codeBlocks.front();
	klassName = name;
	classAttributes[klassName] = KlassValueNames();
}

void CodeGenContext::endKlass()
{
	self = nullptr;
	klassName = "";
}

void CodeGenContext::klassAddVariableAccess(std::string name, int index)
{
	classAttributes[klassName][name] = index;
}

Instruction* CodeGenContext::getKlassVarAccessInst(std::string klass, std::string name, AllocaInst *this_ptr)
{
	assert(classAttributes.find(klass) != classAttributes.end());
	int index = classAttributes[klass][name];
	std::vector<Value*> ptr_indices;
	ConstantInt *const_int32_0 = ConstantInt::get(getModule()->getContext(), APInt(32, 0));
	ConstantInt *const_int32 = ConstantInt::get(getModule()->getContext(), APInt(32, index));
	ptr_indices.push_back(const_int32_0);
	ptr_indices.push_back(const_int32);
	if (this_ptr->getType()->getElementType()->isPointerTy())
	{
		// since the alloc is a ptr to ptr
		Value *val = new LoadInst(this_ptr, "", false, currentBlock());
		return GetElementPtrInst::Create(val->getType()->getPointerElementType(), val, ptr_indices, "", currentBlock());
	}
	Instruction *ptr = GetElementPtrInst::Create(this_ptr->getType()->getElementType(), this_ptr, ptr_indices, "", currentBlock());
	return ptr;
}

std::string CodeGenContext::getType(std::string varName)
{
	if (varName == "self")
	{
		return klassName;
	}
	for (auto &cb : codeBlocks)
	{
		auto iter = cb->getTypeMap().find(varName);
		if (iter != std::end(cb->getTypeMap()))
		{
			return cb->getTypeMap()[varName];
		}
	}
	return std::string("");
}

Type* CodeGenContext::typeOf(const Identifier &type)
{
	return typeOf(type.getName());
}

Type* CodeGenContext::typeOf(const std::string &name)
{
	if (llvmTypeMap.count(name) != 0)
	{
		return llvmTypeMap[name];
	}

	llvm::Type *ty = getModule()->getTypeByName("class." + name);
	if (ty != nullptr)
	{
		return ty;
	}
	return voidType;
}

std::string CodeGenContext::typeNameOf(llvm::Type *type)
{
	switch (type->getTypeID())
	{
	case llvm::Type::TypeID::DoubleTyID:
		return "double";
	case llvm::Type::TypeID::IntegerTyID:
		if (type == llvm::Type::getInt1Ty(getGlobalContext()))
			return "boolean";
		return "int";
	case llvm::Type::TypeID::VoidTyID:
		return "void";
	default:
		return "void";
	}
}

void CodeGenContext::addKlassInitCode(std::string name, Assignment *assign)
{
	classInitCode[name].insert(assign);
}

KlassInitCodeAssign& CodeGenContext::getKlassInitCode(std::string name)
{
	return classInitCode[name];
}

std::string CodeGenContext::findClassNameByType(llvm::Type *ty)
{
	auto found = std::find_if(std::begin(classTypeMap), std::end(classTypeMap), [&](auto kv)
	{
		return kv.second == ty;
	});
	if (found != std::end(classTypeMap))
	{
		return found->first;
	}
	return "";
}

llvm::Type* CodeGenContext::getGenericIntegerType()
{
#if defined(UseInt64)
	return Type::getInt64Ty(getGlobalContext());
#else
   return Type::getInt32Ty(getGlobalContext());
#endif
}

bool CodeGenContext::preProcessing(Block &root)
{
	VisitorSyntaxCheck visitor;
	root.Accept(visitor);
	return !visitor.hasErrors();
}

FunctionDeclaration* CodeGenContext::getTemplateFunction(const std::string &name)
{
	if (templatedFunctionDeclarations.count(name) > 0)
	{
		return templatedFunctionDeclarations[name];
	}
	return nullptr;
}

}
