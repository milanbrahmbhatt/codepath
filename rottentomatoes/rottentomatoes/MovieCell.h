//
//  MovieCell.h
//  rottentomatoes
//
//  Created by Milan Brahmbhatt on 10/16/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *starringLabel;
@end
