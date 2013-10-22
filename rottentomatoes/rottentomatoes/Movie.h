//
//  Movie.h
//  rottentomatoes
//
//  Created by Milan Brahmbhatt on 10/16/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *starring;

+ (NSArray *) moviesFromJSON;

@end
