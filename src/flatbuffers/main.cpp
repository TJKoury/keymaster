#include <iostream>
#include <stdio.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

extern "C"
{
#ifdef __EMSCRIPTEN__
   EMSCRIPTEN_KEEPALIVE
#endif
   char *hello()
   {
      return "Hello World!";
   }
}