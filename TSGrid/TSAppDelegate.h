//
//  TSAppDelegate.h
//  TSGrid
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TSUniformGrid.h"

@interface TSAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet TSUniformGrid *uniformGrid;
@end
