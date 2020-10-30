; ModuleID = 'supercritical'
source_filename = "supercritical"

%class.counter = type { i8*, i64 }
%class.pampa = type { i64 }
%class.ups = type { i64 }
%class.memberinit = type { i64, i8* }
%class.simple = type { i64 }
%class.Object = type { i64 }

@.str = private constant [30 x i8] c" bla 1\0Abla '2' \0A\0Abla 3 \22\0A---\0A\00", align 1
@.str.1 = private constant [49 x i8] c"He says:\0A  \22Hello ol' boy\22\0Aand leaves the place\0A\00", align 1
@.str.2 = private constant [4 x i8] c"%d\0A\00", align 1
@.str.3 = private constant [10 x i8] c"upps nix\0A\00", align 1
@.str.4 = private constant [4 x i8] c"%d\0A\00", align 1
@.str.5 = private constant [10 x i8] c"upps nix\0A\00", align 1
@.str.6 = private constant [6 x i8] c"Hi : \00", align 1
@.str.7 = private constant [12 x i8] c"found true\0A\00", align 1
@.str.8 = private constant [13 x i8] c"found false\0A\00", align 1
@.str.9 = private constant [15 x i8] c"makeX(%d, %d)\0A\00", align 1
@.str.10 = private constant [6 x i8] c"e=%d\0A\00", align 1
@.str.11 = private constant [6 x i8] c"j=%d\0A\00", align 1
@.str.12 = private constant [22 x i8] c"Dies ist ein String.\0A\00", align 1
@.str.13 = private constant [6 x i8] c"x=%d\0A\00", align 1
@.str.14 = private constant [4 x i8] c"%d\0A\00", align 1
@.str.15 = private constant [4 x i8] c"%f\0A\00", align 1
@.str.16 = private constant [22 x i8] c"container of elements\00", align 1
@.str.17 = private constant [5 x i8] c"leer\00", align 1
@.str.18 = private constant [22 x i8] c"c.count=%d c.name=%s\0A\00", align 1
@.str.19 = private constant [34 x i8] c"Nach init() c.count=%d c.name=%s\0A\00", align 1
@.str.20 = private constant [33 x i8] c"Nach add() c.count=%d c.name=%s\0A\00", align 1
@.str.21 = private constant [33 x i8] c"Nach sub() c.count=%d c.name=%s\0A\00", align 1
@.str.22 = private constant [4 x i8] c"neu\00", align 1
@.str.23 = private constant [35 x i8] c"Nach _init() c.count=%d c.name=%s\0A\00", align 1
@.str.24 = private constant [36 x i8] c"Nach add(c,5) c.count=%d c.name=%s\0A\00", align 1
@.str.25 = private constant [36 x i8] c"Nach sub(c,5) c.count=%d c.name=%s\0A\00", align 1
@.str.26 = private constant [36 x i8] c"Nach c.add2() c.count=%d c.name=%s\0A\00", align 1
@.str.27 = private constant [11 x i8] c"Max is %d\0A\00", align 1
@.str.28 = private constant [11 x i8] c"Min is %d\0A\00", align 1
@.str.29 = private constant [14 x i8] c"testif is %d\0A\00", align 1
@.str.30 = private constant [17 x i8] c"testifMax is %d\0A\00", align 1
@.str.31 = private constant [32 x i8] c"p.get() returns %d should be 7\0A\00", align 1
@.str.32 = private constant [32 x i8] c"p.get() returns %d should be 7\0A\00", align 1
@.str.33 = private constant [26 x i8] c"a returns %d should be 7\0A\00", align 1
@.str.34 = private constant [26 x i8] c"a returns %d should be 5\0A\00", align 1
@.str.35 = private constant [32 x i8] c"p.get() returns %d should be 5\0A\00", align 1
@.str.36 = private constant [32 x i8] c"u.get() returns %d should be 9\0A\00", align 1
@.str.37 = private constant [6 x i8] c"empty\00", align 1
@.str.38 = private constant [49 x i8] c"membInit.count=%d (25) membInit.name=%s (empty)\0A\00", align 1
@.str.39 = private constant [31 x i8] c"ps.get returns %d should be 5\0A\00", align 1
@.str.40 = private constant [16 x i8] c"id = %d x = %d\0A\00", align 1
@.str.41 = private constant [6 x i8] c"Hello\00", align 1
@.str.42 = private constant [19 x i8] c"otto = %s (Hello)\0A\00", align 1
@.str.43 = private constant [9 x i8] c"It's me.\00", align 1
@.str.44 = private constant [22 x i8] c"otto = %s (It's me.)\0A\00", align 1
@.str.45 = private constant [42 x i8] c"Test FP BinOps (+,-,*,/) %lf %lf %lf %lf\0A\00", align 1
@.str.46 = private constant [25 x i8] c"obj.get_int() = %d (42)\0A\00", align 1

define void @main() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.1, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i64 0, i64 0))
  br label %loop14

loop14:                                           ; preds = %entry, %loop14
  %id.1 = phi i64 [ 3, %entry ], [ %mathtmp16, %loop14 ]
  %mathtmp16 = sub i64 %id.1, 1
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i64 %mathtmp16)
  %cmptmp13 = icmp sgt i64 %mathtmp16, 0
  br i1 %cmptmp13, label %loop14, label %merge19

merge19:                                          ; preds = %loop14
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0))
  %bool = alloca i1
  store i1 true, i1* %bool
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.7, i64 0, i64 0))
  %_abc = alloca i64
  store i64 1, i64* %_abc
  %a = alloca i64
  store i64 1, i64* %a
  %b = alloca i64
  store i64 2, i64* %b
  %a-b = alloca i64
  %a24 = load i64, i64* %a
  %mathtmp25 = sub i64 %a24, 2
  store i64 %mathtmp25, i64* %a-b
  %d = alloca i1
  %b27 = load i64, i64* %b
  %mathtmp28 = or i64 %b27, %mathtmp25
  %a29 = load i64, i64* %a
  %mathtmp30 = and i64 %a29, %mathtmp28
  %cast = trunc i64 %mathtmp30 to i1
  store i1 %cast, i1* %d
  %e = alloca i64
  %a-b31 = load i64, i64* %a-b
  %b32 = load i64, i64* %b
  %a33 = load i64, i64* %a
  %mathtmp34 = mul i64 %a33, %b32
  %mathtmp35 = add i64 %mathtmp34, %a-b31
  store i64 %mathtmp35, i64* %e
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.10, i64 0, i64 0), i64 %mathtmp35)
  %a37 = load i64, i64* %a
  %b38 = load i64, i64* %b
  %0 = call i64 @makeX(i64 %a37, i64 %b38)
  store i64 %0, i64* %e
  %i = alloca i64
  store i64 5, i64* %i
  %j = alloca i64
  store i64 -6, i64* %j
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.11, i64 0, i64 0), i64 -6)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.12, i64 0, i64 0))
  %x = alloca i64
  %1 = call i64 @makeX(i64 3, i64 4)
  store i64 %1, i64* %x
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.13, i64 0, i64 0), i64 %1)
  %x43 = load i64, i64* %x
  %cmptmp44 = icmp slt i64 %x43, 6
  br i1 %cmptmp44, label %then45, label %else51

then45:                                           ; preds = %merge19
  %mathtmp47 = add i64 %x43, 6
  %mathtmp49 = mul i64 %mathtmp47, 2
  store i64 %mathtmp49, i64* %x
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), i64 %mathtmp49)
  br label %merge52

else51:                                           ; preds = %merge19
  store i64 4, i64* %x
  br label %merge52

merge52:                                          ; preds = %else51, %then45
  %dval = alloca double
  store double 0x3FDEAEE8744B05F0, double* %dval
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), double 0x3FDEAEE8744B05F0)
  %c = alloca %class.counter
  %2 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 1
  store i64 7, i64* %2
  %3 = getelementptr %class.counter, %class.counter* %c, i32 0, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0), i8** %3
  %_count = load i64, i64* %2
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.18, i64 0, i64 0), i64 %_count, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i64 0, i64 0))
  call void @"init%counter"(%class.counter* %c)
  %_count55 = load i64, i64* %2
  %_name56 = load i8*, i8** %3
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.19, i64 0, i64 0), i64 %_count55, i8* %_name56)
  call void @"add%counter"(%class.counter* %c, i64 10)
  %_count57 = load i64, i64* %2
  %_name58 = load i8*, i8** %3
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.20, i64 0, i64 0), i64 %_count57, i8* %_name58)
  call void @"sub%counter"(%class.counter* %c, i64 10)
  %4 = call i64 @"get%counter"(%class.counter* %c)
  %_name59 = load i8*, i8** %3
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.21, i64 0, i64 0), i64 %4, i8* %_name59)
  call void @"_init%counter"(%class.counter* %c, i64 5, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i64 0, i64 0))
  %5 = call i64 @"get%counter"(%class.counter* %c)
  %6 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.23, i64 0, i64 0), i64 %5, i8* %6)
  call void @"add%counter"(%class.counter* %c, i64 5)
  %7 = call i64 @"get%counter"(%class.counter* %c)
  %8 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.24, i64 0, i64 0), i64 %7, i8* %8)
  call void @"sub%counter"(%class.counter* %c, i64 5)
  %9 = call i64 @"get%counter"(%class.counter* %c)
  %10 = call i8* @"name%counter"(%class.counter* %c)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.25, i64 0, i64 0), i64 %9, i8* %10)
  call void @add2(%class.counter* %c)
  %_count60 = load i64, i64* %2
  %_name61 = load i8*, i8** %3
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.26, i64 0, i64 0), i64 %_count60, i8* %_name61)
  %m = alloca i64
  %11 = call i64 @max(i64 1, i64 10)
  store i64 %11, i64* %m
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.27, i64 0, i64 0), i64 %11)
  %12 = call i64 @min(i64 1, i64 10)
  store i64 %12, i64* %m
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.28, i64 0, i64 0), i64 %12)
  %n = alloca i64
  %13 = call i64 @testif(i64 1, i64 10)
  store i64 %13, i64* %n
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.29, i64 0, i64 0), i64 %13)
  %14 = call i64 @testifMax(i64 1, i64 10)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.30, i64 0, i64 0), i64 %14)
  %p = alloca %class.pampa
  %15 = getelementptr %class.pampa, %class.pampa* %p, i32 0, i32 0
  store i64 5, i64* %15
  call void @f(%class.pampa* %p)
  %16 = call i64 @"get%pampa"(%class.pampa* %p)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.31, i64 0, i64 0), i64 %16)
  store i64 5, i64* %15
  call void @f(%class.pampa* %p)
  %17 = call i64 @"get%pampa"(%class.pampa* %p)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.32, i64 0, i64 0), i64 %17)
  %18 = call i64 @"get%pampa"(%class.pampa* %p)
  store i64 %18, i64* %a
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.33, i64 0, i64 0), i64 %18)
  store i64 5, i64* %15
  %t = alloca %class.pampa
  %p66 = load %class.pampa, %class.pampa* %p
  store %class.pampa %p66, %class.pampa* %t
  %19 = call i64 @"get%pampa"(%class.pampa* %t)
  store i64 %19, i64* %a
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.34, i64 0, i64 0), i64 %19)
  %20 = call i64 @"get%pampa"(%class.pampa* %p)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.35, i64 0, i64 0), i64 %20)
  %u = alloca %class.ups
  call void @"__init__%ups"(%class.ups* %u)
  %21 = call i64 @"get%ups"(%class.ups* %u)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.36, i64 0, i64 0), i64 %21)
  %membInit = alloca %class.memberinit
  %22 = getelementptr %class.memberinit, %class.memberinit* %membInit, i32 0, i32 0
  store i64 25, i64* %22
  %23 = getelementptr %class.memberinit, %class.memberinit* %membInit, i32 0, i32 1
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0), i8** %23
  %_count68 = load i64, i64* %22
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.38, i64 0, i64 0), i64 %_count68, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.37, i64 0, i64 0))
  %ps = alloca %class.simple
  %24 = getelementptr %class.simple, %class.simple* %ps, i32 0, i32 0
  store i64 5, i64* %24
  store i64 5, i64* %i
  %25 = call i64 @"get%simple"(%class.simple* %ps)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.39, i64 0, i64 0), i64 %25)
  call void @test_var()
  %af = alloca double
  store double 4.000000e+00, double* %af
  %bf = alloca double
  store double -1.000000e+00, double* %bf
  %cf = alloca double
  store double 3.750000e+00, double* %cf
  %df = alloca double
  store double 6.000000e-01, double* %df
  %af74 = load double, double* %af
  %bf75 = load double, double* %bf
  %cf76 = load double, double* %cf
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.45, i64 0, i64 0), double %af74, double %bf75, double %cf76, double 6.000000e-01)
  %o = alloca %class.Object
  %26 = getelementptr %class.Object, %class.Object* %o, i32 0, i32 0
  store i64 0, i64* %26
  call void @"set_int%Object"(%class.Object* %o, i64 42)
  %o78 = load %class.Object, %class.Object* %o
  %obj = alloca %class.Object
  store %class.Object %o78, %class.Object* %obj
  %27 = call i64 @"get_int%Object"(%class.Object* %obj)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.46, i64 0, i64 0), i64 %27)
  ret void
}

declare void @printf(i8*, ...)

define internal double @sin(double %x1) {
entry:
  %cmptmp = fcmp olt double %x1, 0.000000e+00
  br i1 %cmptmp, label %then, label %merge

then:                                             ; preds = %entry
  %mathtmp = fmul double %x1, -1.000000e+00
  br label %merge

merge:                                            ; preds = %entry, %then
  %x.0 = phi double [ %mathtmp, %then ], [ %x1, %entry ]
  %sign.0 = phi double [ -1.000000e+00, %then ], [ 1.000000e+00, %entry ]
  %cmptmp8 = fcmp ogt double %x.0, 3.600000e+02
  br i1 %cmptmp8, label %then9, label %merge16

then9:                                            ; preds = %merge
  %mathtmp11 = fdiv double %x.0, 3.600000e+02
  %mathtmp12 = fmul double %mathtmp11, 3.600000e+02
  %mathtmp14 = fsub double %x.0, %mathtmp12
  br label %merge16

merge16:                                          ; preds = %merge, %then9
  %x.1 = phi double [ %mathtmp14, %then9 ], [ %x.0, %merge ]
  %mathtmp18 = fmul double %x.1, 3.140000e+00
  %mathtmp19 = fdiv double %mathtmp18, 1.800000e+02
  %res1 = alloca double
  store double 0.000000e+00, double* %res1
  %term1 = alloca double
  store double %mathtmp19, double* %term1
  %k1 = alloca i64
  store i64 1, i64* %k1
  %res121 = load double, double* %res1
  %term122 = load double, double* %term1
  %mathtmp24 = fadd double %res121, %term122
  %cmptmp25 = fcmp one double %mathtmp24, %res121
  br i1 %cmptmp25, label %loop, label %merge52

loop:                                             ; preds = %loop, %merge16
  %term131 = load double, double* %term1
  %res132 = load double, double* %res1
  %mathtmp33 = fadd double %res132, %term131
  store double %mathtmp33, double* %res1
  %k134 = load i64, i64* %k1
  %mathtmp35 = add i64 %k134, 2
  store i64 %mathtmp35, i64* %k1
  %mathtmp37 = sub i64 %mathtmp35, 1
  %mathtmp41 = fmul double -1.000000e+00, %mathtmp19
  %term142 = load double, double* %term1
  %mathtmp43 = fmul double %term142, %mathtmp41
  %mathtmp44 = fmul double %mathtmp43, %mathtmp19
  %castdb45 = sitofp i64 %mathtmp35 to double
  %mathtmp47 = fdiv double %mathtmp44, %castdb45
  %castdb48 = sitofp i64 %mathtmp37 to double
  %mathtmp50 = fdiv double %mathtmp47, %castdb48
  store double %mathtmp50, double* %term1
  %res126 = load double, double* %res1
  %mathtmp29 = fadd double %res126, %mathtmp50
  %cmptmp30 = fcmp one double %mathtmp29, %res126
  br i1 %cmptmp30, label %loop, label %merge52

merge52:                                          ; preds = %merge16, %loop
  %res153 = load double, double* %res1
  %mathtmp55 = fmul double %sign.0, %res153
  ret double %mathtmp55
}

define internal double @cos(double %x1) {
entry:
  %cmptmp = fcmp olt double %x1, 0.000000e+00
  br i1 %cmptmp, label %then, label %merge

then:                                             ; preds = %entry
  %mathtmp = fmul double %x1, -1.000000e+00
  br label %merge

merge:                                            ; preds = %entry, %then
  %x.0 = phi double [ %mathtmp, %then ], [ %x1, %entry ]
  %cmptmp5 = fcmp ogt double %x.0, 3.600000e+02
  br i1 %cmptmp5, label %then6, label %merge13

then6:                                            ; preds = %merge
  %mathtmp8 = fdiv double %x.0, 3.600000e+02
  %mathtmp9 = fmul double %mathtmp8, 3.600000e+02
  %mathtmp11 = fsub double %x.0, %mathtmp9
  br label %merge13

merge13:                                          ; preds = %merge, %then6
  %x.1 = phi double [ %mathtmp11, %then6 ], [ %x.0, %merge ]
  %mathtmp15 = fmul double %x.1, 3.140000e+00
  %mathtmp16 = fdiv double %mathtmp15, 1.800000e+02
  %res2 = alloca double
  store double 0.000000e+00, double* %res2
  %term2 = alloca double
  store double 1.000000e+00, double* %term2
  %k2 = alloca i64
  store i64 0, i64* %k2
  %res217 = load double, double* %res2
  %term218 = load double, double* %term2
  %mathtmp20 = fadd double %res217, %term218
  %cmptmp21 = fcmp one double %mathtmp20, %res217
  br i1 %cmptmp21, label %loop, label %merge47

loop:                                             ; preds = %loop, %merge13
  %term227 = load double, double* %term2
  %res228 = load double, double* %res2
  %mathtmp29 = fadd double %res228, %term227
  store double %mathtmp29, double* %res2
  %k230 = load i64, i64* %k2
  %mathtmp31 = add i64 %k230, 2
  store i64 %mathtmp31, i64* %k2
  %mathtmp33 = sub i64 %mathtmp31, 1
  %mathtmp37 = fmul double -1.000000e+00, %mathtmp16
  %term238 = load double, double* %term2
  %mathtmp39 = fmul double %term238, %mathtmp37
  %mathtmp40 = fmul double %mathtmp39, %mathtmp16
  %castdb = sitofp i64 %mathtmp31 to double
  %mathtmp42 = fdiv double %mathtmp40, %castdb
  %castdb43 = sitofp i64 %mathtmp33 to double
  %mathtmp45 = fdiv double %mathtmp42, %castdb43
  store double %mathtmp45, double* %term2
  %res222 = load double, double* %res2
  %mathtmp25 = fadd double %res222, %mathtmp45
  %cmptmp26 = fcmp one double %mathtmp25, %res222
  br i1 %cmptmp26, label %loop, label %merge47

merge47:                                          ; preds = %merge13, %loop
  %res248 = load double, double* %res2
  ret double %res248
}

define internal double @pow(double %base1, double %power2) {
entry:
  %cmptmp = fcmp olt double 0.000000e+00, %power2
  br i1 %cmptmp, label %loop, label %merge

loop:                                             ; preds = %loop, %entry
  %pow.0 = phi double [ %base1, %entry ], [ %mathtmp, %loop ]
  %i.0 = phi i64 [ 0, %entry ], [ %mathtmp15, %loop ]
  %mathtmp = fmul double %pow.0, %base1
  %mathtmp15 = add i64 %i.0, 1
  %castdb10 = sitofp i64 %mathtmp15 to double
  %cmptmp11 = fcmp olt double %castdb10, %power2
  br i1 %cmptmp11, label %loop, label %merge

merge:                                            ; preds = %entry, %loop
  %pow.1 = phi double [ %mathtmp, %loop ], [ %base1, %entry ]
  ret double %pow.1
}

define internal double @root(double %base1, double %power2) {
entry:
  %mathtmp = fdiv double %base1, %base1
  %mathtmp8 = fsub double %base1, %mathtmp
  %cmptmp = fcmp ogt double %mathtmp8, 1.000000e-05
  br i1 %cmptmp, label %loop, label %merge

loop:                                             ; preds = %loop, %entry
  %root.0 = phi double [ %base1, %entry ], [ %mathtmp22, %loop ]
  %mathtmp19 = fdiv double %base1, %root.0
  %mathtmp21 = fadd double %root.0, %mathtmp19
  %mathtmp22 = fdiv double %mathtmp21, %power2
  %mathtmp12 = fdiv double %base1, %mathtmp22
  %mathtmp14 = fsub double %mathtmp22, %mathtmp12
  %cmptmp15 = fcmp ogt double %mathtmp14, 1.000000e-05
  br i1 %cmptmp15, label %loop, label %merge

merge:                                            ; preds = %entry, %loop
  %root.1 = phi double [ %mathtmp22, %loop ], [ %base1, %entry ]
  ret double %root.1
}

define internal i64 @makeX(i64 %x1, i64 %y2) {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), i64 %x1, i64 %y2)
  %mathtmp = add i64 %x1, %y2
  ret i64 %mathtmp
}

define internal void @"init%counter"(%class.counter* %this) {
entry:
  %0 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 1
  store i64 50, i64* %0
  %1 = getelementptr %class.counter, %class.counter* %this, i32 0, i32 0
  store i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.16, i64 0, i64 0), i8** %1
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

define internal i64 @max(i64 %a1, i64 %b2) {
entry:
  %cmptmp = icmp sgt i64 %a1, %b2
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  ret i64 %a1

else:                                             ; preds = %entry
  ret i64 %b2
}

define internal i64 @min(i64 %a1, i64 %b2) {
entry:
  %cmptmp = icmp sgt i64 %a1, %b2
  br i1 %cmptmp, label %then, label %merge

then:                                             ; preds = %entry
  ret i64 %b2

merge:                                            ; preds = %entry
  ret i64 %a1
}

define internal i64 @testif(i64 %a1, i64 %b2) {
entry:
  %cmptmp = icmp eq i64 %a1, %b2
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  ret i64 %a1

else:                                             ; preds = %entry
  ret i64 %b2
}

define internal i64 @testifMax(i64 %a1, i64 %b2) {
entry:
  %cmptmp = icmp sgt i64 %a1, %b2
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  br label %merge

else:                                             ; preds = %entry
  br label %merge

merge:                                            ; preds = %else, %then
  %max.0 = phi i64 [ %a1, %then ], [ %b2, %else ]
  ret i64 %max.0
}

define internal i64 @"get%pampa"(%class.pampa* %this) {
entry:
  %0 = getelementptr %class.pampa, %class.pampa* %this, i32 0, i32 0
  %myint = load i64, i64* %0
  ret i64 %myint
}

define internal void @f(%class.pampa* %p_addr) {
entry:
  %0 = getelementptr %class.pampa, %class.pampa* %p_addr, i32 0, i32 0
  store i64 7, i64* %0
  ret void
}

define internal void @"__init__%ups"(%class.ups* %this) {
entry:
  %0 = getelementptr %class.ups, %class.ups* %this, i32 0, i32 0
  store i64 9, i64* %0
  ret void
}

define internal i64 @"get%ups"(%class.ups* %this) {
entry:
  %0 = getelementptr %class.ups, %class.ups* %this, i32 0, i32 0
  %ppp = load i64, i64* %0
  ret i64 %ppp
}

define internal i64 @"get%simple"(%class.simple* %this) {
entry:
  %0 = getelementptr %class.simple, %class.simple* %this, i32 0, i32 0
  %myint = load i64, i64* %0
  ret i64 %myint
}

define internal void @test_var() {
entry:
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.40, i64 0, i64 0), i64 5, i64 29)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.42, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.41, i64 0, i64 0))
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.44, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.43, i64 0, i64 0))
  ret void
}

define internal void @"set_int%Object"(%class.Object* %this, i64 %value1) {
entry:
  %0 = getelementptr %class.Object, %class.Object* %this, i32 0, i32 0
  store i64 %value1, i64* %0
  ret void
}

define internal i64 @"get_int%Object"(%class.Object* %this) {
entry:
  %0 = getelementptr %class.Object, %class.Object* %this, i32 0, i32 0
  %i = load i64, i64* %0
  ret i64 %i
}
