#import "Utils.h"
#import <AppKit/NSApplication.h>
#import <AppKit/NSOpenPanel.h>

namespace filepicker {

  void SaveSelectionDialog(const char * extensions[]
			   , int size
			   , SaveCallback cb) {
    NSSavePanel *panel = [NSSavePanel savePanel];
    NSMutableArray * exts = [[NSMutableArray alloc] initWithCapacity: size];

    if(size > 0) {
      for(int i = 0; i < size; i++) {  
	[exts addObject: [NSString stringWithFormat: @"%s", extensions[i]]];
      }
      [panel setAllowedFileTypes: exts];
    }
    NSInteger clicked = [panel runModal];
    if(clicked == NSFileHandlingPanelOKButton) {
      cb([[[panel URL] path] cStringUsingEncoding: 1]);
      return;
    }
    [exts release];
    cb(NULL);
  }
			   
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
