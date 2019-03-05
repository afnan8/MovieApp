//
//  AppAlertController.m
//  MoviesApp
//
//  Created by afnan on 3/2/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "AppAlertController.h"

@implementation AppAlertController
+(UIAlertController *) presentAlertControllerWithTite: (NSString *)title message: (NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle: title
                                                                   message: message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction  *action) {}];
    
    [alert addAction:defaultAction];
    return alert;
}
@end
