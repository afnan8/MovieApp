//
//  MovieAppUITests.m
//  MovieAppUITests
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface MovieAppUITests : XCTestCase

@end

@implementation MovieAppUITests

- (void)setUp {

    self.continueAfterFailure = NO;

    [[[XCUIApplication alloc] init] launch];
}

- (void) testUIAddMovieFieldsEmpty {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    /*@START_MENU_TOKEN@*/[[[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"All Movies"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeCollectionView].element swipeLeft];/*[["[[[[[[","app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@\"All Movies\"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeCollectionView].element","["," swipeUp];"," swipeLeft];"],[[[0,1,1]],[[2,4],[2,3]]],[0,0]]@END_MENU_TOKEN@*/
    
    [app/*@START_MENU_TOKEN@*/.buttons[@"My Movies"]/*[[".segmentedControls.buttons[@\"My Movies\"]",".buttons[@\"My Movies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app.staticTexts[@"No Movie Available"] tap];
    
    XCUIElement *myMoviesNavigationBar = app.navigationBars[@"My Movies"];
    [myMoviesNavigationBar.buttons[@"Add"] tap];
    [app.textFields[@" Movie Title"] tap];
    
    XCUIElement *element = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"My Movies"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    [[element childrenMatchingType:XCUIElementTypeTextView].element tap];
    [app.buttons[@"Add Movie"] tap];
    [app.alerts[@"Warning"].buttons[@"OK"] tap];
    [myMoviesNavigationBar.buttons[@"My Movies"] tap];
    [[[[element childrenMatchingType:XCUIElementTypeStaticText] matchingIdentifier:@"No Movie Available"] elementBoundByIndex:1] tap];
    [app/*@START_MENU_TOKEN@*/.buttons[@"All Movies"]/*[[".segmentedControls.buttons[@\"All Movies\"]",".buttons[@\"All Movies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
}

- (void) testUIAddMovieFieldsNotEmpty {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *collectionView = [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"All Movies"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeCollectionView].element;
    /*@START_MENU_TOKEN@*/[collectionView swipeLeft];/*[["collectionView","["," swipeUp];"," swipeLeft];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
    /*@START_MENU_TOKEN@*/[collectionView swipeLeft];/*[["collectionView","["," swipeUp];"," swipeLeft];"],[[[-1,0,1]],[[1,3],[1,2]]],[0,0]]@END_MENU_TOKEN@*/
    
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;

    [app/*@START_MENU_TOKEN@*/.buttons[@"My Movies"]/*[[".segmentedControls.buttons[@\"My Movies\"]",".buttons[@\"My Movies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    [app.staticTexts[@"No Movie Available"] tap];
    
    XCUIElement *myMoviesNavigationBar = app.navigationBars[@"My Movies"];
    [myMoviesNavigationBar.buttons[@"Add"] tap];
    
    XCUIElement *movieTitleTextField = app.textFields[@" Movie Title"];
    [movieTitleTextField tap];
    [movieTitleTextField tap];
    [movieTitleTextField typeText: @"movie title"];
    
    XCUIElement *element3 = [[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"My Movies"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textView = [element3 childrenMatchingType:XCUIElementTypeTextView].element;
    [textView tap];
    [textView tap];
    [textView typeText: @"movie overview test"];
    
    XCUIElementQuery *datePickersQuery = app.datePickers;
    XCUIElement *pickerWheel = datePickersQuery.pickerWheels[@"2019"];
    [pickerWheel tap];
    [pickerWheel swipeDown];

    [datePickersQuery.pickerWheels.allElementsBoundByIndex[0] adjustToPickerWheelValue:@"May"];
    [datePickersQuery.pickerWheels.allElementsBoundByIndex[1] adjustToPickerWheelValue:@"1"];
    [datePickersQuery.pickerWheels.allElementsBoundByIndex[2] adjustToPickerWheelValue:@"1999"];

    [app.buttons[@"Add Movie"] tap];
    [app.alerts[@"Success"].buttons[@"OK"] tap];
    [myMoviesNavigationBar.buttons[@"My Movies"] tap]; //Back button
    [[element3 childrenMatchingType:XCUIElementTypeCollectionView].element tap];
    [app/*@START_MENU_TOKEN@*/.buttons[@"All Movies"]/*[[".segmentedControls.buttons[@\"All Movies\"]",".buttons[@\"All Movies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
}

@end
