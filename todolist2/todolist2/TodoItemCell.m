//
//  TodoItemCell.m
//  todolist2
//
//  Created by Milan Brahmbhatt on 10/20/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "TodoItemCell.h"

@implementation TodoItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
