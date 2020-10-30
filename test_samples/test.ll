; ModuleID = 'supercritical'
source_filename = "supercritical"

@.str = private global [20 x i8] c"pow(10.0, 2.0): %f\0A\00", align 1
@.str.1 = private global [22 x i8] c"root(100.0, 2.0): %f\0A\00", align 1
@.str.2 = private global [14 x i8] c"sin(1.0): %f\0A\00", align 1
@.str.3 = private global [14 x i8] c"cos(1.0): %f\0A\00", align 1
@.str.4 = private global [14 x i8] c"tan(1.0): %f\0A\00", align 1
@.str.5 = private global [14 x i8] c"cot(1.0): %f\0A\00", align 1
@.str.6 = private global [14 x i8] c"sec(1.0): %f\0A\00", align 1
@.str.7 = private global [14 x i8] c"csc(1.0): %f\0A\00", align 1

define void @main() {
entry:
  %0 = call double @pow(double 1.000000e+01, double 2.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), double %0)
  %1 = call double @root(double 1.000000e+02, double 2.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0), double %1)
  %2 = call double @sin(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0), double %2)
  %3 = call double @cos(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), double %3)
  %4 = call double @tan(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), double %4)
  %5 = call double @cot(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i64 0, i64 0), double %5)
  %6 = call double @sec(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.6, i64 0, i64 0), double %6)
  %7 = call double @csc(double 1.000000e+00)
  call void (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), double %7)
  ret void
}

declare void @printf(i8*, ...)

declare void @scanf(i8*, ...)

define internal double @sin(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %sign = alloca double
  store double 1.000000e+00, double* %sign
  %x2 = load double, double* %x
  %castdb = sitofp i64 0 to double
  %castdb3 = bitcast double %x2 to double
  %cmptmp = fcmp olt double %castdb3, %castdb
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  store double -1.000000e+00, double* %sign
  %x4 = load double, double* %x
  %mathtmp = fmul double %x4, -1.000000e+00
  store double %mathtmp, double* %x
  br label %merge

else:                                             ; preds = %entry
  br label %merge

merge:                                            ; preds = %else, %then
  %x5 = load double, double* %x
  %castdb6 = sitofp i64 360 to double
  %castdb7 = bitcast double %x5 to double
  %cmptmp8 = fcmp ogt double %castdb7, %castdb6
  br i1 %cmptmp8, label %then9, label %else15

then9:                                            ; preds = %merge
  %x10 = load double, double* %x
  %mathtmp11 = fdiv double %x10, 3.600000e+02
  %mathtmp12 = fmul double %mathtmp11, 3.600000e+02
  %x13 = load double, double* %x
  %mathtmp14 = fsub double %x13, %mathtmp12
  store double %mathtmp14, double* %x
  br label %merge16

else15:                                           ; preds = %merge
  br label %merge16

merge16:                                          ; preds = %else15, %then9
  %x17 = load double, double* %x
  %mathtmp18 = fmul double %x17, 3.140000e+00
  %mathtmp19 = fdiv double %mathtmp18, 1.800000e+02
  store double %mathtmp19, double* %x
  %res1 = alloca double
  store double 0.000000e+00, double* %res1
  %term1 = alloca double
  %x20 = load double, double* %x
  store double %x20, double* %term1
  %k1 = alloca i64
  store i64 1, i64* %k1
  br label %firstcond

firstcond:                                        ; preds = %merge16
  %res121 = load double, double* %res1
  %term122 = load double, double* %term1
  %res123 = load double, double* %res1
  %mathtmp24 = fadd double %res123, %term122
  %cmptmp25 = fcmp one double %mathtmp24, %res121
  br i1 %cmptmp25, label %loop, label %else51

cond:                                             ; preds = %loop
  %res126 = load double, double* %res1
  %term127 = load double, double* %term1
  %res128 = load double, double* %res1
  %mathtmp29 = fadd double %res128, %term127
  %cmptmp30 = fcmp one double %mathtmp29, %res126
  br i1 %cmptmp30, label %loop, label %merge52

loop:                                             ; preds = %cond, %firstcond
  %term131 = load double, double* %term1
  %res132 = load double, double* %res1
  %mathtmp33 = fadd double %res132, %term131
  store double %mathtmp33, double* %res1
  %k134 = load i64, i64* %k1
  %mathtmp35 = add i64 %k134, 2
  store i64 %mathtmp35, i64* %k1
  %k136 = load i64, i64* %k1
  %mathtmp37 = sub i64 %k136, 1
  %k138 = load i64, i64* %k1
  %x39 = load double, double* %x
  %x40 = load double, double* %x
  %mathtmp41 = fmul double -1.000000e+00, %x40
  %term142 = load double, double* %term1
  %mathtmp43 = fmul double %term142, %mathtmp41
  %mathtmp44 = fmul double %mathtmp43, %x39
  %castdb45 = sitofp i64 %k138 to double
  %castdb46 = bitcast double %mathtmp44 to double
  %mathtmp47 = fdiv double %castdb46, %castdb45
  %castdb48 = sitofp i64 %mathtmp37 to double
  %castdb49 = bitcast double %mathtmp47 to double
  %mathtmp50 = fdiv double %castdb49, %castdb48
  store double %mathtmp50, double* %term1
  br label %cond

else51:                                           ; preds = %firstcond
  br label %merge52

merge52:                                          ; preds = %else51, %cond
  %res153 = load double, double* %res1
  %sign54 = load double, double* %sign
  %mathtmp55 = fmul double %sign54, %res153
  ret double %mathtmp55
}

define internal double @cos(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %x2 = load double, double* %x
  %cmptmp = fcmp olt double %x2, 0.000000e+00
  br i1 %cmptmp, label %then, label %else

then:                                             ; preds = %entry
  %x3 = load double, double* %x
  %mathtmp = fmul double %x3, -1.000000e+00
  store double %mathtmp, double* %x
  br label %merge

else:                                             ; preds = %entry
  br label %merge

merge:                                            ; preds = %else, %then
  %x4 = load double, double* %x
  %cmptmp5 = fcmp ogt double %x4, 3.600000e+02
  br i1 %cmptmp5, label %then6, label %else12

then6:                                            ; preds = %merge
  %x7 = load double, double* %x
  %mathtmp8 = fdiv double %x7, 3.600000e+02
  %mathtmp9 = fmul double %mathtmp8, 3.600000e+02
  %x10 = load double, double* %x
  %mathtmp11 = fsub double %x10, %mathtmp9
  store double %mathtmp11, double* %x
  br label %merge13

else12:                                           ; preds = %merge
  br label %merge13

merge13:                                          ; preds = %else12, %then6
  %x14 = load double, double* %x
  %mathtmp15 = fmul double %x14, 3.140000e+00
  %mathtmp16 = fdiv double %mathtmp15, 1.800000e+02
  store double %mathtmp16, double* %x
  %res2 = alloca double
  store double 0.000000e+00, double* %res2
  %term2 = alloca double
  store double 1.000000e+00, double* %term2
  %k2 = alloca i64
  store i64 0, i64* %k2
  br label %firstcond

firstcond:                                        ; preds = %merge13
  %res217 = load double, double* %res2
  %term218 = load double, double* %term2
  %res219 = load double, double* %res2
  %mathtmp20 = fadd double %res219, %term218
  %cmptmp21 = fcmp one double %mathtmp20, %res217
  br i1 %cmptmp21, label %loop, label %else46

cond:                                             ; preds = %loop
  %res222 = load double, double* %res2
  %term223 = load double, double* %term2
  %res224 = load double, double* %res2
  %mathtmp25 = fadd double %res224, %term223
  %cmptmp26 = fcmp one double %mathtmp25, %res222
  br i1 %cmptmp26, label %loop, label %merge47

loop:                                             ; preds = %cond, %firstcond
  %term227 = load double, double* %term2
  %res228 = load double, double* %res2
  %mathtmp29 = fadd double %res228, %term227
  store double %mathtmp29, double* %res2
  %k230 = load i64, i64* %k2
  %mathtmp31 = add i64 %k230, 2
  store i64 %mathtmp31, i64* %k2
  %k232 = load i64, i64* %k2
  %mathtmp33 = sub i64 %k232, 1
  %k234 = load i64, i64* %k2
  %x35 = load double, double* %x
  %x36 = load double, double* %x
  %mathtmp37 = fmul double -1.000000e+00, %x36
  %term238 = load double, double* %term2
  %mathtmp39 = fmul double %term238, %mathtmp37
  %mathtmp40 = fmul double %mathtmp39, %x35
  %castdb = sitofp i64 %k234 to double
  %castdb41 = bitcast double %mathtmp40 to double
  %mathtmp42 = fdiv double %castdb41, %castdb
  %castdb43 = sitofp i64 %mathtmp33 to double
  %castdb44 = bitcast double %mathtmp42 to double
  %mathtmp45 = fdiv double %castdb44, %castdb43
  store double %mathtmp45, double* %term2
  br label %cond

else46:                                           ; preds = %firstcond
  br label %merge47

merge47:                                          ; preds = %else46, %cond
  %res248 = load double, double* %res2
  ret double %res248
}

define internal double @tan(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %x2 = load double, double* %x
  %0 = call double @cos(double %x2)
  %x3 = load double, double* %x
  %1 = call double @sin(double %x3)
  %mathtmp = fdiv double %1, %0
  ret double %mathtmp
}

define internal double @cot(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %x2 = load double, double* %x
  %0 = call double @sin(double %x2)
  %x3 = load double, double* %x
  %1 = call double @cos(double %x3)
  %mathtmp = fdiv double %1, %0
  ret double %mathtmp
}

define internal double @sec(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %x2 = load double, double* %x
  %0 = call double @cos(double %x2)
  %castdb = bitcast double %0 to double
  %castdb3 = sitofp i64 1 to double
  %mathtmp = fdiv double %castdb3, %castdb
  ret double %mathtmp
}

define internal double @csc(double %x1) {
entry:
  %x = alloca double
  store double %x1, double* %x
  %x2 = load double, double* %x
  %0 = call double @sin(double %x2)
  %castdb = bitcast double %0 to double
  %castdb3 = sitofp i64 1 to double
  %mathtmp = fdiv double %castdb3, %castdb
  ret double %mathtmp
}

define internal double @pow(double %base1, double %power2) {
entry:
  %base = alloca double
  store double %base1, double* %base
  %power = alloca double
  store double %power2, double* %power
  %pow = alloca double
  %base3 = load double, double* %base
  store double %base3, double* %pow
  %i = alloca i64
  store i64 0, i64* %i
  br label %firstcond

firstcond:                                        ; preds = %entry
  %power4 = load double, double* %power
  %i5 = load i64, i64* %i
  %castdb = bitcast double %power4 to double
  %castdb6 = sitofp i64 %i5 to double
  %cmptmp = fcmp olt double %castdb6, %castdb
  br i1 %cmptmp, label %loop, label %else

cond:                                             ; preds = %loop
  %power7 = load double, double* %power
  %i8 = load i64, i64* %i
  %castdb9 = bitcast double %power7 to double
  %castdb10 = sitofp i64 %i8 to double
  %cmptmp11 = fcmp olt double %castdb10, %castdb9
  br i1 %cmptmp11, label %loop, label %merge

loop:                                             ; preds = %cond, %firstcond
  %base12 = load double, double* %base
  %pow13 = load double, double* %pow
  %mathtmp = fmul double %pow13, %base12
  store double %mathtmp, double* %pow
  %i14 = load i64, i64* %i
  %mathtmp15 = add i64 %i14, 1
  store i64 %mathtmp15, i64* %i
  br label %cond

else:                                             ; preds = %firstcond
  br label %merge

merge:                                            ; preds = %else, %cond
  %pow16 = load double, double* %pow
  ret double %pow16
}

define internal double @root(double %base1, double %power2) {
entry:
  %base = alloca double
  store double %base1, double* %base
  %power = alloca double
  store double %power2, double* %power
  %root = alloca double
  %base3 = load double, double* %base
  store double %base3, double* %root
  %error = alloca double
  store double 1.000000e-05, double* %error
  %i = alloca i64
  store i64 0, i64* %i
  br label %firstcond

firstcond:                                        ; preds = %entry
  %error4 = load double, double* %error
  %root5 = load double, double* %root
  %base6 = load double, double* %base
  %mathtmp = fdiv double %base6, %root5
  %root7 = load double, double* %root
  %mathtmp8 = fsub double %root7, %mathtmp
  %cmptmp = fcmp ogt double %mathtmp8, %error4
  br i1 %cmptmp, label %loop, label %else

cond:                                             ; preds = %loop
  %error9 = load double, double* %error
  %root10 = load double, double* %root
  %base11 = load double, double* %base
  %mathtmp12 = fdiv double %base11, %root10
  %root13 = load double, double* %root
  %mathtmp14 = fsub double %root13, %mathtmp12
  %cmptmp15 = fcmp ogt double %mathtmp14, %error9
  br i1 %cmptmp15, label %loop, label %merge

loop:                                             ; preds = %cond, %firstcond
  %power16 = load double, double* %power
  %root17 = load double, double* %root
  %base18 = load double, double* %base
  %mathtmp19 = fdiv double %base18, %root17
  %root20 = load double, double* %root
  %mathtmp21 = fadd double %root20, %mathtmp19
  %mathtmp22 = fdiv double %mathtmp21, %power16
  store double %mathtmp22, double* %root
  br label %cond

else:                                             ; preds = %firstcond
  br label %merge

merge:                                            ; preds = %else, %cond
  %root23 = load double, double* %root
  ret double %root23
}
