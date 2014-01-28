//
//  TSAppDelegate.m
//  TSGrid
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import "TSAppDelegate.h"


@implementation TSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // add a row of buttons
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
    [self.uniformGrid addNewRowWithSubviews:subviews];

    // generate a row of views of a given type
    [subviews removeAllObjects];
    [self.uniformGrid addNewRowWithSubviewsOfType:[NSButton class] count:13];

    // and again
    [subviews removeAllObjects];
    TSUniformStack *row = [self.uniformGrid addNewRowWithSubviewsOfType:[NSButton class] count:13];

    // now add a view to the end of the row and remove the first subview
    [row addSubview:[NSButton new]];
    [row removeSubview:[row firstSubview]];
}

@end
