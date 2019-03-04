//
//  MyMoviesView.m
//  MovieApp
//
//  Created by afnan on 3/3/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "MyMoviesView.h"

@implementation MyMoviesView

+ (MyMoviesView*)sharedInstance {
    static MyMoviesView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.myMovies = [[NSMutableArray alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initCollectionView];
//        [self.collectionView reloadData];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if ([MyMoviesView sharedInstance].myMovies.count > 0) {
        [self removeMovieLabel];
        [self.collectionView setHidden:NO];
    } else {
        [self addNoMovieLabel];
        [self.collectionView setHidden:YES];
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [MyMoviesView sharedInstance].myMovies.count;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    AllMoviesCollectionViewCell* movieCell = (AllMoviesCollectionViewCell*) cell;
    movieCell.titleLabel.text = [MyMoviesView sharedInstance].myMovies[indexPath.row].movieTitle;
    movieCell.overviewLabel.text = [MyMoviesView sharedInstance].myMovies[indexPath.row].movieOverview;
    movieCell.dateLabel.text = [MyMoviesView sharedInstance].myMovies[indexPath.row].movieRelaseDate;
    NSLog(@"%@", [MyMoviesView sharedInstance].myMovies[indexPath.row].moviePoster) ;

    if([MyMoviesView sharedInstance].myMovies[indexPath.row].moviePoster) {
        movieCell.movieImageView.image = [UIImage imageWithData:[MyMoviesView sharedInstance].myMovies[indexPath.row].moviePoster];
    } else {
        movieCell.movieImageView.image = [UIImage imageNamed:@"defaultMovie"];
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}

@end
