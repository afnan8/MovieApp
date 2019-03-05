//
//  MoviesModel.h
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MoviesModel : NSObject

@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSString  *backdropPath;
@property (nonatomic, strong) NSArray  *genreIds;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString  *originalLanguage;
@property (nonatomic, strong) NSString  *originalTitle;
@property (nonatomic, strong) NSString  *overview;
@property (nonatomic, assign) float popularity;
@property (nonatomic, strong) NSString  *posterPath;
@property (nonatomic, strong) NSString  *releaseDate;
@property (nonatomic, strong) NSString  *title;
@property (nonatomic, assign) BOOL video;
@property (nonatomic, assign) float voteAverage;
@property (nonatomic, assign) NSInteger voteCount;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;
@end

NS_ASSUME_NONNULL_END
