//
//  TSUniformStack.h
//  TSUniformStack
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TSUniformStack : NSView

/*!
 
 Set the stack's orientation.
 
 */
@property  (nonatomic) NSUserInterfaceLayoutOrientation orientation;

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
 
 The number of subviews in the stack;
 
 */
- (NSInteger)subviewCount;

@end
