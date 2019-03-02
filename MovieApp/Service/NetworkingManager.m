//
//  NetworkingManager.m
//  MoviesApp
//
//  Created by afnan on 3/1/19.
//  Copyright © 2019 macbook pro. All rights reserved.
//

#import "NetworkingManager.h"

@implementation NetworkingManager
-(void) executeGetServiceWith: (NSString*) url success: (void(^)(MovieListModel* movieList))success failure:(void (^)(NSError * error))failure{

    NSDictionary *headers = @{ @"content-type": @"application/json;charset=utf-8" };
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *urlRequest = [NSURL URLWithString: [NSString stringWithFormat: @"%@%@", baseURL,url]];
    NSLog(@"url %@", urlRequest);

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: urlRequest
                                                        cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                              completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                  
                                                  if (error) {
                                                      failure(error);
                                                  } else {
                                                    NSError *jsonError;
                                                    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                                                
                                                    if (jsonError) {
                                                        NSLog(@"Error parsing JSON");
                                                    } else {
                                                        MovieListModel *result = [[MovieListModel alloc] initWithDictionary: jsonResponse];
                                                        success(result);
                                                    }
                                                  }
                                              }];
    [dataTask resume];
}

@end
