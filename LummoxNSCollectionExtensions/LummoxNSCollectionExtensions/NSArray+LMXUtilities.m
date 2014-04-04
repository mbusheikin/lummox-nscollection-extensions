//
//  NSArray+LMXUtilities.m

//
//  Created by Michael Busheikin on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import "NSArray+LMXUtilities.h"

@implementation NSArray (LMXUtilities)

#pragma mark - Safe accessors

- (id)lmx_safeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return self[index];
}

- (id)lmx_objectAtIndex:(NSUInteger)index ofClass:(Class)type {
    id object = [self lmx_safeObjectAtIndex:index];
    if (type && [object isKindOfClass:type]) {
        return object;
    }
    return nil;
}

- (NSString *)lmx_stringAtIndex:(NSUInteger)index {
    return [self lmx_objectAtIndex:index ofClass:[NSString class]];
}

- (NSArray *)lmx_arrayAtIndex:(NSUInteger)index {
    return [self lmx_objectAtIndex:index ofClass:[NSArray class]];
}

- (NSNumber *)lmx_numberAtIndex:(NSUInteger)index {
    return [self lmx_objectAtIndex:index ofClass:[NSNumber class]];
}

- (NSInteger)lmx_integerAtIndex:(NSUInteger)index {
    return [[self lmx_numberAtIndex:index] integerValue];
}

#pragma mark - Finding elements in the array

- (id)lmx_nextObjectAfter:(id)itemBefore wrap:(BOOL)doWrap {
    NSInteger beforeIndex = [self indexOfObject:itemBefore];
    if (beforeIndex == NSNotFound) {
        return nil;
    } else if (!doWrap && (beforeIndex + 1) >= [self count]) {
        return nil;
    } else {
        NSInteger nextIndex = (beforeIndex + 1) % [self count];
        return [self objectAtIndex:nextIndex];
    }
}

- (id)lmx_objectPassingTest:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))predicate {
    if (predicate == nil) {
        return nil;
    }
    
    NSInteger index = [self indexOfObjectPassingTest:predicate];
    if (index == NSNotFound) {
        return nil;
    }
    
    return self[index];
}

- (id)lmx_objectOfType:(Class)filterClass {
    NSArray *objects = [self lmx_arrayWithObjectsOfType:filterClass];
    return ([objects count] > 0 ? [objects lastObject] : nil);
}

#pragma mark - Creating new arrays

- (NSArray *)lmx_arrayWithMapping:(id (^)(id obj, NSUInteger idx))mapFunction {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (int i = 0; i < [self count]; i++) {
        id object = self[i];
        id mapped = mapFunction(object, i);
        if (mapped) {
            [array addObject:mapped];
        } else {
            NSLog(@"arrayWithMapping removing nil mapped object.");
        }
    }
    
    return array;
}

- (NSArray *)lmx_arrayWithFilter:(BOOL (^)(id obj, NSUInteger idx))filterFunction {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (int i = 0; i < [self count]; i++) {
        id object = self[i];
        BOOL include = filterFunction(object, i);
        if (include) {
            [array addObject:object];
        }
    }
    
    return array;
}

- (NSArray *)lmx_arrayWithObjectsOfType:(Class)filterClass {
    return [self lmx_arrayWithFilter:^BOOL(id obj, NSUInteger idx) {
        return [obj isKindOfClass:filterClass];
    }];
}

- (NSArray *)lmx_reversedArray {
    NSMutableArray *mutableReverse = [NSMutableArray arrayWithCapacity:[self count]];
    
    for (NSUInteger i = [self count] - 1; i >= 0; i--) {
        [mutableReverse addObject:self[i]];
    }
    
    return [NSArray arrayWithArray:mutableReverse];
}

#pragma mark - Array calculations

- (NSInteger)lmx_countOfObjectsEqualTo:(id)toCompare {
    NSIndexSet *equalIndices = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:toCompare];
    }];
    
    return [equalIndices count];
}

#pragma mark - String methods

- (NSString *)lmx_componentsJoinedByString:(NSString *)separator conversion:(NSString *(^)(id obj, NSUInteger idx))convertBlock {
    NSArray *stringArray = [self lmx_arrayWithMapping:convertBlock];
    return [stringArray componentsJoinedByString:separator];
}

@end
