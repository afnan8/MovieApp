//
//  MyMoviesView.h
//  MovieApp
//
//  Created by afnan on 3/3/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListMovieView.h"
#import "MyMovieModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMoviesView : ListMovieView
@property (nonatomic, strong) NSMutableArray<MyMovieModel *>* myMovies;
+ (MyMoviesView* )sharedInstance;
@end

NS_ASSUME_NONNULL_END
