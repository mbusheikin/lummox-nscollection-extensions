//
//  NSMutableArray+LMXUtilities.m

//
//  Created by Michael Busheikin on 7/20/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import "NSMutableArray+LMXUtilities.h"

@implementation NSMutableArray (LMXUtilities)

- (void)lmx_safelyAddObject:(id)object {
    if (object != nil) {
        [self addObject:object];
    }
}

- (void)lmx_removeSingleObjectPassingTest:(BOOL (^)(id obj, NSUInteger idx))test {
    if (!test) {
        return;
    }
    
    NSInteger index = [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        if (test(obj, idx)) {
            *stop = YES;
            return YES;
        }
        return NO;
    }];
    
    if (index != NSNotFound) {
        [self removeObjectAtIndex:index];
    }
}

- (void)lmx_removeSingleObjectEqualTo:(NSObject *)object {
    [self lmx_removeSingleObjectPassingTest:^BOOL(id obj, NSUInteger idx) {
        return [obj isEqual:object];
    }];
}

@end
