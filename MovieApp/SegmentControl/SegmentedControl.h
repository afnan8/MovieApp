//
//  SegmentedControl.h
//  MoviesApp
//
//  Created by afnan on 2/28/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppColors.h"

NS_ASSUME_NONNULL_BEGIN

@interface SegmentedControl : UISegmentedControl

- (id) initWithFrame: (CGRect)frame withItems: (NSArray*)items;
@property (nonatomic, strong) UIColor* color;
@end

NS_ASSUME_NONNULL_END
