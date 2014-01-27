TSUniformGrid
============

`TSUniformGrid` is a simple uniform grid control for Cocoa. In many ways the view behaves like `NSStackView` except that all subviews are laid out to be a uniform size. 

The grid is implemented as a subclass of a vertically configured `TSUniformStack`. The superclass can be used individually in situations where a simple uniform view stack is required.

See the sample project for more insight.

Usage
=====

Add `TSUniformGrid` and `TSUniformGrid` to your Xcode project.
 
A grid is constructed from rows. Subviews are then added to the rows (instances of `TSUniformStack`).

	#import "TSUniformGrid.h"

	// Our nib contains an instance of TSUniformGrid
	// self.uniformGrid 

	// add a row with buttons
    NSMutableArray *subviews = [NSMutableArray arrayWithCapacity:52];
    for (int i = 0; i < 52; i++) {
        [subviews addObject:[NSButton new]];
    }
    [self.uniformGrid addNewRowWithSubviews:subviews];
    
	// add another
    [subviews removeAllObjects];
    for (int i = 0; i < 26; i++) {
        [subviews addObject:[NSButton new]];
    }
    TSUniformStack* row = [self.uniformGrid addNewRowWithSubviews:subviews];

	// add a subview to the end of a row
    [row addSubview:[NSButton new]];


Build requirements
==================

OS X 10.9 64bit ARC

Licence
=======

MIT
