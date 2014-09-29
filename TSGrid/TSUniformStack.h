//
//  TSUniformStack.h
//  TSUniformStack
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TSUniformStack;

@protocol TSUniformStackDelegate <NSObject>

@required

@optional

/*!
 
 Delegates can change the stack subview content prior to resizing to a new size.
 
 */
- (void)uniformStackWillResize:(TSUniformStack *)uniformStack toSize:(NSSize)newSize;
@end
    
@interface TSUniformStack : NSView

/*!
 
 Layout is suspended.
 
 */
@property (nonatomic) BOOL layoutSuspended;

/*!
 
  Stack delegate
 
 */
@property (weak, nonatomic) id <TSUniformStackDelegate> delegate;

/*!
 
 Set the stack's orientation.
 
 */
@property (nonatomic) NSUserInterfaceLayoutOrientation orientation;

/*!
 
 Create a new stack containing the given views.
 
 */
+ (id)uniformStackWithSubviews:(NSArray *)subviews;

/*!
 
 Create a new stack containing subviews of the given type and quantity.
 
 */
+ (TSUniformStack *)uniformStackWithSubviewsOfType:(Class)klass count:(NSInteger)count;

/*!
 
 Add a view to the stack.
 
 */
- (void)addSubview:(NSView *)view;

/*!
 
 Add an array of views to the stack.
 
 */
- (void)addSubviews:(NSArray *)views;

/*!
 
 Add subviews of the given type and quantity.
 
 */
- (void)addSubviewsOfType:(Class)klass count:(NSInteger)count;

/*!
 
 Remove a view from the stack.
 
 */
- (void)removeSubview:(NSView *)view;

/*
 
 Remove all subviews from the stack.
 
 */
- (void)removeAllSubviews;

/*!
 
 Get subview at a given index.
 
 */
- (id)subviewAtIndex:(NSInteger)idx;

/*!
 
 Get the first subview in the stack.
 
 */
- (id)firstSubview;

/*!
 
 Get the last subview in the stack.
 
 */
- (id)lastSubview;

/*!
 
 The number of subviews in the stack;
 
 */
- (NSInteger)subviewCount;


/*!
 
 The average uniform dimension for the given view frame size. 
 For a horizontal stack this will be a width.
 For a vertical stack it will be a height.
 
 */
- (CGFloat)averageUniformDimensionForSize:(NSSize)size;

@end
