//
//  ComposeVC.h
//  twitter
//
//  Created by Milan Brahmbhatt on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComposeVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tweetContent;
- (void)dismiss;
- (void)submit;
@end
