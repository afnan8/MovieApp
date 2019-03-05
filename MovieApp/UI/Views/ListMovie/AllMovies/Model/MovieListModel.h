//
//  MovieListModel.h
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoviesModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MovieListModel : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray<MoviesModel *> *results;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, assign) NSInteger totalResults;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
