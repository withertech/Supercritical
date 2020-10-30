; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private constant [10 x i8] c"upps nix\0A\00", align 1
@.str.2 = private constant [4 x i8] c"%d\0A\00", align 1
@.str.3 = private constant [10 x i8] c"upps nix\0A\00", align 1
@.str.4 = private constant [20 x i8] c"got from import %d\0A\00", align 1

define void @main() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0))
  br label %loop12

loop12:                                           ; preds = %entry, %loop12
  %id.1 = phi i64 [ 3, %entry ], [ %mathtmp14, %loop12 ]
  %mathtmp14 = sub i64 %id.1, 1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i64 %mathtmp14)
  %cmptmp11 = icmp sgt i64 %mathtmp14, 1
  br i1 %cmptmp11, label %loop12, label %merge17

merge17:                                          ; preds = %loop12
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i64 %mathtmp14)
  ret void
}

declare void @printf(i8*, ...)
