#include <iostream>
#include <stdio.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

extern "C"
{
   EMSCRIPTEN_KEEPALIVE
   const char *hello()
   {
      return "Hello World!";
   }
}