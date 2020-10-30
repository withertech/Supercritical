; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [6 x i8] c"empty\00", align 1
@.str.1 = private constant [35 x i8] c"c.count=%d (25) c.name=%s (empty)\0A\00", align 1
@.str.2 = private constant [37 x i8] c"c2.count=%d (25) c2.name=%s (empty)\0A\00", align 1
@.str.3 = private constant [14 x i8] c"d.mem=%d (2)\0A\00", align 1

define void @main() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0), i64 25, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i64 0, i64 0), i64 25, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i64 2)
  ret void
}

declare void @printf(i8*, ...)
