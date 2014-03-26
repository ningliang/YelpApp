//
//  MainViewController.h
//  Yelp
//
//  Created by Timothy Lee on 3/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FiltersViewController.h"
#import "QueryFilters.h"

@interface MainViewController : UIViewController <FiltersViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray* businesses;

- (void)onFilterClick:(id)sender;

@end

