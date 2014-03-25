//
//  FiltersViewController.h
//  Yelp
//
//  Created by Ning Liang on 3/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FiltersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *cancelButton;
@property (nonatomic, strong) UIBarButtonItem *searchButton;

- (void)onCancelClick:(id)sender;
- (void)onSearchClick:(id)sender;

@end
