; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [25 x i8] c"%lf %lf %lf %lf %lf %lf\0A\00", align 1
@.str.1 = private constant [13 x i8] c"%lf %lf %lf\0A\00", align 1
@.str.2 = private constant [4 x i8] c"%d\0A\00", align 1

define void @main() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), double 3.000000e-01, double -1.400000e+00, double 1.500000e+02, double 1.500000e+02, double 1.500000e-02, double 1.000000e+02)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), double 5.000000e+00, double 1.000000e+01, double 4.000000e-01)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i64 1)
  ret void
}

declare void @printf(i8*, ...)
