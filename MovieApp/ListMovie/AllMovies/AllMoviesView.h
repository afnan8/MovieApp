//
//  AllMoviesView.h
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "MovieListModel.h"
#import "ListMovieView.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllMoviesView : ListMovieView

@property (nonatomic, strong) MovieListModel* movieListData;
@property(nonatomic) NSInteger currentPage;
@property(nonatomic) NSInteger totalCount;

@end

NS_ASSUME_NONNULL_END
