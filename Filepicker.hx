package sakari.filepicker;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end


class Filepicker {
	
    public static function filepicker() {
        return filepicker_dialog();
    }
	private static var filepicker_dialog = 
        Lib.load ("filepicker", "filepicker_dialog", 0);
}