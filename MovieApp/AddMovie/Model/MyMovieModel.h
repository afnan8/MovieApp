//
//  MyMovieModel.h
//  MovieApp
//
//  Created by afnan on 3/3/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyMovieModel : NSObject

@property (nonatomic, strong) NSString* movieTitle;
@property (nonatomic, strong) NSString* movieOverview;
@property (nonatomic, strong) NSString* movieRelaseDate;
@property (nonatomic, strong) NSData* moviePoster;

@end

NS_ASSUME_NONNULL_END
