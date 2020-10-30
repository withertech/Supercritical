; ModuleID = 'supercritical'
source_filename = "supercritical"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_put"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%list = type { i64, i64, i64, i64 }
%list.0 = type { i64, i8*, i1 }
%list.1 = type { %list.0*, i64, i64 }
%list.2 = type { i64, i8*, double }
%list.3 = type { i64, i8*, i1, i64, i8*, double }
%list.4 = type { i64, i64, i64, i64, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private global [8 x i8] c"One=%d\0A\00", align 1
@.str.1 = private global [9 x i8] c"Zwei=%d\0A\00", align 1
@.str.2 = private global [13 x i8] c"%d,%d,%d,%d\0A\00", align 1
@.str.3 = private global [5 x i8] c"Otto\00", align 1
@.str.4 = private global [12 x i8] c"%d, %s, %d\0A\00", align 1
@.str.5 = private global [4 x i8] c"%d\0A\00", align 1
@.str.6 = private global [3 x i8] c"%d\00", align 1
@.str.7 = private global [5 x i8] c"karl\00", align 1
@.str.8 = private global [20 x i8] c"%d,%s,%d,%d,%s,%lf\0A\00", align 1
@.str.9 = private global [4 x i8] c"%d\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_buildins.cpp, i8* null }]
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@stdout = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZSt3cin = external dso_local global %"class.std::basic_istream", align 8

define void @main() {
entry:
  %alloc_list = alloca %list
  %0 = getelementptr %list, %list* %alloc_list, i32 0, i32 0
  store i64 1, i64* %0
  %1 = getelementptr %list, %list* %alloc_list, i32 0, i32 1
  store i64 2, i64* %1
  %2 = getelementptr %list, %list* %alloc_list, i32 0, i32 2
  store i64 3, i64* %2
  %3 = getelementptr %list, %list* %alloc_list, i32 0, i32 3
  store i64 4, i64* %3
  %myarray = alloca %list*
  store %list* %alloc_list, %list** %myarray
  %one = alloca i64
  %load_var = load %list*, %list** %myarray
  %get_struct_element = getelementptr %list, %list* %load_var, i32 0, i32 0
  %load_ptr_struct = load i64, i64* %get_struct_element
  store i64 %load_ptr_struct, i64* %one
  %one1 = load i64, i64* %one
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i64 %one1)
  %load_var2 = load %list*, %list** %myarray
  %get_struct_element3 = getelementptr %list, %list* %load_var2, i32 0, i32 1
  %load_ptr_struct4 = load i64, i64* %get_struct_element3
  %zwei = alloca i64
  store i64 %load_ptr_struct4, i64* %zwei
  %zwei5 = load i64, i64* %zwei
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i64 %zwei5)
  %load_var6 = load %list*, %list** %myarray
  %get_struct_element7 = getelementptr %list, %list* %load_var6, i32 0, i32 0
  %load_ptr_struct8 = load i64, i64* %get_struct_element7
  %load_var9 = load %list*, %list** %myarray
  %get_struct_element10 = getelementptr %list, %list* %load_var9, i32 0, i32 1
  %load_ptr_struct11 = load i64, i64* %get_struct_element10
  %load_var12 = load %list*, %list** %myarray
  %get_struct_element13 = getelementptr %list, %list* %load_var12, i32 0, i32 2
  %load_ptr_struct14 = load i64, i64* %get_struct_element13
  %load_var15 = load %list*, %list** %myarray
  %get_struct_element16 = getelementptr %list, %list* %load_var15, i32 0, i32 3
  %load_ptr_struct17 = load i64, i64* %get_struct_element16
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i64 %load_ptr_struct8, i64 %load_ptr_struct11, i64 %load_ptr_struct14, i64 %load_ptr_struct17)
  %mathtmp = add i64 1, 2
  %alloc_list18 = alloca %list.0
  %4 = getelementptr %list.0, %list.0* %alloc_list18, i32 0, i32 0
  store i64 %mathtmp, i64* %4
  %5 = getelementptr %list.0, %list.0* %alloc_list18, i32 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), i8** %5
  %6 = getelementptr %list.0, %list.0* %alloc_list18, i32 0, i32 2
  store i1 true, i1* %6
  %dinge = alloca %list.0*
  store %list.0* %alloc_list18, %list.0** %dinge
  %load_var19 = load %list.0*, %list.0** %dinge
  %get_struct_element20 = getelementptr %list.0, %list.0* %load_var19, i32 0, i32 0
  %load_ptr_struct21 = load i64, i64* %get_struct_element20
  %load_var22 = load %list.0*, %list.0** %dinge
  %get_struct_element23 = getelementptr %list.0, %list.0* %load_var22, i32 0, i32 1
  %load_ptr_struct24 = load i8*, i8** %get_struct_element23
  %load_var25 = load %list.0*, %list.0** %dinge
  %get_struct_element26 = getelementptr %list.0, %list.0* %load_var25, i32 0, i32 2
  %load_ptr_struct27 = load i1, i1* %get_struct_element26
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), i64 %load_ptr_struct21, i8* %load_ptr_struct24, i1 %load_ptr_struct27)
  %dinge28 = load %list.0*, %list.0** %dinge
  %alloc_list29 = alloca %list.1
  %7 = getelementptr %list.1, %list.1* %alloc_list29, i32 0, i32 0
  store %list.0* %dinge28, %list.0** %7
  %8 = getelementptr %list.1, %list.1* %alloc_list29, i32 0, i32 1
  store i64 5, i64* %8
  %9 = getelementptr %list.1, %list.1* %alloc_list29, i32 0, i32 2
  store i64 6, i64* %9
  %andere_dinge = alloca %list.1*
  store %list.1* %alloc_list29, %list.1** %andere_dinge
  %load_var30 = load %list.1*, %list.1** %andere_dinge
  %get_struct_element31 = getelementptr %list.1, %list.1* %load_var30, i32 0, i32 0
  %load_ptr_struct32 = load %list.0*, %list.0** %get_struct_element31
  %tt = alloca %list.0*
  store %list.0* %load_ptr_struct32, %list.0** %tt
  %load_var33 = load %list.0*, %list.0** %tt
  %get_struct_element34 = getelementptr %list.0, %list.0* %load_var33, i32 0, i32 0
  %load_ptr_struct35 = load i64, i64* %get_struct_element34
  %tt2 = alloca i64
  store i64 %load_ptr_struct35, i64* %tt2
  %tt236 = load i64, i64* %tt2
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i64 %tt236)
  %load_var37 = load %list.1*, %list.1** %andere_dinge
  %get_struct_element38 = getelementptr %list.1, %list.1* %load_var37, i32 0, i32 0
  %load_ptr_struct39 = load %list.0*, %list.0** %get_struct_element38
  %tmp_alloc_list_other = alloca %list.0*
  store %list.0* %load_ptr_struct39, %list.0** %tmp_alloc_list_other
  %load_var40 = load %list.0*, %list.0** %tmp_alloc_list_other
  %get_struct_element41 = getelementptr %list.0, %list.0* %load_var40, i32 0, i32 0
  %load_ptr_struct42 = load i64, i64* %get_struct_element41
  %abc = alloca i64
  store i64 %load_ptr_struct42, i64* %abc
  %abc43 = load i64, i64* %abc
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), i64 %abc43)
  %mathtmp44 = add i64 2, 3
  %alloc_list45 = alloca %list.2
  %10 = getelementptr %list.2, %list.2* %alloc_list45, i32 0, i32 0
  store i64 %mathtmp44, i64* %10
  %11 = getelementptr %list.2, %list.2* %alloc_list45, i32 0, i32 1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i64 0, i64 0), i8** %11
  %12 = getelementptr %list.2, %list.2* %alloc_list45, i32 0, i32 2
  store double 5.500000e+00, double* %12
  %sachen = alloca %list.2*
  store %list.2* %alloc_list45, %list.2** %sachen
  %sachen46 = load %list.2*, %list.2** %sachen
  %dinge47 = load %list.0*, %list.0** %dinge
  %load_var48 = load %list.0*, %list.0** %dinge
  %get_struct_element49 = getelementptr %list.0, %list.0* %load_var48, i32 0, i32 0
  %load_ptr_struct50 = load i64, i64* %get_struct_element49
  %load_var51 = load %list.0*, %list.0** %dinge
  %get_struct_element52 = getelementptr %list.0, %list.0* %load_var51, i32 0, i32 1
  %load_ptr_struct53 = load i8*, i8** %get_struct_element52
  %load_var54 = load %list.0*, %list.0** %dinge
  %get_struct_element55 = getelementptr %list.0, %list.0* %load_var54, i32 0, i32 2
  %load_ptr_struct56 = load i1, i1* %get_struct_element55
  %load_var57 = load %list.2*, %list.2** %sachen
  %get_struct_element58 = getelementptr %list.2, %list.2* %load_var57, i32 0, i32 0
  %load_ptr_struct59 = load i64, i64* %get_struct_element58
  %load_var60 = load %list.2*, %list.2** %sachen
  %get_struct_element61 = getelementptr %list.2, %list.2* %load_var60, i32 0, i32 1
  %load_ptr_struct62 = load i8*, i8** %get_struct_element61
  %load_var63 = load %list.2*, %list.2** %sachen
  %get_struct_element64 = getelementptr %list.2, %list.2* %load_var63, i32 0, i32 2
  %load_ptr_struct65 = load double, double* %get_struct_element64
  %alloc_list66 = alloca %list.3
  %13 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 0
  store i64 %load_ptr_struct50, i64* %13
  %14 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 1
  store i8* %load_ptr_struct53, i8** %14
  %15 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 2
  store i1 %load_ptr_struct56, i1* %15
  %16 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 3
  store i64 %load_ptr_struct59, i64* %16
  %17 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 4
  store i8* %load_ptr_struct62, i8** %17
  %18 = getelementptr %list.3, %list.3* %alloc_list66, i32 0, i32 5
  store double %load_ptr_struct65, double* %18
  %concatenate = alloca %list.3*
  store %list.3* %alloc_list66, %list.3** %concatenate
  %load_var67 = load %list.3*, %list.3** %concatenate
  %get_struct_element68 = getelementptr %list.3, %list.3* %load_var67, i32 0, i32 0
  %load_ptr_struct69 = load i64, i64* %get_struct_element68
  %load_var70 = load %list.3*, %list.3** %concatenate
  %get_struct_element71 = getelementptr %list.3, %list.3* %load_var70, i32 0, i32 1
  %load_ptr_struct72 = load i8*, i8** %get_struct_element71
  %load_var73 = load %list.3*, %list.3** %concatenate
  %get_struct_element74 = getelementptr %list.3, %list.3* %load_var73, i32 0, i32 2
  %load_ptr_struct75 = load i1, i1* %get_struct_element74
  %load_var76 = load %list.3*, %list.3** %concatenate
  %get_struct_element77 = getelementptr %list.3, %list.3* %load_var76, i32 0, i32 3
  %load_ptr_struct78 = load i64, i64* %get_struct_element77
  %load_var79 = load %list.3*, %list.3** %concatenate
  %get_struct_element80 = getelementptr %list.3, %list.3* %load_var79, i32 0, i32 4
  %load_ptr_struct81 = load i8*, i8** %get_struct_element80
  %load_var82 = load %list.3*, %list.3** %concatenate
  %get_struct_element83 = getelementptr %list.3, %list.3* %load_var82, i32 0, i32 5
  %load_ptr_struct84 = load double, double* %get_struct_element83
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i64 0, i64 0), i64 %load_ptr_struct69, i8* %load_ptr_struct72, i1 %load_ptr_struct75, i64 %load_ptr_struct78, i8* %load_ptr_struct81, double %load_ptr_struct84)
  %load_var85 = load %list*, %list** %myarray
  %get_struct_element86 = getelementptr %list, %list* %load_var85, i32 0, i32 0
  %load_ptr_struct87 = load i64, i64* %get_struct_element86
  %load_var88 = load %list*, %list** %myarray
  %get_struct_element89 = getelementptr %list, %list* %load_var88, i32 0, i32 1
  %load_ptr_struct90 = load i64, i64* %get_struct_element89
  %load_var91 = load %list*, %list** %myarray
  %get_struct_element92 = getelementptr %list, %list* %load_var91, i32 0, i32 2
  %load_ptr_struct93 = load i64, i64* %get_struct_element92
  %load_var94 = load %list*, %list** %myarray
  %get_struct_element95 = getelementptr %list, %list* %load_var94, i32 0, i32 3
  %load_ptr_struct96 = load i64, i64* %get_struct_element95
  %alloc_list97 = alloca %list.4
  %19 = getelementptr %list.4, %list.4* %alloc_list97, i32 0, i32 0
  store i64 %load_ptr_struct87, i64* %19
  %20 = getelementptr %list.4, %list.4* %alloc_list97, i32 0, i32 1
  store i64 %load_ptr_struct90, i64* %20
  %21 = getelementptr %list.4, %list.4* %alloc_list97, i32 0, i32 2
  store i64 %load_ptr_struct93, i64* %21
  %22 = getelementptr %list.4, %list.4* %alloc_list97, i32 0, i32 3
  store i64 %load_ptr_struct96, i64* %22
  %23 = getelementptr %list.4, %list.4* %alloc_list97, i32 0, i32 4
  store i64 5, i64* %23
  %myarray98 = alloca %list.4*
  store %list.4* %alloc_list97, %list.4** %myarray98
  %load_var99 = load %list.4*, %list.4** %myarray98
  %get_struct_element100 = getelementptr %list.4, %list.4* %load_var99, i32 0, i32 4
  %load_ptr_struct101 = load i64, i64* %get_struct_element100
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i64 %load_ptr_struct101)
  ret void
}

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_buildins.cpp() #0 section ".text.startup" {
  tail call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* nonnull @_ZStL8__ioinit)
  %1 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i64 0, i32 0), i8* nonnull @__dso_handle) #6
  ret void
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nofree nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @writef(i8* nocapture readonly %0, ...) #4 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #6
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %3)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !2, !noalias !6
  %6 = call i32 @vfprintf(%struct._IO_FILE* %5, i8* %0, %struct.__va_list_tag* nonnull %4)
  call void @llvm.va_end(i8* nonnull %3)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #6
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #6

; Function Attrs: nofree nounwind
declare dso_local i32 @vfprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, %struct.__va_list_tag*) local_unnamed_addr #7

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: uwtable
define dso_local i32 @readint() #0 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #6
  %3 = call dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* nonnull @_ZSt3cin, i32* nonnull dereferenceable(4) %1)
  %4 = load i32, i32* %1, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #6
  ret i32 %4
}

declare dso_local dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"*, i32* dereferenceable(4)) local_unnamed_addr #1

; Function Attrs: uwtable
define dso_local double @readdouble() #0 {
  %1 = alloca double, align 8
  %2 = bitcast double* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %2) #6
  %3 = call dereferenceable(280) %"class.std::basic_istream"* @_ZNSi10_M_extractIdEERSiRT_(%"class.std::basic_istream"* nonnull @_ZSt3cin, double* nonnull dereferenceable(8) %1)
  %4 = load double, double* %1, align 8, !tbaa !11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %2) #6
  ret double %4
}

declare dso_local dereferenceable(280) %"class.std::basic_istream"* @_ZNSi10_M_extractIdEERSiRT_(%"class.std::basic_istream"*, double* dereferenceable(8)) local_unnamed_addr #1

; Function Attrs: uwtable
define dso_local nonnull i8* @readstring() #0 {
  %1 = tail call dereferenceable(1) i8* @_Znwm(i64 1) #9
  %2 = tail call dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* nonnull dereferenceable(280) @_ZSt3cin, i8* nonnull %1)
  ret i8* %1
}

; Function Attrs: nobuiltin nofree
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #8

declare dso_local dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* dereferenceable(280), i8*) local_unnamed_addr #1

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { builtin }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 10.0.0-4ubuntu1 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7}
!7 = distinct !{!7, !8, !"vprintf: argument 0"}
!8 = distinct !{!8, !"vprintf"}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !4, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !4, i64 0}
