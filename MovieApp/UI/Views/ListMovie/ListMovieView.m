//
//  ListMovieView.m
//  MovieApp
//
//  Created by afnan on 3/3/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "ListMovieView.h"


@implementation ListMovieView

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellIdentifier = @"CellIdentifier";
        _footerIdentifier = @"footerIdentifier";
    }
    return self;
}
- (void) initCollectionView {
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame: CGRectNull collectionViewLayout:layout];
    [_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview: _collectionView];
    [_collectionView.leadingAnchor constraintEqualToAnchor: self.leadingAnchor].active = YES;
    [_collectionView.trailingAnchor constraintEqualToAnchor: self.trailingAnchor].active = YES;
    [_collectionView.topAnchor constraintEqualToAnchor: self.topAnchor].active = YES;
    [_collectionView.bottomAnchor constraintEqualToAnchor: self.bottomAnchor].active = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor appColor];
    [_collectionView registerClass: [AllMoviesCollectionViewCell class] forCellWithReuseIdentifier: _cellIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier: _footerIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}
- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    AllMoviesCollectionViewCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier: _cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width - 40, collectionView.frame.size.height  *0.25 - 10);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return  UIEdgeInsetsMake(5, 20, 5, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier: _footerIdentifier forIndexPath:indexPath];
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicatorView.tag = 10;
    _activityIndicatorView.center = CGPointMake(footerView.bounds.size.width / 2.0f, footerView.bounds.size.height / 2.0f);
    _activityIndicatorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    _activityIndicatorView.hidesWhenStopped = YES;
    [footerView addSubview: _activityIndicatorView];
    
    return footerView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(collectionView.bounds.size.width, 40);
}

- (void) addNoMovieLabel {
    self.noMovieLabel = [[UILabel alloc] init];
    self.noMovieLabel.text = @"No Movie Available";
    self.noMovieLabel.textColor = UIColor.appTextColor;
    self.noMovieLabel.font = [UIFont boldSystemFontOfSize: 20];
    self.noMovieLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.noMovieLabel];
    [self.noMovieLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.noMovieLabel.leadingAnchor constraintEqualToAnchor: self.leadingAnchor].active = YES;
    [self.noMovieLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor].active = YES;
    [self.noMovieLabel.topAnchor constraintEqualToAnchor: self.topAnchor].active = YES;
    [self.noMovieLabel.bottomAnchor constraintEqualToAnchor: self.bottomAnchor].active = YES;
}


- (void) removeMovieLabel {
    [self.noMovieLabel removeFromSuperview];
}

@end
