//
//  MovieAppTests.m
//  MovieAppTests
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MainViewController.h"

@interface MovieAppTests : XCTestCase
@property MainViewController *mainViewController;
@end

/**
 test main class for Movie app "MainViewController"
 */
@implementation MovieAppTests

- (void)setUp {
    _mainViewController = [[MainViewController alloc] init];
}

- (void)tearDown {
}

- (void)testSegmentedControlLoad {
    XCTAssertNil(_mainViewController.segmentedControl);
    [_mainViewController viewDidLoad];
    XCTAssertNotNil(_mainViewController.segmentedControl);
}

- (void)testSegmentedControlTitle {
    
    [_mainViewController viewDidLoad];
    NSString *titleAtIndex0 = [_mainViewController.segmentedControl titleForSegmentAtIndex:0];
    
    XCTAssertEqualObjects(@"All Movies", titleAtIndex0);
    
    NSString *titleAtIndex1 = [_mainViewController.segmentedControl titleForSegmentAtIndex:1];
    
    XCTAssertEqualObjects(@"My Movies", titleAtIndex1);
}

- (void) testAllMoviesViewClass {
    /**
     used to test All Movies View Class
     */
    [_mainViewController viewDidLoad];
    
    XCTAssertNil(_mainViewController.contentView);
    [_mainViewController viewWillAppear:YES];
    XCTAssertNotNil(_mainViewController.contentView);

    XCTAssertTrue(_mainViewController.segmentedControl.selectedSegmentIndex == 0);
    XCTAssertTrue([_mainViewController.contentView isKindOfClass: [AllMoviesView class]]);
    
    [_mainViewController.segmentedControl setSelectedSegmentIndex:1];
    XCTAssertTrue(_mainViewController.segmentedControl.selectedSegmentIndex == 1);
    [_mainViewController setCurrentView];
    XCTAssertTrue([_mainViewController.contentView isKindOfClass: [MyMoviesView class]]);
}

@end
