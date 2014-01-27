//
//  TSUniformGrid.h
//  TSUniformGrid
//
//  Created by Jonathan Mitchell on 27/01/2014.
//  Copyright (c) 2014 Thesaurus Software. All rights reserved.
//

#import "TSUniformStack.h"

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

/*
 
 The number of rows in the grid.
 
 */
- (NSInteger)rowCount;

/*
 
 The maximum number of columns in the grid. This equates to the maximum number of views in any row.
 
 */
- (NSInteger)maxColumnCount;

/*
 
 The minimum number of columns in the grid. This equates to the minimum number of views in any row.
 
 */
- (NSInteger)minColumnCount;

@end
