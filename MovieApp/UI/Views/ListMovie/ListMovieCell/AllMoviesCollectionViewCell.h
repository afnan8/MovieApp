//
//  AllMoviesCollectionViewCell.h
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllMoviesCollectionViewCell : UICollectionViewCell

@property (nonatomic) BOOL didSetupConstraints;
@property (nonatomic, strong) UIImageView *movieImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *overviewLabel;
@property (nonatomic, strong) UILabel *dateLabel;

@end

NS_ASSUME_NONNULL_END
