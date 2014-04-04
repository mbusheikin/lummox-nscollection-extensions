//
//  BGArrayTests.m
//  BGCommonCode
//
//  Created by Michael ; on 5/26/13.
//  Copyright (c) 2013 Button Mash Games. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+LMXUtilities.h"

@interface LMXArrayTests : XCTestCase

@end

@implementation LMXArrayTests

- (void)testSafeAccessors {
    NSArray *toTest = @[];
    
    XCTAssertTrue([toTest lmx_stringAtIndex:100] == nil, @"Non existant index should return nil.");
    XCTAssertTrue([toTest lmx_stringAtIndex:-1] == nil, @"Non existant index should return nil.");
    
    toTest = @[@2];
    XCTAssertTrue([toTest lmx_stringAtIndex:0] == nil, @"String for index shouldn't return a number.");
    
    NSArray *toCompare = @[@1, @2];
    toTest = @[@2, @"3", toCompare];
    XCTAssertTrue([toTest lmx_stringAtIndex:0] == nil, @"String for index shouldn't return a number.");
    XCTAssertTrue([[toTest lmx_stringAtIndex:1] isEqualToString:@"3"], @"String for index should return a string.");
    XCTAssertTrue([toTest lmx_arrayAtIndex:0] == nil, @"Array for index shouldn't return a number.");
    XCTAssertTrue([toTest lmx_arrayAtIndex:1] == nil, @"Array for index shouldn't return a string.");
    XCTAssertTrue([[toTest lmx_arrayAtIndex:2] isEqualToArray:toCompare], @"Array for index should return an array.");
}

- (void)testNextObjectMethod {
    NSArray *empty = @[];
    
    XCTAssertTrue([empty lmx_nextObjectAfter:nil wrap:NO] == nil, @"Next to nil should be nil.");
    XCTAssertTrue([empty lmx_nextObjectAfter:nil wrap:YES] == nil, @"Next to nil should be nil.");
    
    XCTAssertTrue([empty lmx_nextObjectAfter:@123 wrap:NO] == nil, @"Next to invalid object should be nil.");
    XCTAssertTrue([empty lmx_nextObjectAfter:@123 wrap:YES] == nil, @"Next to invalid object should be nil.");
    
    NSArray *array = @[ @0, @1, @2, @3 ];
    
    XCTAssertTrue([array lmx_nextObjectAfter:nil wrap:NO] == nil, @"Next to nil should be nil.");
    XCTAssertTrue([array lmx_nextObjectAfter:nil wrap:YES] == nil, @"Next to nil should be nil.");
    
    XCTAssertTrue([array lmx_nextObjectAfter:@123 wrap:NO] == nil, @"Next to invalid object should be nil.");
    XCTAssertTrue([array lmx_nextObjectAfter:@123 wrap:YES] == nil, @"Next to invalid object should be nil.");
    
    XCTAssertTrue([[array lmx_nextObjectAfter:@0 wrap:NO] isEqual:@1], @"Next to 0 should be 1.");
    XCTAssertTrue([[array lmx_nextObjectAfter:@0 wrap:YES] isEqual:@1], @"Next to 0 should be 1.");
    
    XCTAssertTrue([[array lmx_nextObjectAfter:@2 wrap:NO] isEqual:@3], @"Next to 2 should be 3.");
    XCTAssertTrue([[array lmx_nextObjectAfter:@2 wrap:YES] isEqual:@3], @"Next to 2 should be 3.");
    
    XCTAssertTrue([array lmx_nextObjectAfter:@3 wrap:NO] == nil, @"Next to 3 should be nil (no wrap).");
    XCTAssertTrue([[array lmx_nextObjectAfter:@3 wrap:YES] isEqual:@0], @"Next to 3 should be 0 (wrap).");
}

- (void)testPredicateFind {
    NSArray *array = @[];
    
    id found = nil;;
    
    found = [array lmx_objectPassingTest:nil];
    XCTAssertNil(found, @"Should be nil.");
    
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"crap"];
    }];
    XCTAssertNil(found, @"Should be nil.");
    
    array = @[ @1, @"2", @[ @3 ] ];
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"4"];
    }];
    XCTAssertNil(found, @"Should be nil.");

    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"3"];
    }];
    XCTAssertNil(found, @"Should be nil.");
    
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"2"];
    }];
    XCTAssertNotNil(found, @"Shouldn't be nil.");
    
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@"1"];
    }];
    XCTAssertNil(found, @"Should be nil.");
    
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isEqual:@1];
    }];
    XCTAssertNotNil(found, @"Shouldn't be nil.");
    
    found = [array lmx_objectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return [obj isKindOfClass:[NSArray class]] && [obj isEqualToArray:@[@3]];
    }];
    XCTAssertNotNil(found, @"Shouldn't be nil.");
    
}

@end
