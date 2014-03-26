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
#import "RadioCell.h"

@interface FiltersViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL sortOrderExpanded;
@property (nonatomic, assign) BOOL distanceExpanded;

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
    
    UINib *radioCellNib = [UINib nibWithNibName:@"RadioCell" bundle:nil];
    [self.tableView registerNib:radioCellNib forCellReuseIdentifier:@"RadioCell"];
    
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(onCancelClick:)];
    [self.cancelButton setTintColor:[UIColor whiteColor]];
    
    [self.navigationItem setLeftBarButtonItem:self.cancelButton];

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
    
    NSInteger section = indexPath.section;
    
    // NSInteger section = indexPath.section;
    if (section == 0 ) {
        NSInteger row = indexPath.row;
    
        ToggleCell *toggleCell = [tableView dequeueReusableCellWithIdentifier:@"ToggleCell" forIndexPath:indexPath];

        toggleCell.toggleIndex = row;
        toggleCell.toggleName = [self.queryFilters toggleName:row];
        toggleCell.on = [self.queryFilters toggleValue:row];
        toggleCell.delegate = self;
        
        return toggleCell;
    } else {
        RadioCell *radioCell = [tableView dequeueReusableCellWithIdentifier:@"RadioCell" forIndexPath:indexPath];
        
        if (section == 1) {
            // Sort order
            radioCell.radioName = self.queryFilters.sortOrders[indexPath.row];
            radioCell.on = [radioCell.radioName isEqualToString:self.queryFilters.sortOrder];
        } else {
            // Distance limit
            radioCell.radioName = self.queryFilters.distanceNames[indexPath.row];
            radioCell.on = [radioCell.radioName isEqualToString:[self.queryFilters selectedDistanceName]];
        }
        
        return radioCell;
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return self.queryFilters.toggleCount;
        case 1: return [self.queryFilters.sortOrders count];
        default: return [self.queryFilters.distances count];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case 0: return @"Category";
        case 1: return @"Sort Order";
        default: return @"Distance";
    }
}


// header views
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}


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
