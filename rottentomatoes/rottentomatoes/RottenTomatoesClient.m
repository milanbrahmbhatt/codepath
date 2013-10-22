//
//  RottenTomatoesClient.m
//  rottentomatoes
//
//  Created by Milan Brahmbhatt on 10/16/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "RottenTomatoesClient.h"
#import "AFNetworking.h"

@implementation RottenTomatoesClient


- (id)init {
    self = [super initWithBaseURL:[NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/"]];
    
    if (self) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    
    return self;
}

- (void)boxOfficeWithSuccess:(void (^)(AFHTTPRequestOperation *, NSArray *))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    [self getPath:@"lists/movies/box_office.json"
       parameters:@{@"apikey":@"g9au4hv6khv6wzvzgt55gpqs"}
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSArray *movies = [responseObject objectForKey:@"movies"];
              for (NSDictionary *movie in movies) {
                  NSString *title = [movie valueForKeyPath:@"title"];
                  NSString *starring = @"Milan";
              }
              NSLog(@"responseObject: %@", responseObject);
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"error: %@", error);
          }];
}

@end
