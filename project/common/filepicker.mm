#import "Utils.h"
#import <AppKit/NSApplication.h>
#import <AppKit/NSOpenPanel.h>

namespace filepicker {
  void FileSelectionDialog(bool file
			   , bool dir
			   , bool multi
			   , bool alias
			   , Callback cb) {
    NSOpenPanel *panel = [NSOpenPanel openPanel];

    [panel setCanChooseFiles: file ? YES : NO];
    [panel setCanChooseDirectories: dir ? YES : NO];
    [panel setAllowsMultipleSelection: multi ? YES : NO];
    [panel setResolvesAliases: alias ? YES : NO];
    
    NSInteger clicked = [panel runModal];
    
    if (clicked == NSFileHandlingPanelOKButton) {
      NSArray * a = [panel URLs];
      NSUInteger size = [a count];
      const char * urls[ size ];
      for(int i = 0; i < size;  i++) {
	const char * p = [[[a objectAtIndex: i] 
			    path] 
			    cStringUsingEncoding: 1];
	urls[i] = p;
      }
      cb(urls, size);
      return;
    }
    cb(NULL, 0);
  }
}
