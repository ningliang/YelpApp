//
//  FiltersViewController.m
//  Yelp
//
//  Created by Ning Liang on 3/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FiltersViewController.h"



@interface FiltersViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *filterSectionConfig;

@end

@implementation FiltersViewController

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

    // TODO style the button
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelClick:)];
    
    [self.navigationItem setLeftBarButtonItem:self.cancelButton];

    // TODO style the button
    self.searchButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStyleBordered target:self action:@selector(onSearchClick:)];

    [self.navigationItem setRightBarButtonItem:self.searchButton];
    
    self.navigationItem.title = @"Filters";
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *config = self.filterSectionConfig[section];
    NSString *type = config[@"type"];
    
    if ([type isEqualToString:@"price"]) {
        return 1;
    } else if ([type isEqualToString:@"expandable"]) {
        return [config[@"values"] count];
    } else { // toggle
        return [config[@"fields"] count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.filterSectionConfig count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *titles = [[NSMutableArray alloc] init];
    for (NSDictionary *config in self.filterSectionConfig) {
        NSString *title = config[@"title"];
        [titles addObject:title];
    }
    return titles;
}

- (void)onCancelClick:(id)sender {
    // TODO notify presentingViewController to dismiss
}

- (void)onSearchClick:(id)sender {
    // TODO notify presentingViewController with new model
}

- (NSArray *)filterSectionConfig {
    if (!_filterSectionConfig) {
        _filterSectionConfig = @[
                                 @{
                                     @"title": @"Price",
                                     @"type": @"price"
                                     },
                                 @{
                                     @"title": @"Most Popular",
                                     @"type": @"toggle",
                                     @"fields": @[
                                             @"Open Now",
                                             @"Hot & New",
                                             @"Offering a Deal",
                                             @"Delivery"
                                             ]
                                     },
                                 @{
                                     @"title": @"Distance",
                                     @"type": @"expandable",
                                     @"values": @[
                                             @"Auto",
                                             @"2 blocks",
                                             @"6 blocks",
                                             @"1 mile",
                                             @"5 miles"
                                             ]
                                     },
                                 @{
                                     @"title": @"Sort by",
                                     @"type": @"expandable",
                                     @"values": @[
                                             @"Best Match",
                                             @"Distance",
                                             @"Rating",
                                             @"Most Reviewed"
                                             ]
                                     },
                                 @{
                                     @"title": @"General Features",
                                     @"type": @"toggle",
                                     @"fields": @[
                                             @"Take-out",
                                             @"Good for Groups",
                                             @"Good for Kids",
                                             @"Beer & Wine Only",
                                             @"Takes Reservations",
                                             @"Accepts Credit Cards",
                                             @"Outdoor Seating",
                                             @"Wheelchair Accessible",
                                             @"Has TV",
                                             @"Full Bar",
                                             @"Happy Hour",
                                             @"Free Wi-Fi",
                                             @"Paid Wi-Fi"
                                             ]
                                     }
                                 ];
    }
    return _filterSectionConfig;
}

@end
