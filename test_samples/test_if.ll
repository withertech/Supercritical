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

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_core.cpp, i8* null }]
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@stdout = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZSt3cin = external dso_local global %"class.std::basic_istream", align 8
@.str = private global [23 x i8] c"Max is %d expected 10\0A\00", align 1
@.str.1 = private global [22 x i8] c"Min is %d expected 1n\00", align 1
@.str.2 = private global [26 x i8] c"testif is %d expected 10\0A\00", align 1
@.str.3 = private global [25 x i8] c"testif is %d expected 5\0A\00", align 1
@.str.4 = private global [30 x i8] c"testifMax is %d expected 10 \0A\00", align 1
@.str.5 = private global [30 x i8] c"testifMax is %d expected 10 \0A\00", align 1

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_core.cpp() #0 section ".text.startup" {
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
  %1 = tail call dereferenceable(1) i8* @_Znwm(i64 1) #9
  %2 = tail call dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* nonnull dereferenceable(280) @_ZSt3cin, i8* nonnull %1)
  ret i8* %1
}

; Function Attrs: nobuiltin nofree
declare dso_local noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #8

declare dso_local dereferenceable(280) %"class.std::basic_istream"* @_ZStrsIcSt11char_traitsIcEERSt13basic_istreamIT_T0_ES6_PS3_(%"class.std::basic_istream"* dereferenceable(280), i8*) local_unnamed_addr #1

define void @main() {
entry:
  %minmax = alloca i64
  %0 = call i64 @max(i64 1, i64 10)
  store i64 %0, i64* %minmax
  %minmax1 = load i64, i64* %minmax
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i64 0, i64 0), i64 %minmax1)
  %1 = call i64 @min(i64 1, i64 10)
  store i64 %1, i64* %minmax
  %minmax2 = load i64, i64* %minmax
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), i64 %minmax2)
  %nif = alloca i64
  %2 = call i64 @testif(i64 1, i64 10)
  store i64 %2, i64* %nif
  %nif3 = load i64, i64* %nif
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.2, i64 0, i64 0), i64 %nif3)
  %3 = call i64 @testif(i64 5, i64 5)
  store i64 %3, i64* %nif
  %nif4 = load i64, i64* %nif
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i64 0, i64 0), i64 %nif4)
  %4 = call i64 @testifMax(i64 1, i64 10)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i64 0, i64 0), i64 %4)
  %5 = call i64 @testifMax(i64 10, i64 1)
  call void (i8*, ...) @writef(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.5, i64 0, i64 0), i64 %5)
  ret void
}

define internal i64 @max(i64 %a1, i64 %b2) {
entry:
  %a = alloca i64
  store i64 %a1, i64* %a
  %b = alloca i64
  store i64 %b2, i64* %b
  %b3 = load i64, i64* %b
  %a4 = load i64, i64* %a
  %cmptmp = icmp sgt i64 %a4, %b3
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %a5 = load i64, i64* %a
  ret i64 %a5

else:                                             ; preds = %entry
  %b6 = load i64, i64* %b
  ret i64 %b6
}

define internal i64 @min(i64 %a1, i64 %b2) {
entry:
  %a = alloca i64
  store i64 %a1, i64* %a
  %b = alloca i64
  store i64 %b2, i64* %b
  %b3 = load i64, i64* %b
  %a4 = load i64, i64* %a
  %cmptmp = icmp sgt i64 %a4, %b3
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %b5 = load i64, i64* %b
  ret i64 %b5

else:                                             ; preds = %entry
  br label %merge

merge:                                            ; preds = %else
  %a6 = load i64, i64* %a
  ret i64 %a6
}

define internal i64 @testif(i64 %a1, i64 %b2) {
entry:
  %a = alloca i64
  store i64 %a1, i64* %a
  %b = alloca i64
  store i64 %b2, i64* %b
  %x = alloca i64
  store i64 0, i64* %x
  %b3 = load i64, i64* %b
  %a4 = load i64, i64* %a
  %cmptmp = icmp eq i64 %a4, %b3
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %a5 = load i64, i64* %a
  ret i64 %a5

else:                                             ; preds = %entry
  %b6 = load i64, i64* %b
  store i64 %b6, i64* %x
  br label %merge

merge:                                            ; preds = %else
  %x7 = load i64, i64* %x
  ret i64 %x7
}

define internal i64 @testifMax(i64 %a1, i64 %b2) {
entry:
  %a = alloca i64
  store i64 %a1, i64* %a
  %b = alloca i64
  store i64 %b2, i64* %b
  %max = alloca i64
  store i64 0, i64* %max
  %b3 = load i64, i64* %b
  %a4 = load i64, i64* %a
  %cmptmp = icmp sgt i64 %a4, %b3
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %a5 = load i64, i64* %a
  store i64 %a5, i64* %max
  br label %merge

else:                                             ; preds = %entry
  %b6 = load i64, i64* %b
  store i64 %b6, i64* %max
  br label %merge

merge:                                            ; preds = %else, %then
  %max7 = load i64, i64* %max
  ret i64 %max7
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
