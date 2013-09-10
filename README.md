# filepicker

Native filepicker dialogs for openfl. Currently only OSX as I've got no other
platforms to test with. Pull requests more than welcome.

## features

 * open file/dir dialog

## example

    import sakari.filepicker.Filepicker;
    ..
    new Filepicker().chooseFiles().open(function(paths) {
        trace('you picked', paths);
    });

## Build

    make ndll

## Build and open test application

    make test

## license

(c) sakari jokinen
MIT style
