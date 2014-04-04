//
//  NSMutableDictionary+LMXUtilities.m

//
//  Created by Michael Busheikin on 8/12/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import "NSMutableDictionary+LMXUtilities.h"

@implementation NSMutableDictionary (LMXUtilities)

- (void)lmx_safelySetObject:(id)object forKey:(id)key {
    if (!key) {
        return;
    }
    
    if (!object) {
        [self removeObjectForKey:key];
        return;
    }
    
    [self setObject:object forKey:key];
}

@end
