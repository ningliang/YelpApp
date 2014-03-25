//
//  MainViewController.m
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import "FiltersViewController.h"

#import "YelpClient.h"
#import "Business.h"
#import "BusinessCell.h"

NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";

@interface MainViewController ()

@property (nonatomic, strong) YelpClient *client;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIBarButtonItem *filterButton;

// Prototype cell used to calculate height
@property (nonatomic, strong) BusinessCell *prototypeCell;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey consumerSecret:kYelpConsumerSecret accessToken:kYelpToken accessSecret:kYelpTokenSecret];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *businessCellNib = [UINib nibWithNibName:@"BusinessCell" bundle:nil];
    [self.tableView registerNib:businessCellNib forCellReuseIdentifier:@"BusinessCell"];
    
    self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"BusinessCell"];
    
    // TODO style the button
    self.filterButton = [[UIBarButtonItem alloc] initWithTitle:@"Filter" style:UIBarButtonItemStyleBordered target:self action:@selector(onFilterClick:)];
    
    [self.navigationItem setLeftBarButtonItem:self.filterButton];
    [self reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessCell" forIndexPath:indexPath];
    
    [self configureCell:cell forRow:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.businesses count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self configureCell:self.prototypeCell forRow:indexPath.row];

    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));

    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    
    return size.height + 1;
}

- (void)configureCell:(BusinessCell *)cell forRow:(NSInteger)row {
    Business *business = self.businesses[row];
    [cell setBusiness:business withRow:row];
}

// TODO show loading screen
// TODO show network error
- (void)reloadData {
    [self.client searchWithTerm:@"Thai" success:^(AFHTTPRequestOperation *operation, id response) {
        NSMutableArray *businesses = [[NSMutableArray alloc] init];
        for (NSDictionary *dictionary in response[@"businesses"]) {
            Business *business = [Business businessWithDictionary:dictionary];
            [businesses addObject:business];
        }
        self.businesses = businesses;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", [error description]);
    }];

}

- (void)onFilterClick:(id)sender {
    FiltersViewController *filtersViewController = [[FiltersViewController alloc] init];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:filtersViewController];
    
    [navController.navigationBar setBarTintColor:[UIColor colorWithRed:0.804 green:0.11 blue:0.094 alpha:1.0]];
    
    [self presentViewController:navController animated:YES completion:nil];
}

@end
