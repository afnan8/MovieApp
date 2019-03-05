//
//  NetworkingManager.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "NetworkingManager.h"
#import "Reachability.h"
#import "AppAlertController.h"

@implementation NetworkingManager

+ (id)sharedManager {
    static NetworkingManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

- (void) checkInternetReachability {
    Reachability *reachability = [Reachability reachabilityWithHostName:@"google.com"];
    if ([reachability currentReachabilityStatus] == 0) {
        UIAlertController *alert = [AppAlertController presentAlertControllerWithTite: @"No Network Connection" message:@"turn on mobile data or use WiFi to access data"];
        [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion: nil];
    }
}

- (void) executeGetServiceWith: (NSString *) url success: (void(^)(NSData *data))success failure:(void (^)(NSError  *error))failure{

    [[NetworkingManager sharedManager] checkInternetReachability];

    NSDictionary *headers = @{ @"content-type": @"application/json;charset=utf-8" };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *urlRequest = [NSURL URLWithString: [NSString stringWithFormat: @"%@%@", baseURL,url]];
    NSLog(@"url %@", urlRequest);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: urlRequest
                                                        cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            failure(error);
          } else {
              
              NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
              if (httpResponse.statusCode == 200) {
                  success(data);
              } else {
                  success([[NSData alloc] init]);
                  dispatch_sync(dispatch_get_main_queue(), ^{
                      UIAlertController *alert = [AppAlertController presentAlertControllerWithTite: @"Error" message:@"Invalid API key: You must be granted a valid key."];
                      [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion: nil];
                  });
              }
          }
        
    }];
    [dataTask resume];
}

- (void) executeGetImageServiceWith: (NSString *) url success: (void(^)(NSData *data))success failure:(void (^)(NSError  *error))failure{
    
    NSDictionary *headers = @{ @"content-type": @"application/json;charset=utf-8" };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *urlRequest = [NSURL URLWithString: [NSString stringWithFormat: @"%@",url]];
    NSLog(@"url %@", urlRequest);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: urlRequest
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:0];
    
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    
        if (error) {
            failure(error);
        } else {
            success(data);
        }
    }];
    [dataTask resume];
}

@end
