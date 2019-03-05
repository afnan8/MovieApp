//
//  AllMoviesCollectionViewCell.m
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "AllMoviesCollectionViewCell.h"

@implementation AllMoviesCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _didSetupConstraints= NO;
        [self initSubViews];
        [self addSubviews];
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void) initSubViews {
    //movie poster
    _movieImageView = [[UIImageView alloc] init];
    [_movieImageView setTranslatesAutoresizingMaskIntoConstraints: NO];
    _movieImageView.clipsToBounds = YES;
    _movieImageView.layer.masksToBounds = YES;
    _movieImageView.backgroundColor = UIColor.whiteColor;
    [_movieImageView setContentMode: UIViewContentModeScaleToFill];
 
    //movie title
    _titleLabel = [[UILabel alloc] init];
    [_titleLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    _titleLabel.textColor = UIColor.whiteColor;
    _titleLabel.numberOfLines = 0;
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    
    //movie overview
    _overviewLabel = [[UILabel alloc] init];
    [_overviewLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
    _overviewLabel.font = [UIFont systemFontOfSize:15];
    _overviewLabel.textColor = UIColor.appTextColor;
    _overviewLabel.numberOfLines = 3;
    
    //date label
    _dateLabel = [[UILabel alloc] init];
    [_dateLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
    _dateLabel.font = [UIFont boldSystemFontOfSize:12];
    _dateLabel.textColor = UIColor.appTextColor;
    _dateLabel.numberOfLines = 0;
}

- (void) addSubviews {
    [self addSubview: _movieImageView];
    [self addSubview:_titleLabel];
    [self addSubview: _overviewLabel];
    [self addSubview: _dateLabel];
}

- (void)prepareForReuse {
    _titleLabel.text = @"";
    _overviewLabel.text = @"";
    _dateLabel.text = @"";
    _movieImageView.image = [[UIImage alloc] init];
    [_movieImageView.layer removeAllAnimations];
    [super prepareForReuse];

}
- (void)updateConstraints {
    if (!_didSetupConstraints) {
        //movie poster layout
        [_movieImageView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor constant: 15].active = YES;
        [_movieImageView.widthAnchor constraintEqualToAnchor: self.widthAnchor multiplier:0.333].active = YES;
        [_movieImageView.topAnchor constraintEqualToAnchor: self.topAnchor constant: 10].active = YES;
        [_movieImageView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor constant: -10].active = YES;
        //movie title layout
        [_titleLabel.leadingAnchor constraintEqualToAnchor: _movieImageView.trailingAnchor constant: 15].active = YES;
        [_titleLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant: -15].active = YES;
        [_titleLabel.topAnchor constraintEqualToAnchor: _movieImageView.topAnchor].active = YES;
        [_titleLabel.heightAnchor constraintEqualToAnchor: self.heightAnchor multiplier: 0.25].active = YES;
        //movie date
        [_dateLabel.leadingAnchor constraintEqualToAnchor: _movieImageView.trailingAnchor constant: 15].active = YES;
        [_dateLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant: -15].active = YES;
        [_dateLabel.topAnchor constraintEqualToAnchor: _titleLabel.bottomAnchor constant: 3].active = YES;
        [_dateLabel.heightAnchor constraintEqualToConstant: 20].active = YES;
        //movie overview
        [_overviewLabel.leadingAnchor constraintEqualToAnchor: _movieImageView.trailingAnchor constant: 15].active = YES;
        [_overviewLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant: -15].active = YES;
        [_overviewLabel.bottomAnchor constraintEqualToAnchor: _movieImageView.bottomAnchor].active = YES;
        [_overviewLabel.topAnchor constraintEqualToAnchor: _dateLabel.bottomAnchor].active = YES;
    }
    _didSetupConstraints = YES;
    [super updateConstraints];
}
@end
