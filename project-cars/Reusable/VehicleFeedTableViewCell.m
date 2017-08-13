//
//  VehicleFeedTableViewCell.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "VehicleFeedTableViewCell.h"

@implementation VehicleFeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.feedPriceLabel setTextColor:[UIColor redColor]];
    [self.feedTimeLabel setTextColor:[UIColor grayColor]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
