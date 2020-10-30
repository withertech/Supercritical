; ModuleID = 'supercritical'
source_filename = "supercritical"

%class.counter = type { i8*, i64 }

@.str = private constant [22 x i8] c"container of elements\00", align 1
@.str.1 = private constant [5 x i8] c"leer\00", align 1
@.str.2 = private constant [33 x i8] c"c.count=%d (7) c.name=%s (leer)\0A\00", align 1
@.str.3 = private constant [58 x i8] c"Nach init(50,container of elements) c.count=%d c.name=%s\0A\00", align 1
@.str.4 = private constant [35 x i8] c"Nach add(10) c.count=%d c.name=%s\0A\00", align 1
@.str.5 = private constant [35 x i8] c"Nach sub(10) c.count=%d c.name=%s\0A\00", align 1
@.str.6 = private constant [4 x i8] c"neu\00", align 1
@.str.7 = private constant [40 x i8] c"Nach _init(5,neu) c.count=%d c.name=%s\0A\00", align 1
@.str.8 = private constant [36 x i8] c"Nach add(c,5) c.count=%d c.name=%s\0A\00", align 1
@.str.9 = private constant [36 x i8] c"Nach sub(c,5) c.count=%d c.name=%s\0A\00", align 1
@.str.10 = private constant [38 x i8] c"Nach c.add2(+2) c.count=%d c.name=%s\0A\00", align 1

define void @main() {
entry:
  %c = alloca %class.counter
  %0 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 1
  store i64 7, i64* %0
  %1 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8** %1
  %_count = load i64, i64* %0
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0), i64 %_count, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  call void @"init%counter"(%class.counter* %c)
  %_count1 = load i64, i64* %0
  %_name2 = load i8*, i8** %1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.3, i64 0, i64 0), i64 %_count1, i8* %_name2)
  call void @"add%counter"(%class.counter* %c, i64 10)
  %_count3 = load i64, i64* %0
  %_name4 = load i8*, i8** %1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0), i64 %_count3, i8* %_name4)
  call void @"sub%counter"(%class.counter* %c, i64 10)
  %2 = call i64 @"get%counter"(%class.counter* %c)
  %_name5 = load i8*, i8** %1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0), i64 %2, i8* %_name5)
  call void @"_init%counter"(%class.counter* %c, i64 5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0))
  %3 = call i64 @"get%counter"(%class.counter* %c)
  %4 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.7, i64 0, i64 0), i64 %3, i8* %4)
  call void @"add%counter"(%class.counter* %c, i64 5)
  %5 = call i64 @"get%counter"(%class.counter* %c)
  %6 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i64 0, i64 0), i64 %5, i8* %6)
  call void @"sub%counter"(%class.counter* %c, i64 5)
  %7 = call i64 @"get%counter"(%class.counter* %c)
  %8 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.9, i64 0, i64 0), i64 %7, i8* %8)
  call void @add2(%class.counter* %c)
  %_count6 = load i64, i64* %0
  %_name7 = load i8*, i8** %1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.10, i64 0, i64 0), i64 %_count6, i8* %_name7)
  ret void
}

declare void @printf(i8*, ...)

define internal void @"init%counter"(%class.counter* %this) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  store i64 50, i64* %0
  %1 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 0
  store i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i64 0, i64 0), i8** %1
  ret void
}

define internal void @"add%counter"(%class.counter* %this, i64 %element1) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  %_count = load i64, i64* %0
  %mathtmp = add i64 %_count, %element1
  store i64 %mathtmp, i64* %0
  ret void
}

define internal void @"sub%counter"(%class.counter* %this, i64 %element1) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  %_count = load i64, i64* %0
  %mathtmp = sub i64 %_count, %element1
  store i64 %mathtmp, i64* %0
  ret void
}

define internal i64 @"get%counter"(%class.counter* %this) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  %_count = load i64, i64* %0
  ret i64 %_count
}

define internal i8* @"name%counter"(%class.counter* %this) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 0
  %_name = load i8*, i8** %0
  ret i8* %_name
}

define internal void @"_init%counter"(%class.counter* %this, i64 %count1, i8* %name_addr) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  store i64 %count1, i64* %0
  %1 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 0
  store i8* %name_addr, i8** %1
  ret void
}

define internal void @add2(%class.counter* %c_addr) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %c_addr, i32 0, i32 1
  %_count = load i64, i64* %0
  %mathtmp = add i64 %_count, 2
  store i64 %mathtmp, i64* %0
  ret void
}
