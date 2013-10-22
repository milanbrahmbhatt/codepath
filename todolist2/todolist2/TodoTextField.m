//
//  TodoTextField.m
//  todolist2
//
//  Created by Milan Brahmbhatt on 10/21/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "TodoTextField.h"

@implementation TodoTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.becamePrimaryResponder = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
