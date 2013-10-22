//
//  BoxOfficeVC.m
//  rottentomatoes
//
//  Created by Milan Brahmbhatt on 10/16/13.
//  Copyright (c) 2013 Milan Brahmbhatt. All rights reserved.
//

#import "BoxOfficeVC.h"
#import "MovieCell.h"
#import "RottenTomatoesClient.h"

@interface BoxOfficeVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BoxOfficeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        RottenTomatoesClient *client = [[RottenTomatoesClient alloc] init];
        [client boxOfficeWithSuccess:^(AFHTTPRequestOperation *operation, NSArray *movies) {
           
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    cell.titleLabel.text = @"No Pain, No Gain";
    cell.starringLabel.text = @"Mark Wahlberg";
    
    return cell;
}
@end
