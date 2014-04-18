//
//  TSUniformGrid.h
//  TSUniformGrid
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import "TSUniformStack.h"

@class TSUniformGrid;

@protocol TSUniformGridDelegate <TSUniformStackDelegate>

@required

@optional

/*!
 
 Delegates can change the grid subview content prior to resizing to a new size.
 
 */
- (void)uniformGridWillResize:(TSUniformGrid *)uniformGrid toSize:(NSSize)newSize;
@end

@interface TSUniformGrid : TSUniformStack


/*!
 
 Create a new row stack. Does not add it to the grid.
 
 */
- (TSUniformStack *)newRow;

/*!
 
 Create a new row object and add it to the bottom of the grid.
 
 */
- (TSUniformStack *)addNewRow;

/*!
 
 Create a new row stack containing the given views. Does not add it to the grid.
 
 */
- (TSUniformStack *)newRowWithSubviews:(NSArray *)views;

/*!
 
 Create a new row stack containing the given views and add it to the bottom of the grid.
 
 */
- (TSUniformStack *)addNewRowWithSubviews:(NSArray *)views;

/*!
 
 Create a new row stack containing views of the given type and quantity. Does not add it to the grid.
 
 */
- (TSUniformStack *)newRowWithSubviewsOfType:(Class)klass count:(NSInteger)count;

/*!
 
 Adds a new row stack containing views of the given type and quantity to the botom of the grid.
 
 */
- (TSUniformStack *)addNewRowWithSubviewsOfType:(Class)klass count:(NSInteger)count;


/*!
 
 First row in the grid.
 
 */
- (TSUniformStack *)firstRow;

/*!
 
 Last row in the grid.
 
 */
- (TSUniformStack *)lastRow;

/*!
 
 The number of rows in the grid.
 
 */
- (NSInteger)rowCount;


/*!
 
 The column count in the first row.
 
 */
- (NSInteger)columnCountInFirstRow;

/*!
 
 The maximum number of columns in the grid. This equates to the maximum number of views in any row.
 
 */
- (NSInteger)maxColumnCount;

/*!
 
 The minimum number of columns in the grid. This equates to the minimum number of views in any row.
 
 */
- (NSInteger)minColumnCount;

/*!
 
 The first subview in the grid
 
 */
- (id)firstGridSubview;

/*!
 
 The last subview in the grid
 
 */
- (id)lastGridSubview;

/*!
 
 All grid subviews.
 
 */
- (NSArray *)gridSubviews;

@end
