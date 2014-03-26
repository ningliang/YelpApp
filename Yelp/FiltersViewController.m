//
//  FiltersViewController.m
//  Yelp
//
//  Created by Ning Liang on 3/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "FiltersViewController.h"
#import "MainViewController.h"
#import "ToggleCell.h"

@interface FiltersViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

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

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Register custom cell types
    UINib *toggleCellNib = [UINib nibWithNibName:@"ToggleCell" bundle:nil];
    [self.tableView registerNib:toggleCellNib forCellReuseIdentifier:@"ToggleCell"];
    
    // TODO style the button
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelClick:)];
    [self.cancelButton setTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setLeftBarButtonItem:self.cancelButton];

    // TODO style the button
    self.searchButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStyleBordered target:self action:@selector(onSearchClick:)];
    [self.searchButton setTintColor:[UIColor whiteColor]];

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
    
    // NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    ToggleCell *toggleCell = [tableView dequeueReusableCellWithIdentifier:@"ToggleCell" forIndexPath:indexPath];

    toggleCell.toggleIndex = row;
    toggleCell.toggleName = [self.queryFilters toggleName:row];
    toggleCell.on = [self.queryFilters toggleValue:row];
    toggleCell.delegate = self;
    
    return toggleCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.queryFilters.toggleCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // FOR NOW
}

// - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return @[@"Category"];
// }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)didToggle:(NSString *)toggleName withIndex:(NSInteger)toggleIndex andOn:(BOOL)on {
    [self.queryFilters setToggle:toggleIndex withValue:on];
}

- (void)onCancelClick:(id)sender {
    [self.delegate didSelectQueryFilters:nil];
}

- (void)onSearchClick:(id)sender {
    [self.delegate didSelectQueryFilters:self.queryFilters];
}

@end
