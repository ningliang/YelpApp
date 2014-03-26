//
//  ToggleCell.h
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToggleCellDelegate <NSObject>

- (void)didToggle:(NSString *)toggleName withIndex:(NSInteger)toggleIndex andOn:(BOOL)on;

@end

@interface ToggleCell : UITableViewCell

@property (nonatomic, strong) NSString *toggleName;
@property (nonatomic, assign) NSInteger toggleIndex;
@property (nonatomic, assign) BOOL on;
@property (nonatomic, strong) id<ToggleCellDelegate> delegate;

- (void) onToggleChange:(id)sender;

@end
