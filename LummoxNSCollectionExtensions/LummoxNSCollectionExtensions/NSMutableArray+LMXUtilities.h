//
//  NSMutableArray+LMXUtilities.h

//
//  Created by Michael Busheikin on 7/20/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (LMXUtilities)

- (void)lmx_safelyAddObject:(id)object;

- (void)lmx_removeSingleObjectEqualTo:(NSObject *)object;
- (void)lmx_removeSingleObjectPassingTest:(BOOL (^)(id obj, NSUInteger idx))test;

@end
