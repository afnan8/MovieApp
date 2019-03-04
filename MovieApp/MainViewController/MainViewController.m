//
//  MainViewController.m
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "MainViewController.h"
#import "AddMovieViewController.h"
#import "AllMoviesView.h"
#import "MyMoviesView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *addMovie = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd  target:self action:@selector(addMovie)];
    self.navigationItem.rightBarButtonItem = addMovie;
    self.view.backgroundColor = [UIColor appColor];
    _didSetupConstraints= NO;
    [self setupSegmentControl];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: YES];
    [self setCurrentView];

}

-(void) addMovie {
    AddMovieViewController* vc = [[AddMovieViewController alloc] init];
    [self.navigationController pushViewController: vc animated: YES];
}

-(void) setupSegmentControl {
    _width = self.view.frame.size.width;
    float y = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    _segmentedControl = [[SegmentedControl alloc] init];
    _segmentedControl = [_segmentedControl initWithFrame: CGRectMake(0, y, _width, 50) withItems: @[@"All Movies", @"My Movies"]];
    [_segmentedControl addTarget:self action:@selector(setCurrentView) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    _segmentedControl.backgroundColor = [UIColor appColor];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont boldSystemFontOfSize:17], NSFontAttributeName,
                                [UIColor whiteColor], NSForegroundColorAttributeName,
                                nil];
    [_segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *highlightedAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [_segmentedControl setTitleTextAttributes:highlightedAttributes forState:UIControlStateSelected];
}

-(void) setCurrentView {
    
    [_contentView removeFromSuperview];

    [[_segmentedControl.subviews objectAtIndex:0] setTintColor:[UIColor appColor]];
    if (_segmentedControl.selectedSegmentIndex == 0) {
        [[_segmentedControl.subviews objectAtIndex:1] setTintColor: [UIColor lightColor]];
        self.title = @"All Movies";
        _contentView = [[AllMoviesView alloc] init];
    } else if (_segmentedControl.selectedSegmentIndex == 1) {
        [[_segmentedControl.subviews objectAtIndex:0] setTintColor: [UIColor lightColor]];
        self.title = @"My Movies";
        _contentView = [[MyMoviesView alloc] init];
    }
    _didSetupConstraints = NO;
    [self.view addSubview: _contentView];
    [_contentView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints {
    if (!_didSetupConstraints) {
        [_contentView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [_contentView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
        [_contentView.topAnchor constraintEqualToAnchor:_segmentedControl.bottomAnchor constant: 5].active = YES;
        [_contentView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    }
    _didSetupConstraints = YES;
    [super updateViewConstraints];
}

@end
