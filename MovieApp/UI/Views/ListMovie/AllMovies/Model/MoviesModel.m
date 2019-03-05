//
//  MoviesModel.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "MoviesModel.h"

NSString *const kMovieAdult = @"adult";
NSString *const kMovieBackdropPath = @"backdrop_path";
NSString *const kMovieGenreIds = @"genre_ids";
NSString *const kMovieIdField = @"id";
NSString *const kMovieOriginalLanguage = @"original_language";
NSString *const kMovieOriginalTitle = @"original_title";
NSString *const kMovieOverview = @"overview";
NSString *const kMoviePopularity = @"popularity";
NSString *const kMoviePosterPath = @"poster_path";
NSString *const kMovieReleaseDate = @"release_date";
NSString *const kMovieTitle = @"title";
NSString *const kMovieVideo = @"video";
NSString *const kMovieVoteAverage = @"vote_average";
NSString *const kMovieVoteCount = @"vote_count";

@interface MoviesModel ()
@end

@implementation MoviesModel
/**
  *Instantiate the instance using the passed dictionary values to set the properties values
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMovieAdult] isKindOfClass:[NSNull class]]){
        self.adult = [dictionary[kMovieAdult] boolValue];
    }
    
    if(![dictionary[kMovieBackdropPath] isKindOfClass:[NSNull class]]){
        self.backdropPath = dictionary[kMovieBackdropPath];
    }
    if(![dictionary[kMovieGenreIds] isKindOfClass:[NSNull class]]){
        self.genreIds = dictionary[kMovieGenreIds];
    }
    if(![dictionary[kMovieIdField] isKindOfClass:[NSNull class]]){
        self.idField = [dictionary[kMovieIdField] integerValue];
    }
    
    if(![dictionary[kMovieOriginalLanguage] isKindOfClass:[NSNull class]]){
        self.originalLanguage = dictionary[kMovieOriginalLanguage];
    }
    if(![dictionary[kMovieOriginalTitle] isKindOfClass:[NSNull class]]){
        self.originalTitle = dictionary[kMovieOriginalTitle];
    }
    if(![dictionary[kMovieOverview] isKindOfClass:[NSNull class]]){
        self.overview = dictionary[kMovieOverview];
    }
    if(![dictionary[kMoviePopularity] isKindOfClass:[NSNull class]]){
        self.popularity = [dictionary[kMoviePopularity] floatValue];
    }
    
    if(![dictionary[kMoviePosterPath] isKindOfClass:[NSNull class]]){
        self.posterPath = dictionary[kMoviePosterPath];
    }
    if(![dictionary[kMovieReleaseDate] isKindOfClass:[NSNull class]]){
        self.releaseDate = dictionary[kMovieReleaseDate];
    }
    if(![dictionary[kMovieTitle] isKindOfClass:[NSNull class]]){
        self.title = dictionary[kMovieTitle];
    }
    if(![dictionary[kMovieVideo] isKindOfClass:[NSNull class]]){
        self.video = [dictionary[kMovieVideo] boolValue];
    }
    
    if(![dictionary[kMovieVoteAverage] isKindOfClass:[NSNull class]]){
        self.voteAverage = [dictionary[kMovieVoteAverage] floatValue];
    }
    
    if(![dictionary[kMovieVoteCount] isKindOfClass:[NSNull class]]){
        self.voteCount = [dictionary[kMovieVoteCount] integerValue];
    }
    
    return self;
}


/**
  *Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (NSDictionary *)toDictionary
{
    NSMutableDictionary  *dictionary = [NSMutableDictionary dictionary];
    dictionary[kMovieAdult] = @(self.adult);
    if(self.backdropPath != nil){
        dictionary[kMovieBackdropPath] = self.backdropPath;
    }
    if(self.genreIds != nil){
        dictionary[kMovieGenreIds] = self.genreIds;
    }
    dictionary[kMovieIdField] = @(self.idField);
    if(self.originalLanguage != nil){
        dictionary[kMovieOriginalLanguage] = self.originalLanguage;
    }
    if(self.originalTitle != nil){
        dictionary[kMovieOriginalTitle] = self.originalTitle;
    }
    if(self.overview != nil){
        dictionary[kMovieOverview] = self.overview;
    }
    dictionary[kMoviePopularity] = @(self.popularity);
    if(self.posterPath != nil){
        dictionary[kMoviePosterPath] = self.posterPath;
    }
    if(self.releaseDate != nil){
        dictionary[kMovieReleaseDate] = self.releaseDate;
    }
    if(self.title != nil){
        dictionary[kMovieTitle] = self.title;
    }
    dictionary[kMovieVideo] = @(self.video);
    dictionary[kMovieVoteAverage] = @(self.voteAverage);
    dictionary[kMovieVoteCount] = @(self.voteCount);
    return dictionary;
    
}

/**
  *Implementation of NSCoding encoding method
 */
/**
  *Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.adult) forKey:kMovieAdult];    if(self.backdropPath != nil){
        [aCoder encodeObject:self.backdropPath forKey:kMovieBackdropPath];
    }
    if(self.genreIds != nil){
        [aCoder encodeObject:self.genreIds forKey:kMovieGenreIds];
    }
    [aCoder encodeObject:@(self.idField) forKey:kMovieIdField];    if(self.originalLanguage != nil){
        [aCoder encodeObject:self.originalLanguage forKey:kMovieOriginalLanguage];
    }
    if(self.originalTitle != nil){
        [aCoder encodeObject:self.originalTitle forKey:kMovieOriginalTitle];
    }
    if(self.overview != nil){
        [aCoder encodeObject:self.overview forKey:kMovieOverview];
    }
    [aCoder encodeObject:@(self.popularity) forKey:kMoviePopularity];    if(self.posterPath != nil){
        [aCoder encodeObject:self.posterPath forKey:kMoviePosterPath];
    }
    if(self.releaseDate != nil){
        [aCoder encodeObject:self.releaseDate forKey:kMovieReleaseDate];
    }
    if(self.title != nil){
        [aCoder encodeObject:self.title forKey:kMovieTitle];
    }
    [aCoder encodeObject:@(self.video) forKey:kMovieVideo];    [aCoder encodeObject:@(self.voteAverage) forKey:kMovieVoteAverage];    [aCoder encodeObject:@(self.voteCount) forKey:kMovieVoteCount];
}

/**
  *Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.adult = [[aDecoder decodeObjectForKey:kMovieAdult] boolValue];
    self.backdropPath = [aDecoder decodeObjectForKey:kMovieBackdropPath];
    self.genreIds = [aDecoder decodeObjectForKey:kMovieGenreIds];
    self.idField = [[aDecoder decodeObjectForKey:kMovieIdField] integerValue];
    self.originalLanguage = [aDecoder decodeObjectForKey:kMovieOriginalLanguage];
    self.originalTitle = [aDecoder decodeObjectForKey:kMovieOriginalTitle];
    self.overview = [aDecoder decodeObjectForKey:kMovieOverview];
    self.popularity = [[aDecoder decodeObjectForKey:kMoviePopularity] floatValue];
    self.posterPath = [aDecoder decodeObjectForKey:kMoviePosterPath];
    self.releaseDate = [aDecoder decodeObjectForKey:kMovieReleaseDate];
    self.title = [aDecoder decodeObjectForKey:kMovieTitle];
    self.video = [[aDecoder decodeObjectForKey:kMovieVideo] boolValue];
    self.voteAverage = [[aDecoder decodeObjectForKey:kMovieVoteAverage] floatValue];
    self.voteCount = [[aDecoder decodeObjectForKey:kMovieVoteCount] integerValue];
    return self;
    
}

/**
  *Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MoviesModel *copy = [MoviesModel new];
    
    copy.adult = self.adult;
    copy.backdropPath = [self.backdropPath copy];
    copy.genreIds = [self.genreIds copy];
    copy.idField = self.idField;
    copy.originalLanguage = [self.originalLanguage copy];
    copy.originalTitle = [self.originalTitle copy];
    copy.overview = [self.overview copy];
    copy.popularity = self.popularity;
    copy.posterPath = [self.posterPath copy];
    copy.releaseDate = [self.releaseDate copy];
    copy.title = [self.title copy];
    copy.video = self.video;
    copy.voteAverage = self.voteAverage;
    copy.voteCount = self.voteCount;
    
    return copy;
}
@end
