//
//  TSUniformGrid.m
//  TSUniformGrid
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import "TSUniformGrid.h"

@implementation TSUniformGrid

#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.orientation = NSUserInterfaceLayoutOrientationVertical;
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSInteger)rowCount
{
    return self.subviewCount;
}

- (NSInteger)maxColumnCount
{
    NSInteger columnCount = 0;
    for (NSView *view in self.subviews) {
        NSInteger count = [[view subviews] count];
        columnCount = count > columnCount ? count : columnCount;
    }
    
    return columnCount;
}

- (NSInteger)minColumnCount
{
    NSInteger columnCount = NSIntegerMax;
    for (NSView *view in self.subviews) {
        NSInteger count = [[view subviews] count];
        columnCount = count < columnCount ? count : columnCount;
    }
    if (columnCount == NSIntegerMax) {
        columnCount = 0;
    }
    return columnCount;
}

#pragma mark -
#pragma mark Rows

- (TSUniformStack *)newRow
{
    TSUniformStack *stack = [TSUniformStack new];
    
    return stack;
}

- (TSUniformStack *)addNewRow
{
    TSUniformStack *stack = [self newRow];
    [self addSubview:stack];
    
    return stack;
}

- (TSUniformStack *)newRowWithSubviews:(NSArray *)views
{
    TSUniformStack *stack = [TSUniformStack uniformStackWithSubviews:views];
    
    return stack;
}

- (TSUniformStack *)addNewRowWithSubviews:(NSArray *)views
{
    TSUniformStack *stack = [self newRowWithSubviews:views];
    [self addSubview:stack];
    
    return stack;
}


@end
