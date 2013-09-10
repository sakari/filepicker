# filepicker

Native filepicker dialogs for openfl. Currently only OSX as I've got no other
platforms to test with. Pull requests more than welcome.

## features

 * open file/dir dialog
 * save file dialog with optional default extension

## example

    import sakari.filepicker.Open;
    ..
    new Open().chooseFiles().open(function(paths) {
        trace('you picked', paths);
    });

    import sakari.filepicker.Save;
    ..
    new Save().extensions(['txt']).open(function(path) {
        trace('you are saving', path);
    })

## Build

    make ndll

## Build and open test application

    make test

## license

(c) sakari jokinen
MIT style
