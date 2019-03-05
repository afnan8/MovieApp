//
//  AddMovieTests.m
//  MovieAppTests
//
//  Created by afnan on 3/4/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AddMovieViewController.h"

@interface AddMovieTests : XCTestCase
@property AddMovieViewController *addMovieVC;
@end

@implementation AddMovieTests

- (void)setUp {
    _addMovieVC = [[AddMovieViewController alloc] init];
}

- (void)tearDown {

}

- (void) testAddMovie {
    
    XCTAssertNil(_addMovieVC.movieObject);
    
    [_addMovieVC addMovie];
    
    XCTAssertNotNil(_addMovieVC.movieObject);
}


@end
