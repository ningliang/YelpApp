//
//  BusinessCell.h
//  Yelp
//
//  Created by Ning Liang on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"

@interface BusinessCell : UITableViewCell

@property (nonatomic, strong) Business *business;
@property (nonatomic, assign) NSInteger row;

- (void)setBusiness:(Business *)business withRow:(NSInteger)row;

@end
