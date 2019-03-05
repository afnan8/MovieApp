//
//  AllMoviesViewTests.m
//  MovieAppTests
//
//  Created by afnan on 3/5/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AllMoviesView.h"
#import "NetworkingManager.h"

@interface AllMoviesViewTests : XCTestCase
@property AllMoviesView *allMoviesView;
@property AllMoviesCollectionViewCell *cell;
@end

@implementation AllMoviesViewTests

- (void)setUp {
    _allMoviesView = [[AllMoviesView alloc] init];
    _cell = [[AllMoviesCollectionViewCell alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}
//
- (void) testFetchMoviesFromAPI {
    XCTAssertNil(_allMoviesView.movieListData);
    [_allMoviesView fetchListOfMovies];
    NetworkingManager *networkingManager = [[NetworkingManager alloc] init];
    XCTestExpectation *expectation = [self expectationWithDescription:@"Request should succeed"];
    NSString *url = @"url@test.com";
    [networkingManager executeGetServiceWith: url success:^(NSData  *_Nonnull data) {
        XCTAssertTrue(data);
        XCTAssertNotNil(self.allMoviesView.movieListData);
        [expectation fulfill];

    } failure:^(NSError  *_Nonnull error) {
        
        XCTAssertNotNil(error);
        XCTFail(@"%@", [error description]);
        XCTAssertNil(self.allMoviesView.movieListData);
        [expectation fulfill];

    }];
    
    [self waitForExpectationsWithTimeout: 30 handler:^(NSError  *_Nullable error) {
        
    }];
}

- (void)testcollectionViewLoad
{
    XCTAssertNotNil(_allMoviesView.collectionView, @"collectionView not initiated properly");
}
- (void)testViewConformsUICollectionViewDataSource
{
    XCTAssertTrue([_allMoviesView conformsToProtocol:@protocol(UICollectionViewDataSource) ], @"View does not conform to UICollectionView DataSource");
}
- (void)testCollectionViewHasDataSource
{
    XCTAssertNotNil(_allMoviesView.collectionView.dataSource, @"collectionView datasource cannot be nil");
}

- (void)testViewConformsToUICollectionViewDelegate
{
    XCTAssertTrue([_allMoviesView conformsToProtocol:@protocol(UICollectionViewDelegate) ], @"View does not conform to UICollectionView delegate");
}

- (void)testCollectionViewDelegate
{
    XCTAssertNotNil(_allMoviesView.collectionView.delegate, @"Table delegate cannot be nil");
}

@end
