//
//  ToggleCell.h
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToggleCell : UITableViewCell

@property (assign, nonatomic) NSInteger toggleIndex;
@property (strong, nonatomic) NSString *toggleName;
@property (assign, nonatomic) BOOL on;

@end
