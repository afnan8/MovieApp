//
//  ListMovieView.h
//  MovieApp
//
//  Created by afnan on 3/3/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllMoviesCollectionViewCell.h"
#import "UIImageView+UIImageView_MoviesApp.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListMovieView: UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
/**
 view used as parent for each class "AllMovies view" and "MyMovie view"
 */
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic) UIActivityIndicatorView* activityIndicatorView;
@property (nonatomic, strong) NSString* cellIdentifier;
@property (nonatomic, strong) NSString* footerIdentifier;
@property (nonatomic, strong) UILabel* noMovieLabel;

- (void) initCollectionView;
- (instancetype)init;
-(void) addNoMovieLabel;
-(void) removeMovieLabel;

@end

NS_ASSUME_NONNULL_END
