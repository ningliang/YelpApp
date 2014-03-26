//
//  FiltersViewController.h
//  Yelp
//
//  Created by Ning Liang on 3/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueryFilters.h"
#import "ToggleCell.h"

@protocol FiltersViewDelegate <NSObject>
- (void)didSelectQueryFilters:(QueryFilters *)queryFilters;
@end

@interface FiltersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ToggleCellDelegate>

@property (nonatomic, strong) UIBarButtonItem *cancelButton;
@property (nonatomic, strong) UIBarButtonItem *searchButton;
@property (nonatomic, strong) QueryFilters *queryFilters;

@property (nonatomic, assign) id<FiltersViewDelegate> delegate;

- (void)onCancelClick:(id)sender;
- (void)onSearchClick:(id)sender;

@end
