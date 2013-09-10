package sakari.filepicker;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

class Save {
    var _extensions:Array<String>;
    public function new() {
        _extensions = [];
    }

    public function extensions(extensions: Array<String>) {
        _extensions = extensions;
        return this;
    }

    public function open(cb: String -> Void) {
        save_dialog(_extensions, cb);
    }
    
	private static var save_dialog = 
        Lib.load ("filepicker", "save_dialog", 2);
}