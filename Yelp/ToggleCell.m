//
//  ToggleCell.m
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ToggleCell.h"

@interface ToggleCell ()

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) IBOutlet UILabel *toggleLabel;

@end

@implementation ToggleCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (void)setToggleName:(NSString *)toggleName {
    _toggleName = toggleName;
    self.toggleLabel.text = toggleName;
}

- (void)setOn:(BOOL) on {
    _on = on;
    self.toggleSwitch.on = on;
}

@end
