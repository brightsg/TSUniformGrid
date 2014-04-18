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

- (NSInteger)columnCountInFirstRow
{
    NSInteger columnCount = [[self firstRow] subviewCount];
    
    return columnCount;
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

- (id)firstGridSubview
{
    NSView *view = [self firstRow];
    if ([view respondsToSelector:@selector(firstSubview)]) {
        view = [view performSelector:@selector(firstSubview)];
    }
    return view;
}

- (id)lastGridSubview
{
    NSView *view = [self lastRow];
    if ([view respondsToSelector:@selector(lastSubview)]) {
        view = [view performSelector:@selector(lastSubview)];
    }
    
    return view;
}

- (NSArray *)gridSubviews
{
    NSMutableArray *allSubviews = [NSMutableArray arrayWithCapacity:10];
    for (NSView *view in self.subviews) {
        [allSubviews addObjectsFromArray:[view subviews]];
    }
    
    return allSubviews;
}

- (id<TSUniformGridDelegate>)delegate
{
    return (id<TSUniformGridDelegate>)[super delegate];
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

- (TSUniformStack *)newRowWithSubviewsOfType:(Class)klass count:(NSInteger)count
{
    TSUniformStack *stack = [TSUniformStack uniformStackWithSubviewsOfType:klass count:count];
    
    return stack;
}

- (TSUniformStack *)addNewRowWithSubviewsOfType:(Class)klass count:(NSInteger)count
{
    TSUniformStack *stack = [self newRowWithSubviewsOfType:klass count:count];
    [self addSubview:stack];

    return stack;
}

- (TSUniformStack *)firstRow
{
    TSUniformStack *row = [super firstSubview];
    return row;
}

- (TSUniformStack *)lastRow
{
    TSUniformStack *view = [super lastSubview];
    return view;
}

#pragma mark -
#pragma mark Layout

- (void)resizeSubviewsWithOldSize:(NSSize)oldSize
{
    // when doing bulk updates we may suspend layout
    if (self.layoutSuspended) return;
    
    // tell the delegate that the grid will resize
    if ([self.delegate respondsToSelector:@selector(uniformGridWillResize:toSize:)]) {
        [(id)self.delegate uniformGridWillResize:self toSize:self.bounds.size];
    }
    
    [super resizeSubviewsWithOldSize:oldSize];
}
@end
