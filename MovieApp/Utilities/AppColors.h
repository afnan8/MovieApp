//
//  AppColors.h
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (MoviesApp)

+(UIColor *) appColor;
+(UIColor *) lightColor;
+ (UIColor *)appTextColor;

@end
@implementation UIColor (Extensions)

+ (UIColor *)appColor {
    return [UIColor colorWithRed:0.08 green:0.11 blue:0.25 alpha:1.0];}

+ (UIColor *)lightColor {
    return [UIColor colorWithRed:0.16 green:0.27 blue:0.45 alpha:1.0];
}
+ (UIColor *)appTextColor {
    return [UIColor colorWithRed:0.78 green:0.80 blue:0.87 alpha:1.0];
}


@end
