#import "Utils.h"
#import <AppKit/NSApplication.h>
#import <AppKit/NSOpenPanel.h>

namespace filepicker {
  void FileSelectionDialog() {
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles:NO];
    [panel setCanChooseDirectories:YES];
    [panel setAllowsMultipleSelection:YES]; // yes if more than one dir is allowed
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
      for (NSURL *url in [panel URLs]) {
	// do something with the url here.
      }
    }
  }
}
