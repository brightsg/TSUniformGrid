//
//  TSUniformStack.m
//  TSUniformStack
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import "TSUniformStack.h"

@interface TSUniformStack ()
@property (strong) NSMutableArray *stackViews;
@end

@implementation TSUniformStack

#pragma mark -
#pragma mark Factory

+ (id)uniformStackWithSubviews:(NSArray *)subviews
{
    TSUniformStack* stack = [[self alloc] initWithFrame:NSMakeRect(0,0,10,10)];
    [stack addSubviews:subviews];
    return stack;
}

+ (TSUniformStack *)uniformStackWithSubviewsOfType:(Class)klass count:(NSInteger)count
{
    NSArray *views = [self arrayOfViewsOfType:klass count:count];
    TSUniformStack* stack = [self uniformStackWithSubviews:views];
    return stack;
}

+ (NSArray *)arrayOfViewsOfType:(Class)klass count:(NSInteger)count
{
    NSMutableArray *views = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [views addObject:[[klass alloc] initWithFrame:NSMakeRect(0,0, 1, 1)]];
    }
    return views;
}
#pragma mark -
#pragma mark Setup

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _stackViews = [NSMutableArray arrayWithCapacity:10];
        self.autoresizesSubviews = YES;
        _orientation = NSUserInterfaceLayoutOrientationHorizontal;
    }
    return self;
}

- (BOOL)isFlipped
{
    // a flipped co-ordinate system simply makes life simpler
    return YES;
}

#pragma mark -
#pragma mark Accessors

- (NSInteger)subviewCount
{
    return [self.stackViews count];
}

- (void)setOrientation:(NSUserInterfaceLayoutOrientation)value
{
    _orientation = value;
    [self doStackLayout];
}

#pragma mark -
#pragma mark Subviews

- (void)addSubviewsOfType:(Class)klass count:(NSInteger)count
{
    NSArray *views = [[self class] arrayOfViewsOfType:klass count:count];
    [self addSubviews:views];
}

- (void)addSubviews:(NSArray *)views
{
    for (NSView *view in views) {
        [self addSubview:view withLayout:NO];
    }
    [self doStackLayout];
}

- (void)addSubview:(NSView *)view
{
    [self addSubview:view withLayout:YES];
}

- (void)addSubview:(NSView *)view withLayout:(BOOL)doLayout
{
    // NOTE: When doing manual layout using setFrame it is important to ensure that -translatesAutoresizingMaskIntoConstraints
    // returns YES for the manually placed views. If this is not ensured than the layout will misbehave.
    //
    // ref: https://developer.apple.com/library/ios/documentation/userexperience/conceptual/AutolayoutPG/AdoptingAutoLayout/AdoptingAutoLayout.html#//apple_ref/doc/uid/TP40010853-CH15-SW1
    view.translatesAutoresizingMaskIntoConstraints = YES;
    
    [self.stackViews addObject:view];
    
    [super addSubview:view];
    
    if (doLayout) {
        [self doStackLayout];
    }
}

- (void)removeSubview:(NSView *)view
{
    [self removeSubview:view withLayout:YES];
}

- (void)removeSubview:(NSView *)view withLayout:(BOOL)doLayout
{
    [self.stackViews removeObject:view];
    [view removeFromSuperview];
    [self doStackLayout];
}

- (void)removeAllSubviews
{
    for (NSView *view in self.stackViews) {
        [self removeSubview:view withLayout:NO];
    }
    [self doStackLayout];
}

- (NSArray *)subviews
{
    return self.stackViews;
}

- (id)subviewAtIndex:(NSInteger)idx
{
    return self.stackViews[idx];
}

- (id)firstSubview
{
    return [self.stackViews firstObject];
}

- (id)lastSubview
{
    return [self.stackViews lastObject];
}

#pragma mark -
#pragma mark Layout

- (void)doStackLayout
{
    [self resizeSubviewsWithOldSize:self.bounds.size];
}

- (void)resizeSubviewsWithOldSize:(NSSize)oldSize
{
    // the arithmetic involved in setting out the view frames manually is simpler
    // than computing the neccessary Auto Layout constraints.
    
    NSSize size = self.bounds.size;
    CGFloat x = 0;
    CGFloat y = 0;
    
    if (self.orientation == NSUserInterfaceLayoutOrientationHorizontal) {
        
        CGFloat height = size.height;
        CGFloat avgWidth = (size.width)/self.subviewCount;
        NSInteger col = 0;

        for (NSView *view in self.stackViews) {
            
            // make the actual width of each subview as close as possible to the average width while
            // still filling the frame
            CGFloat width = (CGFloat)lround((col + 1) * avgWidth) - x;
            NSRect frame = NSMakeRect(x, y, width, height);
            [view setFrame:frame];
            
            x += width;
            col++;
        }
    } else {

        CGFloat width = size.width;
        CGFloat avgHeight = (size.height)/self.subviewCount;
        NSInteger row = 0;

        for (NSView *view in self.stackViews) {
            
            CGFloat height = (CGFloat)lround((row + 1) * avgHeight) - y;
            NSRect frame = NSMakeRect(x, y, width, height);
            [view setFrame:frame];
            
            y += height;
            row++;
        }

    }
}
@end
