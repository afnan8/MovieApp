//
//  AddMovieViewController.h
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyMovieModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AddMovieViewController : UIViewController  <UINavigationControllerDelegate,
UIImagePickerControllerDelegate>

@property (nonatomic) BOOL didSetupConstraints;
@property (nonatomic, strong) UIImageView *movieImageView;
@property (nonatomic, strong) UIButton *pluseIcon;
@property (nonatomic, strong) UILabel *addMoviePoster;
@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) UITextView *overviewTextView;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UIButton *selectDateButton;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIButton *addMovieButton;
@property (nonatomic, strong) MyMovieModel *movieObject;
- (void) addMovie;

@end

NS_ASSUME_NONNULL_END
