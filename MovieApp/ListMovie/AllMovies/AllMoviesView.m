//
//  AllMoviesView.m
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "AllMoviesView.h"
#import "NetworkingManager.h"
//#import "UIImageView+UIImageView_MoviesApp.h"


@implementation AllMoviesView

- (instancetype)init {
    self = [super init];
    if (self) {
        if(!_movieListData) {
            _currentPage = 1;
            [self fetchListOfMovies];
        }
        [self initCollectionView];
    }
    return self;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movieListData.results.count;
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    AllMoviesCollectionViewCell* movieCell = (AllMoviesCollectionViewCell*) cell;
    movieCell.titleLabel.text = _movieListData.results[indexPath.row].title;
    movieCell.overviewLabel.text = _movieListData.results[indexPath.row].overview;
    movieCell.dateLabel.text = _movieListData.results[indexPath.row].releaseDate;
    [movieCell.movieImageView setContentMode: UIViewContentModeScaleToFill];
    if(_movieListData.results[indexPath.row].posterPath) {
        [movieCell.movieImageView setImageWithURL: [NSString stringWithFormat: @"%@%@", imagePath, _movieListData.results[indexPath.row].posterPath]];
    } else {
        movieCell.movieImageView.image = [UIImage imageNamed:@"defaultMovie"];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if( _movieListData.results.count != _totalCount ) {
        if (scrollView.contentOffset.y == 0) {
//            if (_currentPage > 1) {
//                _currentPage -= 1;
//                [self fetchListOfMovies];
//            }
        } else if ((scrollView.contentOffset.y + scrollView.frame.size.height)>= scrollView.contentSize.height) {
            
            if (!(_currentPage > _movieListData.totalPages) && _currentPage < 1000) {
                _currentPage += 1;
                [self fetchListOfMovies];
                [self.activityIndicatorView startAnimating];
            }
        }
    }
}

-(void) fetchListOfMovies {
    
    if (_currentPage < 1001) {
        NetworkingManager* manager = [[NetworkingManager alloc] init];
        __weak typeof(self) weakSelf = self;
        NSString *url = [NSString stringWithFormat: @"/discover/movie?api_key=%@&page=%ld", apiKey,(long)_currentPage];
        [manager executeGetServiceWith: url success:^(MovieListModel* movieList) {
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (weakSelf.currentPage == 1) {
                    weakSelf.totalCount = movieList.totalPages;
                    weakSelf.movieListData = movieList;
                } else {
                    [weakSelf.movieListData.results addObjectsFromArray: movieList.results];
                }
                if (weakSelf.movieListData.results.count > 0) {
                    [weakSelf.collectionView reloadData];
                    [weakSelf removeMovieLabel];
                } else {
                    [weakSelf addNoMovieLabel];
                }
                [weakSelf.activityIndicatorView stopAnimating];
                NSLog(@"%lu", (unsigned long)weakSelf.movieListData.results.count);

            });
        } failure:^(NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }];
    }
}

@end
