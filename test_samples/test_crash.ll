; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private constant [3 x i8] c"%d\00", align 1

define void @main() {
entry:
  ret void
}

declare void @printf(i8*, ...)
