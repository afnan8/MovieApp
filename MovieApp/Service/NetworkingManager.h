//
//  NetworkingManager.h
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Globals.h"
#import "MovieListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkingManager : NSObject
-(void) executeGetServiceWith: (NSString*)url success: (void(^)(MovieListModel* movieList))success failure:(void (^)(NSError * error))failure;

@end

NS_ASSUME_NONNULL_END
