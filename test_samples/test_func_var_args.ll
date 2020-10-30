; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private constant [4 x i8] c"%f\0A\00", align 1
@.str.2 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  %0 = call i64 @inc_11_11(i64 1)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i64 %0)
  %1 = call double @inc_3_3(double 3.140000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %1)
  %2 = call i64 @inc_11_11(i64 2)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i64 %2)
  ret void
}

declare void @printf(i8*, ...)

define internal i64 @inc_11_11(i64 %x1) {
entry:
  %mathtmp = add i64 %x1, 1
  ret i64 %mathtmp
}

define internal double @inc_3_3(double %x1) {
entry:
  %mathtmp = fadd double %x1, 1.000000e+00
  ret double %mathtmp
}
