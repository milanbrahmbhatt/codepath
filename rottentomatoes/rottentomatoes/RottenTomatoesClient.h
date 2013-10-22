//
//  RottenTomatoesClient.h
//  rottentomatoes
//
//  Created by Milan Brahmbhatt on 10/16/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "AFHTTPClient.h"

@interface RottenTomatoesClient : AFHTTPClient

- (void)boxOfficeWithSuccess:(void (^)(AFHTTPRequestOperation *operation, NSArray *movies))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *))failure;

@end
