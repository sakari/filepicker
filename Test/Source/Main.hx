package;
import flash.display.Sprite;
import sakari.filepicker.Filepicker;

class Main extends Sprite {
	public function new () {
		super ();
        Filepicker
            .filepicker()
            .chooseFiles()
            .chooseDirs()
            .multiple()
            .open(function(p) {
                    trace('selected', p);
                        Filepicker
                            .filepicker()
                            .chooseFiles()
                            .chooseDirs()
                            .multiple()
                            .open(function(p) {
                                    trace('selected again', p);
                                });
                });
	}
}