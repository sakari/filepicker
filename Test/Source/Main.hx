package;
import flash.display.Sprite;
import sakari.filepicker.Open;
import sakari.filepicker.Save;

class Main extends Sprite {

    private function saveFile() {
        new Save()
            .extensions(['txt'])
            .open(function(p) {
                    trace('saving', p);
                });
    }

	public function new () {
		super ();
        new Open()
            .chooseFiles()
            .chooseDirs()
            .multiple()
            .open(function(p) {
                    trace('selected', p);
                    saveFile();
                });
	}
}