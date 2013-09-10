package;
import flash.display.Sprite;
import sakari.filepicker.Filepicker;

class Main extends Sprite {
	public function new () {
		super ();
        new Filepicker()
            .chooseFiles()
            .chooseDirs()
            .multiple()
            .open(function(p) {
                    trace('selected', p);
                    new Filepicker()
                            .chooseFiles()
                            .chooseDirs()
                            .multiple()
                            .open(function(p) {
                                    trace('selected again', p);
                                });
                });
	}
}