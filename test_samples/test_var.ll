; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [16 x i8] c"id = %d x = %d\0A\00", align 1
@.str.1 = private constant [6 x i8] c"Hello\00", align 1
@.str.2 = private constant [19 x i8] c"otto = %s (Hello)\0A\00", align 1
@.str.3 = private constant [9 x i8] c"It's me.\00", align 1
@.str.4 = private constant [22 x i8] c"otto = %s (It's me.)\0A\00", align 1

define void @main() {
entry:
  ret void
}

declare void @printf(i8*, ...)

define internal void @test_var() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0), i64 5, i64 29)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i64 0, i64 0))
  ret void
}
