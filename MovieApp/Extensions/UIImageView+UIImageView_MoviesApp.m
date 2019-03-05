//
//  UIImageView+UIImageView_MoviesApp.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "UIImageView+UIImageView_MoviesApp.h"
#import "NetworkingManager.h"

@implementation UIImageView (UIImageView_MoviesApp)

static UIActivityIndicatorView *activityIndicator;

- (void) setImageWithURL: (NSString *) url {
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicator.center = CGPointMake(self.bounds.size.width / 2.0f, self.bounds.size.height / 2.0f);
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    [activityIndicator startAnimating];
    [self addSubview:activityIndicator];
    self.userInteractionEnabled = NO;

    NetworkingManager *manager = [NetworkingManager sharedManager];
    [manager executeGetImageServiceWith:url success:^(NSData  *_Nonnull data) {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self removeActivityIndicator];

            if (data) {
                self.image = [UIImage imageWithData:data];
            } else {
                self.image = [UIImage imageNamed:@"defaultMovie"];
            }
        });
        
    } failure:^(NSError  *_Nonnull error) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self removeActivityIndicator];
            self.image = [UIImage imageNamed:@"defaultMovie"];
        });

    }];
}
- (void) removeActivityIndicator {
    for (UIView *view in self.subviews ){
        if ([view isKindOfClass: UIActivityIndicatorView.self]){
            [view removeFromSuperview];
        }
    }
}
@end
