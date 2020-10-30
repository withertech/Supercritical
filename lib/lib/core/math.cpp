#include <cstring>
#include <stdarg.h>
#include <stdio.h>
#include <cmath>

extern "C" double sin(double x)
{
   return std::sin(float(x));
}

extern "C" double cos(double x)
{
   return std::cos(float(x));
}

extern "C" double tan(double x)
{
   return std::sin(float(x))/std::cos(float(x));
}

extern "C" double cot(double x)
{
   return std::cos(float(x))/std::sin(float(x));
}

extern "C" double sec(double x)
{
   return 1/std::cos(float(x));
}

extern "C" double csc(double x)
{
   return 1/std::sin(float(x));
}

extern "C" double pow(double base, double power)
{
   return std::pow(float(base), float(power));
}

extern "C" double root(double base, double power)
{
   return std::pow(float(base), 1/float(power));
}
