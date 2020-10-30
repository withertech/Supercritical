; ModuleID = 'supercritical'
source_filename = "supercritical"

%class.counter_ctor = type { i64, i8*, i64 }

@.str = private constant [6 x i8] c"empty\00", align 1
@.str.1 = private constant [51 x i8] c"c.count=%d (25) c.name=%s (empty) c.number=%d (4)\0A\00", align 1

define void @main() {
entry:
  %ctor = alloca %class.counter_ctor
  %0 = getelementptr %class.counter_ctor, %class.counter_ctor* %ctor, i32 0, i32 0
  store i64 25, i64* %0
  %1 = getelementptr %class.counter_ctor, %class.counter_ctor* %ctor, i32 0, i32 1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %1
  call void @"__init__%counter_ctor"(%class.counter_ctor* %ctor)
  %_count = load i64, i64* %0
  %_name = load i8*, i8** %1
  %2 = getelementptr %class.counter_ctor, %class.counter_ctor* %ctor, i32 0, i32 2
  %_number = load i64, i64* %2
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str.1, i64 0, i64 0), i64 %_count, i8* %_name, i64 %_number)
  ret void
}

declare void @printf(i8*, ...)

define internal void @"__init__%counter_ctor"(%class.counter_ctor* %this) {
entry:
  %0 = getelementptr %class.counter_ctor, %class.counter_ctor* %this, i32 0, i32 2
  store i64 4, i64* %0
  ret void
}
