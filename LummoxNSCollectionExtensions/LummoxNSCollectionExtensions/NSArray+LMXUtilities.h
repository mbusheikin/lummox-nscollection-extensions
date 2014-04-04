//
//  NSArray+LMXUtilities.h

//
//  Created by Michael Busheikin on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LMXUtilities)

// Safe accessors
- (id)lmx_safeObjectAtIndex:(NSUInteger)index;
- (id)lmx_objectAtIndex:(NSUInteger)index ofClass:(Class)type;

- (NSString *)lmx_stringAtIndex:(NSUInteger)index;
- (NSArray *)lmx_arrayAtIndex:(NSUInteger)index;

- (NSNumber *)lmx_numberAtIndex:(NSUInteger)index;
- (NSInteger)lmx_integerAtIndex:(NSUInteger)index;

// Finding elements in the array
- (id)lmx_nextObjectAfter:(id)itemBefore wrap:(BOOL)doWrap;
- (id)lmx_objectPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate;
- (id)lmx_objectOfType:(Class)filterClass;

// Creating new arrays

/*!
 Create a new array where each element is mapped from a source array.
 \param mapFunction Required. This block is called for each object, and must return an object that is 
 added to the result array in the same order as the original.
 \note If any block call returns nil, nothing is added to the mapped array, and it won't have the same
 number of elements as the source.
 */
- (NSArray *)lmx_arrayWithMapping:(id (^)(id obj, NSUInteger idx))mapFunction;

- (NSArray *)lmx_arrayWithFilter:(BOOL (^)(id obj, NSUInteger idx))filterFunction;
- (NSArray *)lmx_arrayWithObjectsOfType:(Class)filterClass;
- (NSArray *)lmx_reversedArray;

// Array calculations
- (NSInteger)lmx_countOfObjectsEqualTo:(id)toCompare;

// Conversion to string.
- (NSString *)lmx_componentsJoinedByString:(NSString *)separator conversion:(NSString *(^)(id obj, NSUInteger idx))convertBlock;

@end
