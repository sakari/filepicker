package sakari.filepicker;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

private class Builder {
}

class Filepicker {
    var _chooseFiles = false;
    var _chooseDirs = false;
    var _multiple = false;
    var _resolveAliases = false;
    private function new() {}
	
    public static function filepicker() {
        return new Filepicker();
    }

    public function chooseFiles() {
        _chooseFiles = true;
        return this;
    }

    public function chooseDirs() {
        _chooseDirs = true;
        return this;
    }

    public function multiple() {
        _multiple = true;
        return this;
    }

    public function resolveAliases() {
        _resolveAliases = true;
        return this;
    }

    public function open(cb: Array<String> -> Void) {
        filepicker_dialog(_chooseFiles, _chooseDirs, _multiple, _resolveAliases, cb);
    }
    
	private static var filepicker_dialog = 
        Lib.load ("filepicker", "filepicker_dialog", 5);
}