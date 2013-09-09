#ifndef FILEPICKER_H
#define FILEPICKER_H

typedef void (*Callback)(const char * paths[], int length);

namespace filepicker {
    void FileSelectionDialog(bool file, bool dir, bool multi, bool alias, Callback cb);
}


#endif
