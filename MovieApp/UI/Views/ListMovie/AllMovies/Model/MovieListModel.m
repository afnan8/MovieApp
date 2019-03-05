//
//  MovieListModel.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "MovieListModel.h"


NSString *const kMovieListModelPage = @"page";
NSString *const kMovieListModelResults = @"results";
NSString *const kMovieListModelTotalPages = @"total_pages";
NSString *const kMovieListModelTotalResults = @"total_results";

@interface MovieListModel ()
@end

@implementation MovieListModel

/**
  *Instantiate the instance using the passed dictionary values to set the properties values
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kMovieListModelPage] isKindOfClass:[NSNull class]]){
        self.page = [dictionary[kMovieListModelPage] integerValue];
    }
    
    if(dictionary[kMovieListModelResults] != nil && [dictionary[kMovieListModelResults] isKindOfClass:[NSArray class]]){
        NSArray  *resultsDictionaries = dictionary[kMovieListModelResults];
        NSMutableArray  *resultsItems = [NSMutableArray array];
        for(NSDictionary  *resultsDictionary in resultsDictionaries){
            MoviesModel  *resultsItem = [[MoviesModel alloc] initWithDictionary:resultsDictionary];
            [resultsItems addObject:resultsItem];
        }
        self.results = resultsItems;
    }
    if(![dictionary[kMovieListModelTotalPages] isKindOfClass:[NSNull class]]){
        self.totalPages = [dictionary[kMovieListModelTotalPages] integerValue];
    }
    
    if(![dictionary[kMovieListModelTotalResults] isKindOfClass:[NSNull class]]){
        self.totalResults = [dictionary[kMovieListModelTotalResults] integerValue];
    }
    
    return self;
}


/**
  *Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (NSDictionary *)toDictionary
{
    NSMutableDictionary  *dictionary = [NSMutableDictionary dictionary];
    dictionary[kMovieListModelPage] = @(self.page);
    if(self.results != nil){
        NSMutableArray  *dictionaryElements = [NSMutableArray array];
        for(MoviesModel  *resultsElement in self.results){
            [dictionaryElements addObject:[resultsElement toDictionary]];
        }
        dictionary[kMovieListModelResults] = dictionaryElements;
    }
    dictionary[kMovieListModelTotalPages] = @(self.totalPages);
    dictionary[kMovieListModelTotalResults] = @(self.totalResults);
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
    [aCoder encodeObject:@(self.page) forKey:kMovieListModelPage];    if(self.results != nil){
        [aCoder encodeObject:self.results forKey:kMovieListModelResults];
    }
    [aCoder encodeObject:@(self.totalPages) forKey:kMovieListModelTotalPages];    [aCoder encodeObject:@(self.totalResults) forKey:kMovieListModelTotalResults];
}

/**
  *Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.page = [[aDecoder decodeObjectForKey:kMovieListModelPage] integerValue];
    self.results = [aDecoder decodeObjectForKey:kMovieListModelResults];
    self.totalPages = [[aDecoder decodeObjectForKey:kMovieListModelTotalPages] integerValue];
    self.totalResults = [[aDecoder decodeObjectForKey:kMovieListModelTotalResults] integerValue];
    return self;
    
}

/**
  *Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    MovieListModel *copy = [MovieListModel new];
    
    copy.page = self.page;
    copy.results = [self.results copy];
    copy.totalPages = self.totalPages;
    copy.totalResults = self.totalResults;
    
    return copy;
}
@end
