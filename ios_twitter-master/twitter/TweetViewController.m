//
//  TweetViewController.m
//  twitter
//
//  Created by Milan Brahmbhatt on 10/23/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "Tweet.h"
#import "ComposeVC.h"
#import "UIImageView+AFNetworking.h"

@interface TweetViewController () {
    Tweet *_tweet;
}

@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *tweetContent;
- (IBAction)onRetweetButton:(id)sender;
- (IBAction)onFavoriteButton:(id)sender;
- (IBAction)onReplyButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profilePicture;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;

@end

@implementation TweetViewController

- (id)initWithTweet:(Tweet *)tweet
{
    _tweet = tweet;
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
    self.tweetContent.text = _tweet.text;
    self.username.text = _tweet.prettyPrint;
    self.timestamp.text = _tweet.created_at;
    
    [self.profileImage setImageWithURL:[NSURL URLWithString:_tweet.profile_image_url]];
    self.profilePicture.clipsToBounds = YES;
    self.profilePicture.layer.cornerRadius = 30;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onRetweetButton:(id)sender {
    [[TwitterClient instance] retweet:_tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidComposeTweet" object:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidComposeTweet" object:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
}

- (IBAction)onFavoriteButton:(id)sender {
    [[TwitterClient instance] favorites:_tweet.tweetId success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"%@", response);
        self.favoriteButton.enabled = NO;
        self.favoriteButton.titleLabel.textColor = [UIColor lightGrayColor];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        self.favoriteButton.enabled = NO;
        self.favoriteButton.titleLabel.textColor = [UIColor lightGrayColor];
    }];
}

- (IBAction)onReplyButton:(id)sender {
    ComposeVC *cvc = [[ComposeVC alloc] init];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:cvc];
    
    cvc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:cvc action:@selector(dismiss)];
    
    cvc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain target:cvc action:@selector(submit)];
    
    cvc.title = @"Reply";
    
    [self presentViewController:nvc animated:YES completion:^(void){
        cvc.tweetContent.text = [NSString stringWithFormat:@"@%@ ", _tweet.screen_name];
        [cvc.tweetContent becomeFirstResponder];
    }];
}
@end
