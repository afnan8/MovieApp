//
//  NetworkManagerTests.m
//  MovieAppTests
//
//  Created by afnan on 3/4/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NetworkingManager.h"

@interface NetworkManagerTests : XCTestCase
@property NetworkingManager *networkingManager;
@end

@implementation NetworkManagerTests

- (void)setUp {
    _networkingManager = [[NetworkingManager alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    _networkingManager = [[NetworkingManager alloc] init];
    XCTestExpectation *expectation = [self expectationWithDescription:@"Request should succeed"];
    NSString *url = @"url@test.com";
    
    [_networkingManager executeGetServiceWith: url success:^(NSData  *_Nonnull data) {
        XCTAssertTrue(data);
        [expectation fulfill];
    } failure:^(NSError  *_Nonnull error) {
        XCTAssertNotNil(error);
        XCTFail(@"%@", [error description]);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout: 30 handler:^(NSError  *_Nullable error) {
        
    }];
}

@end
