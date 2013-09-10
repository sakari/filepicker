#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif


#include <hx/CFFI.h>
#include "Utils.h"
#include <iostream.h>


using namespace filepicker;

value * _callback, * _save_callback;

static void callback(const char * urls[], int size) {
    value a = alloc_array(size);
    for(int i = 0; i < size; i++) {
        val_array_set_i(a, i, alloc_string(urls[i]));
    }
    value cb = *_callback;
    free_root(_callback);
    _callback = NULL;
    val_call1(cb, a);
}

static void save_callback(const char * url) {
    value cb = *_save_callback;
    free_root(_save_callback);
    _save_callback = NULL;
    if(url == NULL) {
        val_call1(cb, alloc_null());
        return;
    }
    val_call1(cb, alloc_string(url));
}

static void save_dialog(value extensions, value cb) {
    const char * exts[val_array_size(extensions)];
    for(int i = 0; i < val_array_size(extensions); i++) {
        exts[i] = val_get_string(val_array_i(extensions, i));
    }
    if(_save_callback != NULL) {
        cout << "i'm not re-entrant";
    }
    _save_callback = alloc_root();
    *_save_callback = cb;
    SaveSelectionDialog(val_array_size(extensions) ? exts : NULL
                        , val_array_size(extensions)
                        , save_callback);
}
DEFINE_PRIM (save_dialog, 2);

static void filepicker_dialog (value files
                               , value dirs
                               , value multi
                               , value aliases
                               , value cb) {
    if(_callback != NULL) {
        cout << "i'm not re-entrant";
    }
    _callback = alloc_root();
    *_callback = cb;

    FileSelectionDialog(val_get_bool(files)
                        , val_get_bool(dirs)
                        , val_get_bool(multi)
                        , val_get_bool(aliases)
                        , callback);
}
DEFINE_PRIM (filepicker_dialog, 5);

extern "C" void filepicker_main () {}
DEFINE_ENTRY_POINT (filepicker_main);



extern "C" int filepicker_register_prims () { return 0; }
