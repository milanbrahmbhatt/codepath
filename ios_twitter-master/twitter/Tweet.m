//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"
#import "NSDate+TimeAgo.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)created_at {
    NSString *createdAt = [self.data valueOrNilForKeyPath:@"created_at"];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    //dateFormatter.dateFormat = @"DDD MMM dd HH:mm:ss Z YYY";
//    NSDate *date = [dateFormatter dateFromString:createdAt];
//    return [date timeAgo];
    return createdAt;
}

- (NSString *) prettyPrint {
    return [NSString stringWithFormat:@"~ %@ (@%@)",
            self.name,
            self.screen_name];
}

- (NSString *) tweetId {
    return [self.data valueOrNilForKeyPath:@"id"];
}

- (NSString *) screen_name {
    return [self.data valueOrNilForKeyPath:@"user.screen_name"];
}

- (NSString *) profile_image_url {
    return [self.data valueOrNilForKeyPath:@"user.profile_image_url"];
}

- (NSString *) name {
    return [self.data valueOrNilForKeyPath:@"user.name"];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
