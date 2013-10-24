//
//  TweetViewController.m
//  twitter
//
//  Created by Milan Brahmbhatt on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"

@interface TweetViewController () {
    Tweet *_tweet;
}

@property (weak, nonatomic) IBOutlet UILabel *tweetContent;
- (IBAction)onRetweetButton:(id)sender;
- (IBAction)onFavoriteButton:(id)sender;
- (IBAction)onReplyButton:(id)sender;

@end

@implementation TweetViewController

- (id)initWithTweet:(Tweet *)tweet
{
    _tweet = tweet;
    self.tweetContent.text = tweet.text;
    return self;
}

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

- (IBAction)onRetweetButton:(id)sender {
    [[TwitterClient instance] retweet:_tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)onFavoriteButton:(id)sender {
    [[TwitterClient instance] favorites:_tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (IBAction)onReplyButton:(id)sender {
    [[TwitterClient instance] reply:_tweet.tweetId tweetAuthor:_tweet.screen_name reply:self.tweetContent.text success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
}
@end
