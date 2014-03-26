//
//  RadioCell.m
//  Yelp
//
//  Created by Ning Liang on 3/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "RadioCell.h"

@interface RadioCell ()

@property (weak, nonatomic) IBOutlet UILabel *radioLabel;
@property (weak, nonatomic) IBOutlet UIView *radioStatusView;

@end

@implementation RadioCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRadioName:(NSString *)radioName {
    _radioName = radioName;
    self.radioLabel.text = _radioName;
    
}

- (void)setOn:(BOOL)on {
    _on = on;
    
    self.radioStatusView.layer.borderWidth = 1;
    self.radioStatusView.layer.cornerRadius = 15;
    self.radioStatusView.layer.borderColor = [UIColor grayColor].CGColor;
    if (_on) {
        self.radioStatusView.layer.backgroundColor = [UIColor grayColor].CGColor;
    } else {
        self.radioStatusView.layer.backgroundColor = [UIColor whiteColor].CGColor;
    }
}

@end
