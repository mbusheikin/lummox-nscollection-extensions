//
//  NSDictionary+LMXUtilities.h

//
//  Created by Michael Busheikin on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (LMXUtilities)

#pragma mark - Safe accessors

- (id)lmx_objectForKey:(id)key ofClass:(Class)type;

- (NSString *)lmx_stringForKey:(id)key;
- (NSArray *)lmx_arrayForKey:(id)key;
- (BOOL)lmx_boolForKey:(id)key;

- (NSNumber *)lmx_numberForKey:(id)key;
- (NSInteger)lmx_integerForKey:(id)key;
- (CGFloat)lmx_floatForKey:(id)key;

#pragma mark - Dictionary transformations

/*!
 Calls the mapFunction for each key-value pair in the dictionary.
 mapFunction should return a 2-element array: [key, value] for the mapped element.
 Returns a dictionary of mapped elements.
 If any function call returns nil, that element will be skipped in the result.
 */
- (NSDictionary *)lmx_dictionaryWithMapping:(NSArray * (^)(id key, id obj))mapFunction;

@end
