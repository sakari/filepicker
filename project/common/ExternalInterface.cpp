#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"


using namespace filepicker;

static void filepicker_dialog () {
    FileSelectionDialog();
}
DEFINE_PRIM (filepicker_dialog, 0);

extern "C" void filepicker_main () {}
DEFINE_ENTRY_POINT (filepicker_main);



extern "C" int filepicker_register_prims () { return 0; }
