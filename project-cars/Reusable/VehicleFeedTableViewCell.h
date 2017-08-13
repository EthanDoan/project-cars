//
//  VehicleFeedTableViewCell.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleFeedTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *feedImageView;
@property (weak, nonatomic) IBOutlet UILabel *feedTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedTimeLabel;

@end
