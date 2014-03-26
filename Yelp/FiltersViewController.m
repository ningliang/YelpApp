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
@property (nonatomic, strong) NSMutableArray *expanded;

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

    self.expanded = [@[@(NO), @(NO)] mutableCopy];
    
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
        
        if ([self.expanded[section - 1] boolValue]) {
            if (section == 1) {
                // Sort order
                radioCell.radioName = self.queryFilters.sortOrders[indexPath.row];
                radioCell.on = [radioCell.radioName isEqualToString:self.queryFilters.sortOrder];
            } else {
                // Distance limit
                radioCell.radioName = self.queryFilters.distanceNames[indexPath.row];
                radioCell.on = [radioCell.radioName isEqualToString:[self.queryFilters selectedDistanceName]];
            }
        } else {
            if (section == 1) {
                radioCell.radioName = self.queryFilters.sortOrder;
                radioCell.on = true;
            } else {
                radioCell.radioName = [self.queryFilters selectedDistanceName];
                radioCell.on = true;
            }
        }
        
        return radioCell;
    }
    

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0: return self.queryFilters.toggleCount;
        case 1:
            if ([self.expanded[0] boolValue]) {
                return [self.queryFilters.sortOrders count];
            } else {
                return 1;
            }
        default:
            if ([self.expanded[1] boolValue]) {
                return [self.queryFilters.distanceNames count];
            } else {
                return 1;
            }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    
    if (section == 0) {
        return;
    } else if (section == 1) {
        self.queryFilters.sortOrder = self.queryFilters.sortOrders[indexPath.row];
        self.expanded[0] = @(![self.expanded[0] boolValue]);
    } else if (section == 2) {
        self.queryFilters.distance = [self.queryFilters.distances[indexPath.row] floatValue];
        self.expanded[1] = @(![self.expanded[1] boolValue]);
    }
    
    [self.tableView reloadData];
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
