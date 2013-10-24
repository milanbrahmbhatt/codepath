//
//  ComposeVC.m
//  twitter
//
//  Created by Milan Brahmbhatt on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "ComposeVC.h"

@interface ComposeVC ()
@property (weak, nonatomic) IBOutlet UITextView *tweetContent;

@end

@implementation ComposeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)submit
{
    //tweet submission code.
    [[TwitterClient instance] updateStatus:self.tweetContent.text success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
