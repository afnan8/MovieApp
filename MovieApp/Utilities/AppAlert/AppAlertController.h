//
//  AppAlertController.h
//  MoviesApp
//
//  Created by afnan on 3/2/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppAlertController : NSObject
+(UIAlertController *) presentAlertControllerWithTite: (NSString *)title message: (NSString *) message;
@end

NS_ASSUME_NONNULL_END
