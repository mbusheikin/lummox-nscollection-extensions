//
//  NSDictionary+LMXUtilities.m
//  BGCommonCode
//
//  Created by Michael Busheikin on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import "NSDictionary+LMXUtilities.h"

@implementation NSDictionary (LMXUtilities)

- (id)lmx_objectForKey:(id)key ofClass:(Class)type {
    id object = [self objectForKey:key];
    if (type && [object isKindOfClass:type]) {
        return object;
    }
    
    return nil;
}

- (NSString *)lmx_stringForKey:(id)key {
    return [self lmx_objectForKey:key ofClass:[NSString class]];
}

- (NSArray *)lmx_arrayForKey:(id)key {
    return [self lmx_objectForKey:key ofClass:[NSArray class]];
}

- (NSNumber *)lmx_numberForKey:(id)key {
    return [self lmx_objectForKey:key ofClass:[NSNumber class]];
}

- (NSInteger)lmx_integerForKey:(id)key {
    return [[self lmx_numberForKey:key] integerValue];
}

- (CGFloat)lmx_floatForKey:(id)key {
    return [[self lmx_numberForKey:key] floatValue];
}

- (BOOL)lmx_boolForKey:(id)key {
    return [[self lmx_numberForKey:key] boolValue];
}

#pragma mark - Dictionary transformations


- (NSDictionary *)lmx_dictionaryWithMapping:(NSArray * (^)(id key, id obj))mapFunction {
    if (!mapFunction) {
        return nil;
    }
    
    NSMutableDictionary *mapped = [NSMutableDictionary dictionaryWithCapacity:[self count]];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSArray *mappedArray = mapFunction(key, obj);
        
        if ([mappedArray count] == 2) {
            mapped[mappedArray[0]] = mappedArray[1];
        }
    }];
    
    return mapped;
}

@end
