#include "main.h"

#include <iostream>
#include <sstream>
#include <stdio.h>
#include <cassert>
#include <getopt.h>
#include "config.h"
#include "CodeGenContext.h"
#include "AstNode.h"
#include "llvm/Support/DynamicLibrary.h"
#include "llvm/Support/raw_os_ostream.h"
#include "llvm/Analysis/Passes.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/ExecutionEngine/Interpreter.h"
#include "llvm/ExecutionEngine/MCJIT.h"
#include <fstream>


extern int yyparse();
extern int yylex_destroy();
extern FILE *yyin;
extern supercritical::Block *programBlock;
extern std::stack<std::string> fileNames;
extern std::vector<std::string> incPaths;
extern std::vector<std::string> libPaths;
extern std::list<std::string> libFiles;
extern int parsing_error;

void usage();

int main(int argc, char* argv[])
{
	std::string infile;
	std::string outfile;

	incPaths.push_back("./"); // current path
	incPaths.push_back("/usr/lib/supercritical/include/"); // include path
	libPaths.push_back("/usr/lib/supercritical/lib/"); // library path
	bool verbose = false;
	bool quiet = false;
	bool debug = false;
	const char* args = "vqdho:f:i:l:";
    int c ;
    while( ( c = getopt(argc, argv, args) ) != -1 )
    {
		switch (c)
		{
		case 'i':
		{
			std::stringstream ss(optarg);
			std::string item;
			while (std::getline(ss, item, ';'))
			{
				std::replace(std::begin(item), std::end(item), '\\', '/');
				if (item[item.size()] != '/')
				{
					item += '/';
				}
				incPaths.push_back(item);
			}
		}
			break;
		case 'l':
		{
			std::stringstream ss(optarg);
			std::string item;
			while (std::getline(ss, item, ';'))
			{
				std::replace(std::begin(item), std::end(item), '\\', '/');
				if (item[item.size()] != '/')
				{
					item += '/';
				}
				libPaths.push_back(item);
			}
		}
			break;
		case 'v':
			verbose = true;
			break;
		case 'q':
			quiet = true;
			break;
		case 'd':
			debug = true;
			break;
		case 'o':
			outfile = optarg;
			if (outfile == "-")
				quiet = true;
			break;
		case 'f':
			infile = optarg;
			break;
		case 'h':
			usage();
			return 1;
		case EOF:
			break;
		default:
			std::cout << opterr << "\n";
			usage();
			return 1;
		}
	}

	if (!quiet)
	{
		std::cout << "Supercritical version " << MAJOR_VER << "." << MINOR_VER << "." << REVISION_VER << std::endl;
	}
	if (outfile == "" || infile == "")
	{
		std::cerr << "Out or in file not specified!" << std::endl;
		return -1;
	}
	yyin = fopen(infile.c_str(), "r+");
	if (yyin == nullptr)
	{
		std::cerr << "File \'" << infile << "\' not found. Abort" << std::endl;
		return -1;
	}

	fileNames.push("");       // Add the empty file name after last EOF.
	fileNames.push(infile); // Add the top level file name.
	if (yyparse() || parsing_error)
	{
		yylex_destroy();

		return 1;
	}

	if (programBlock == nullptr)
	{
		std::cerr << "Parsing " << infile << "failed. Abort" << std::endl;
	}
	else
	{
		std::ostringstream devNull;
		supercritical::CodeGenContext context(quiet ? devNull : std::cout, libFiles);
		context.verbose = verbose;
		context.debug = debug;
		context.link();
		if (verbose)
			context.printCodeGeneration(*programBlock, std::cout);
		if (context.preProcessing(*programBlock))
		{
			if (context.generateCode(*programBlock))
			{
				if (outfile == "-")
				{
					llvm::raw_os_ostream file_stream(std::cout);
					context.getModule()->print(file_stream, nullptr);
				}
				else
				{
					if(!quiet) std::cout << "Generating LLVM IR module..." << std::endl;
					std::ofstream std_file_stream(outfile);
					llvm::raw_os_ostream file_stream(std_file_stream);
					context.getModule()->print(file_stream, nullptr);
					if(!quiet) std::cout << "Generated LLVM IR module" << std::endl;
					if(!quiet) std::cout << "Compile with \"clang++-10 " << outfile << " -o <output>\"" << std::endl;
				}
			}
		}
	}

	if (yyin != nullptr)
		fclose(yyin);
	delete programBlock;
	yylex_destroy();
	return 0;
}

void usage()
{
	std::cout << "Usage:\n";
	std::cout << "crit -f inputfile -o outputfile [-h] [-d] [-v] [-q] [-i path1;path2] [-l path1;path2]\n";
	std::cout << "\t-h this help text.\n";
	std::cout << "\t-d debug code generation. Disables the code optimizer pass.\n";
	std::cout << "\t-v be more verbose.\n";
	std::cout << "\t-q be quiet.\n";
	std::cout << "\t-f path to input file.\n";
	std::cout << "\t-o path to output file. use - to dump to standard output.\n";
	std::cout << "\t-i semicolon separated list of import paths where additional supercritical files are located.\n";
	std::cout << "\t-l semicolon separated list of library paths where additional supercritical libraries are located.\n";
}
