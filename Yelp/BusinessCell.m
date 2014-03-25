//
//  BusinessCell.m
//  Yelp
//
//  Created by Ning Liang on 3/23/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "BusinessCell.h"
#import "UIImageView+AFNetworking.h"


@interface BusinessCell ()

@property (weak, nonatomic) IBOutlet UIImageView *businessImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;

@property (weak, nonatomic) IBOutlet UILabel *businessNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *costLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

@end

@implementation BusinessCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBusiness:(Business *)business withRow:(NSInteger) row {
    _business = business;
    
    self.row = row;
    
    self.businessNameLabel.text = [NSString stringWithFormat:@"%d. %@", self.row + 1, self.business.name];
    self.reviewCountLabel.text = [NSString stringWithFormat:@"%d Reviews", self.business.reviewCount];
    self.locationLabel.text = [NSString stringWithFormat:@"%@, %@", self.business.address, self.business.neighborhood];
    self.categoryLabel.text = self.business.categories;
    
    [self.businessImageView setImageWithURL:[NSURL URLWithString:self.business.imageUrl]];
    
    [self.ratingImageView setImageWithURL:[NSURL URLWithString:self.business.ratingImageUrl]];

    self.businessImageView.layer.cornerRadius = 8.0;
    self.businessImageView.layer.masksToBounds = YES;
    self.businessImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.businessImageView.layer.borderWidth = 1.0;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.businessNameLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.businessNameLabel.frame);
}


@end
