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
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%list = type { i64, i64, i64 }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_io.cpp, i8* null }]
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@stdout = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZSt3cin = external dso_local global %"class.std::basic_istream", align 8
@.str = private global [18 x i8] c"Enter an double:\0A\00", align 1
@.str.1 = private global [12 x i8] c"sin(x): %f\0A\00", align 1
@.str.2 = private global [12 x i8] c"cos(x): %f\0A\00", align 1
@.str.3 = private global [12 x i8] c"tan(x): %f\0A\00", align 1
@.str.4 = private global [12 x i8] c"cot(x): %f\0A\00", align 1
@.str.5 = private global [12 x i8] c"sec(x): %f\0A\00", align 1
@.str.6 = private global [12 x i8] c"csc(x): %f\0A\00", align 1
@.str.7 = private global [9 x i8] c"%d,%d,%d\00", align 1

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_io.cpp() #0 section ".text.startup" {
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
define dso_local void @writef(i8* nocapture readonly %0, ...) local_unnamed_addr #4 {
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
define dso_local i32 @readint() local_unnamed_addr #0 {
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
define dso_local double @readdouble() local_unnamed_addr #0 {
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
define dso_local nonnull i8* @readstring() local_unnamed_addr #0 {
  %1 = tail call dereferenceable(1) i8* @_Znwm(i64 1) #10
  %2 = tail call dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* nonnull dereferenceable(280) @_ZSt3cin, i8* nonnull %1)
  ret i8* %1
}

; Function Attrs: nobuiltin nofree
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #8

declare dso_local dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* dereferenceable(280), i8*) local_unnamed_addr #1

; Function Attrs: nofree nounwind uwtable
define dso_local double @sin(double %0) local_unnamed_addr #9 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = fptrunc double %0 to float
  %3 = tail call float @sinf(float %2) #6
  %4 = fpext float %3 to double
  ret double %4
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: nofree nounwind
declare dso_local float @sinf(float) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local double @cos(double %0) local_unnamed_addr #9 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = fptrunc double %0 to float
  %3 = tail call float @cosf(float %2) #6
  %4 = fpext float %3 to double
  ret double %4
}

; Function Attrs: nofree nounwind
declare dso_local float @cosf(float) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local double @tan(double %0) local_unnamed_addr #9 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = fptrunc double %0 to float
  %3 = tail call float @sinf(float %2) #6
  %4 = tail call float @cosf(float %2) #6
  %5 = fdiv float %3, %4
  %6 = fpext float %5 to double
  ret double %6
}

; Function Attrs: nofree nounwind uwtable
define dso_local double @cot(double %0) local_unnamed_addr #9 {
  %2 = fptrunc double %0 to float
  %3 = tail call float @cosf(float %2) #6
  %4 = tail call float @sinf(float %2) #6
  %5 = fdiv float %3, %4
  %6 = fpext float %5 to double
  ret double %6
}

; Function Attrs: nofree nounwind uwtable
define dso_local double @sec(double %0) local_unnamed_addr #9 {
  %2 = fptrunc double %0 to float
  %3 = tail call float @cosf(float %2) #6
  %4 = fdiv float 1.000000e+00, %3
  %5 = fpext float %4 to double
  ret double %5
}

; Function Attrs: nofree nounwind uwtable
define dso_local double @csc(double %0) local_unnamed_addr #9 {
  %2 = fptrunc double %0 to float
  %3 = tail call float @sinf(float %2) #6
  %4 = fdiv float 1.000000e+00, %3
  %5 = fpext float %4 to double
  ret double %5
}

; Function Attrs: nofree nounwind uwtable
define dso_local double @pow(double %0, double %1) local_unnamed_addr #9 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = fptrunc double %0 to float
  %4 = fptrunc double %1 to float
  %5 = tail call float @powf(float %3, float %4) #6
  %6 = fpext float %5 to double
  ret double %6
}

; Function Attrs: nofree nounwind
declare dso_local float @powf(float, float) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local double @root(double %0, double %1) local_unnamed_addr #9 {
  %3 = fptrunc double %0 to float
  %4 = fptrunc double %1 to float
  %5 = fdiv float 1.000000e+00, %4
  %6 = tail call float @powf(float %3, float %5) #6
  %7 = fpext float %6 to double
  ret double %7
}

define void @main() {
entry:
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0))
  %x = alloca double
  %0 = call double @readdouble()
  store double %0, double* %x
  %x1 = load double, double* %x
  %1 = call double @sin(double %x1)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), double %1)
  %x2 = load double, double* %x
  %2 = call double @cos(double %x2)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), double %2)
  %x3 = load double, double* %x
  %3 = call double @tan(double %x3)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), double %3)
  %x4 = load double, double* %x
  %4 = call double @cot(double %x4)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.4, i64 0, i64 0), double %4)
  %x5 = load double, double* %x
  %5 = call double @sec(double %x5)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), double %5)
  %x6 = load double, double* %x
  %6 = call double @csc(double %x6)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), double %6)
  %alloc_list = alloca %list
  %7 = getelementptr %list, %list* %alloc_list, i32 0, i32 0
  store i64 1, i64* %7
  %8 = getelementptr %list, %list* %alloc_list, i32 0, i32 1
  store i64 2, i64* %8
  %9 = getelementptr %list, %list* %alloc_list, i32 0, i32 2
  store i64 3, i64* %9
  %l = alloca %list*
  store %list* %alloc_list, %list** %l
  %n = alloca i64
  store i64 1, i64* %n
  br label %firstcond

firstcond:                                        ; preds = %entry
  %n7 = load i64, i64* %n
  %cmptmp = icmp slt i64 %n7, 3
  br i1 %cmptmp, label %loop, label %else

cond:                                             ; preds = %loop
  %n8 = load i64, i64* %n
  %cmptmp9 = icmp slt i64 %n8, 3
  br i1 %cmptmp9, label %loop, label %merge

loop:                                             ; preds = %cond, %firstcond
  %n10 = load i64, i64* %n
  %mathtmp = add i64 %n10, 1
  store i64 %mathtmp, i64* %n
  br label %cond

else:                                             ; preds = %firstcond
  br label %merge

merge:                                            ; preds = %else, %cond
  %load_var = load %list*, %list** %l
  %get_struct_element = getelementptr %list, %list* %load_var, i32 0, i32 0
  %load_ptr_struct = load i64, i64* %get_struct_element
  %load_var11 = load %list*, %list** %l
  %get_struct_element12 = getelementptr %list, %list* %load_var11, i32 0, i32 1
  %load_ptr_struct13 = load i64, i64* %get_struct_element12
  %load_var14 = load %list*, %list** %l
  %get_struct_element15 = getelementptr %list, %list* %load_var14, i32 0, i32 2
  %load_ptr_struct16 = load i64, i64* %get_struct_element15
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0), i64 %load_ptr_struct, i64 %load_ptr_struct13, i64 %load_ptr_struct16)
  ret void
}

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { builtin }

!llvm.ident = !{!0, !0}
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
