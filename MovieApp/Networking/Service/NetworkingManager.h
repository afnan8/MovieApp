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

@interface NetworkingManager: NSObject

- (void) executeGetServiceWith: (NSString *) url success: (void(^)(NSData *data))success failure:(void (^)(NSError  *error))failure;
- (void) executeGetImageServiceWith: (NSString *) url success: (void(^)(NSData *data))success failure:(void (^)(NSError  *error))failure;
+ (id)sharedManager;
@end

NS_ASSUME_NONNULL_END
