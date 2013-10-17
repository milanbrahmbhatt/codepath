//
//  TodoItemViewCell.m
//  todolist
//
//  Created by Milan Brahmbhatt on 10/14/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "TodoItemViewCell.h"

@implementation TodoItemViewCell

//TODO WHY SYNTHESIZE?
@synthesize todoItemLabel = _todoItemLabel;

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
