//
//  AppAlertControllerTests.m
//  MovieAppTests
//
//  Created by afnan on 3/4/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppAlertController.h"

@interface AppAlertControllerTests : XCTestCase
@property AppAlertController *appAlertController;
@end

@implementation AppAlertControllerTests

- (void)setUp {
}

- (void)tearDown {
}

- (void)testExample {
    UIAlertController *result = [AppAlertController presentAlertControllerWithTite: @"" message:@""];
    XCTAssertNotNil(result);
}

@end
