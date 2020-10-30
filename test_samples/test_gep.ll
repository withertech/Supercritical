; ModuleID = 'supercritical'
source_filename = "supercritical"

%class.counter = type { i8*, i64 }

@.str = private constant [5 x i8] c"leer\00", align 1
@.str.1 = private constant [33 x i8] c"c.count=%d (7) c.name=%s (leer)\0A\00", align 1
@.str.2 = private constant [38 x i8] c"Nach c.add2(+2) c.count=%d c.name=%s\0A\00", align 1

define void @main() {
entry:
  %c = alloca %class.counter
  %0 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 1
  store i64 7, i64* %0
  %1 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8** %1
  %_count = load i64, i64* %0
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0), i64 %_count, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  call void @add2(%class.counter* %c)
  %_count1 = load i64, i64* %0
  %_name2 = load i8*, i8** %1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i64 %_count1, i8* %_name2)
  ret void
}

declare void @printf(i8*, ...)

define internal void @add2(%class.counter* %c_addr) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %c_addr, i32 0, i32 1
  %_count = load i64, i64* %0
  %mathtmp = add i64 %_count, 2
  store i64 %mathtmp, i64* %0
  ret void
}
