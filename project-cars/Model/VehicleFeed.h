//
//  VehicleFeed.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "Vehicle.h"
#import "Vendor.h"

@interface VehicleFeed : Vehicle

@property (strong, nonatomic) NSString *feedTitle;
@property (strong, nonatomic) NSString *feedPublishTime;
@property (assign, nonatomic) NSInteger feedPrice;
@property (strong, nonatomic) NSString *feedDescription;
@property (strong, nonatomic) NSString *feedAddress;
@property (strong, nonatomic) NSString *feedPhoneNumber;
@property (strong, nonatomic) Vendor *feedVendor;


- (instancetype)initWithTitle:(NSString *)feedTitle publishTime:(NSString *)feedPublishTime price:(NSInteger)feedPrice description:(NSString *)feedDescription address:(NSString *)feedAddress phoneNumber:(NSString *)feedPhoneNumber vendor:(Vendor *)vendor;


@end
