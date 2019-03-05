//
//  AddMovieViewController.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "AddMovieViewController.h"
#import "AppColors.h"
#import "MyMoviesView.h"
#import "AppAlertController.h"

@interface AddMovieViewController ()

@end

@implementation AddMovieViewController
NSDateFormatter *dateFormat;

- (void)viewDidLoad {
    [super viewDidLoad];
    _didSetupConstraints = NO;
    _movieObject = [[MyMovieModel alloc] init];
    [self initSubViews];
    [self initDateFormat];
    [self addSubviews];
    [self.view setNeedsUpdateConstraints];
    self.view.backgroundColor = UIColor.lightColor;
}
- (void) initDateFormat {
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormat setDateFormat:@"YYYY-MM-dd"];
    dateFormat.dateStyle = NSDateFormatterMediumStyle;
    
    /**
     if user not selected date take today date by default
     */
    _movieObject.movieRelaseDate = [dateFormat stringFromDate:[NSDate date]];
}
- (void) initSubViews {
    _movieImageView = [[UIImageView alloc] init];
    [_movieImageView setTranslatesAutoresizingMaskIntoConstraints: NO];
    _movieImageView.clipsToBounds = YES;
    _movieImageView.image= [UIImage imageNamed:@"defaultMovie"];
    _movieImageView.layer.masksToBounds = YES;
    _movieImageView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    
    _pluseIcon = [[UIButton alloc] init];
    [_pluseIcon setTitleColor:UIColor.appColor forState:UIControlStateNormal];
    [_pluseIcon setTranslatesAutoresizingMaskIntoConstraints: NO];
    _pluseIcon.layer.borderColor = UIColor.lightColor.CGColor;
    _pluseIcon.layer.borderWidth = 2;
    _pluseIcon.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    _pluseIcon.titleLabel.textAlignment = NSTextAlignmentCenter;
    _pluseIcon.layer.cornerRadius = 15;
    _pluseIcon.clipsToBounds = YES;
    [_pluseIcon  setTitle: @"+" forState:UIControlStateNormal];
    _pluseIcon.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    [_pluseIcon addTarget:self action:@selector(selectMoviePosterAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _addMoviePoster = [[UILabel alloc] init];
    _addMoviePoster.textColor = [UIColor whiteColor];
    [_addMoviePoster setTranslatesAutoresizingMaskIntoConstraints: NO];
    _addMoviePoster.font = [UIFont boldSystemFontOfSize:15];
    _addMoviePoster.textAlignment = NSTextAlignmentCenter;
    _addMoviePoster.adjustsFontSizeToFitWidth = YES;
    _addMoviePoster.backgroundColor = UIColor.lightColor;
    _addMoviePoster.text = @"  Add movie poster  ";
   
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = UIColor.lightColor;
    [_contentView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self setShadow: _contentView];
    
    _titleTextField = [[UITextField alloc] init];
    [_titleTextField setTranslatesAutoresizingMaskIntoConstraints: NO];
    _titleTextField.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    _titleTextField.placeholder = @" Movie Title";
    _titleTextField.adjustsFontSizeToFitWidth = YES;
    _titleTextField.borderStyle = UITextBorderStyleBezel;
    
    _overviewTextView = [[UITextView alloc] init];
    [_overviewTextView setTranslatesAutoresizingMaskIntoConstraints: NO];
    _overviewTextView.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    _overviewTextView.font = [UIFont systemFontOfSize:15];

    _addMovieButton = [[UIButton alloc] init];
    [_addMovieButton setTranslatesAutoresizingMaskIntoConstraints: NO];
    _addMovieButton.backgroundColor = UIColor.lightColor;
    _addMovieButton.layer.borderColor = UIColor.whiteColor.CGColor;
    _addMovieButton.layer.borderWidth = 3;
    _addMovieButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [_addMovieButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [_addMovieButton setTitle:@"Add Movie" forState:UIControlStateNormal];
    _addMovieButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self setShadow: _addMovieButton];
    [_addMovieButton addTarget:self action:@selector(addMovie) forControlEvents:UIControlEventTouchUpInside];
    
    _datePicker = [[UIDatePicker alloc] init];
    [_datePicker setTranslatesAutoresizingMaskIntoConstraints: NO];
    _datePicker.datePickerMode=UIDatePickerModeDate;
    _datePicker.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    _datePicker.date=[NSDate date];
    [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void) onDatePickerValueChanged: (UIDatePicker *) sender {
    _movieObject.movieRelaseDate = [dateFormat stringFromDate:sender.date];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_addMovieButton sizeToFit];
    [_addMovieButton setContentEdgeInsets: UIEdgeInsetsMake(13, 25, 13, 25)];
}

- (void) addSubviews {
    [self.view addSubview: _movieImageView];
    [self.view addSubview: _addMoviePoster];
    [self.view addSubview: _pluseIcon];
    [self.view addSubview: _contentView];
    [_contentView addSubview: _titleTextField];
    [_contentView addSubview: _overviewTextView];
    [_contentView addSubview:_datePicker];
    [_contentView addSubview: _addMovieButton];
}

- (void)updateViewConstraints {
    if(!_didSetupConstraints) {
        float y = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;

        //movie poster layout
        [_movieImageView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = YES;
        [_movieImageView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor].active = YES;
        [_movieImageView.topAnchor constraintEqualToAnchor: self.view.topAnchor constant: y].active = YES;
        [_movieImageView.heightAnchor constraintEqualToAnchor: self.view.heightAnchor multiplier: 0.33].active = YES;
        
        [_pluseIcon.widthAnchor constraintEqualToConstant: 30].active = YES;
        [_pluseIcon.heightAnchor constraintEqualToConstant: 30].active = YES;
        [_pluseIcon.leadingAnchor constraintEqualToAnchor: _movieImageView.leadingAnchor constant: 10].active = YES;
        [_pluseIcon.topAnchor constraintEqualToAnchor: _movieImageView.topAnchor constant: 25].active = YES;
        
        [_addMoviePoster.widthAnchor constraintEqualToAnchor: self.view.widthAnchor multiplier: 0.37].active = YES;
        [_addMoviePoster.heightAnchor constraintEqualToConstant: 40].active = YES;
        [_addMoviePoster.leadingAnchor constraintEqualToAnchor: _pluseIcon.trailingAnchor constant: -10].active = YES;
        [_addMoviePoster.centerYAnchor constraintEqualToAnchor: _pluseIcon.centerYAnchor].active = YES;
        
        //contentView
        [_contentView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor].active = YES;
        [_contentView.widthAnchor constraintEqualToAnchor: self.view.widthAnchor multiplier: 0.9].active = YES;
        [_contentView.topAnchor constraintEqualToAnchor: _movieImageView.bottomAnchor constant: -30].active = YES;
        [_contentView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor].active = YES;
        
        [_titleTextField.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor].active = YES;
        [_titleTextField.widthAnchor constraintEqualToAnchor: _contentView.widthAnchor multiplier: 0.9].active = YES;
        [_titleTextField.topAnchor constraintEqualToAnchor: _contentView.topAnchor constant: 25].active = YES;
        [_titleTextField.heightAnchor constraintEqualToConstant: 40].active = YES;
        
        //movie relased date
        [_datePicker.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor].active = YES;
        [_datePicker.widthAnchor constraintEqualToAnchor: _contentView.widthAnchor multiplier: 0.9].active = YES;
        [_datePicker.topAnchor constraintEqualToAnchor: _overviewTextView.bottomAnchor constant: 15].active = YES;
        [_datePicker.heightAnchor constraintEqualToAnchor: _contentView.heightAnchor multiplier: 0.25].active = YES;

        [_overviewTextView.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor].active = YES;
        [_overviewTextView.widthAnchor constraintEqualToAnchor: _contentView.widthAnchor multiplier: 0.9].active = YES;
        [_overviewTextView.topAnchor constraintEqualToAnchor: _titleTextField.bottomAnchor constant: 15].active = YES;
        [_overviewTextView.heightAnchor constraintEqualToAnchor: _contentView.heightAnchor multiplier: 0.29].active = YES;
        
        [_addMovieButton.centerXAnchor constraintEqualToAnchor: _contentView.centerXAnchor].active = YES;
        [_addMovieButton.topAnchor constraintEqualToAnchor: _datePicker.bottomAnchor constant: 20].active = YES;
    }
    _didSetupConstraints = YES;
    [super updateViewConstraints];
}

- (void)selectMoviePosterAction:(id)sender {
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:@"Select movie poster" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *choosePhoto= [UIAlertAction actionWithTitle:@"From Photos" style:UIAlertActionStyleDefault handler:^(UIAlertAction  *_Nonnull action) {
        
        UIImagePickerController *pickerView = [[UIImagePickerController alloc] init];
        
        pickerView.allowsEditing = YES;
        
        pickerView.delegate = self;
        
        [pickerView setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        [self presentViewController:pickerView animated:YES completion:nil];

        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:choosePhoto];

    UIAlertAction *actionCancel=[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction  *_Nonnull action) {
        
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:actionCancel];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    _movieImageView.image = chosenImage;
    NSData *imageData = UIImagePNGRepresentation(chosenImage);
    _movieObject.moviePoster = imageData;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) setShadow :(UIView *)view {
    [view.layer setShadowOffset:CGSizeMake(2, 2)];
    [view.layer setShadowColor:  [UIColor appColor].CGColor];
    view.layer.cornerRadius = 8;
    view.layer.shadowRadius = 3;
    [view.layer setShadowOpacity:0.5];
}

- (void) addMovie {
    
    if((_titleTextField.text && _titleTextField.text.length > 0) && (_overviewTextView.text && _overviewTextView.text.length > 0)) {
        _movieObject.movieTitle = _titleTextField.text;
        _movieObject.movieOverview = _overviewTextView.text;
        _titleTextField.text = @"";
        _overviewTextView.text = @"";
        [[MyMoviesView sharedInstance].myMovies addObject: _movieObject];
        NSLog(@"%@", [MyMoviesView sharedInstance].myMovies);
        UIAlertController *alert = [AppAlertController presentAlertControllerWithTite:@"Success" message:@"Movie Added Successfully"];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        UIAlertController *alert = [AppAlertController presentAlertControllerWithTite:@"Warning" message:@"All fields are required"];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

@end
