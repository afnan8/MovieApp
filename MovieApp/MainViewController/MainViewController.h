//
//  MainViewController.h
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentedControl.h"
#import "AllMoviesView.h"

@interface MainViewController : UIViewController
@property (nonatomic, strong) SegmentedControl* segmentedControl;
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic) float width;
@property (nonatomic) BOOL didSetupConstraints;
@property (nonatomic,strong) AllMoviesView* movieView;
//@property (nonatomic, strong) MyMo
@end

