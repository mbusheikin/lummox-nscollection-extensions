//
//  BGDictionaryTests.m
//  BGCommonCode
//
//  Created by Michael Busheikin on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+LMXUtilities.h"

@interface LMXDictionaryTests : XCTestCase

@end

@implementation LMXDictionaryTests

- (void)testSafeAccessors {
    NSDictionary *toTest = @{};
    
    XCTAssertTrue([toTest lmx_stringForKey:@"mike"] == nil, @"lmx_stringForKey shouldn't work if the key isn't there.");
    
    NSArray *toCompare = @[ @3, @5 ];
    toTest = @{ @"mike" : @2, @"mikeString" : @"mike", @"mikeArray": toCompare };
    XCTAssertTrue([toTest lmx_stringForKey:@"mike"] == nil, @"lmx_stringForKey shouldn't work if the value isn't a string.");
    XCTAssertTrue([[toTest lmx_stringForKey:@"mikeString"] isEqualToString:@"mike"], @"lmx_stringForKey should work for a string.");
    XCTAssertTrue([toTest lmx_stringForKey:@"@mike"] == nil, @"lmx_stringForKey shouldn't work for an @ value.");
    
    XCTAssertTrue([toTest lmx_arrayForKey:@"@mikeArray"] == nil, @"lmx_arrayForKey shouldn't work for an @ value.");
    XCTAssertTrue([toTest lmx_arrayForKey:@"mike"] == nil, @"lmx_arrayForKey shouldn't work for a number.");
    XCTAssertTrue([toTest lmx_arrayForKey:@"mikeString"] == nil, @"lmx_arrayForKey shouldn't work for a string.");
    XCTAssertTrue([[toTest lmx_arrayForKey:@"mikeArray"] isEqualToArray:toCompare], @"lmx_arrayForKey should equal the array.");
    
}

@end
