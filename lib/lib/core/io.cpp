#include <stdarg.h>
#include <stdio.h>
#include <iostream>
#include <cstring>
#include <cmath>

extern "C" void writef(char* str, ...)
{
   va_list argp;
   va_start(argp, str);
   vprintf(str, argp);
   va_end(argp);
}

extern "C" int readint()
{
   int in;
   std::cin >> in;
   return in;
}

extern "C" double readdouble()
{
   double in;
   std::cin >> in;
   return in;
}

extern "C" char* readstring()
{
   char* in = new char;
   std::cin >> in;
   return in;
}
