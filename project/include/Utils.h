#ifndef FILEPICKER_H
#define FILEPICKER_H

typedef void (*Callback)(const char * paths[], int length);
typedef void (*SaveCallback)(const char * path);

namespace filepicker {
    void FileSelectionDialog(bool file, bool dir, bool multi, bool alias, Callback cb);
    void SaveSelectionDialog(const char *  extensions[], int size, SaveCallback cb);
}


#endif
