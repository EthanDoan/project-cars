//
//  VehicleFeed.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "VehicleFeed.h"

@implementation VehicleFeed

- (instancetype)initWithTitle:(NSString *)feedTitle publishTime:(NSString *)feedPublishTime price:(NSInteger)feedPrice description:(NSString *)feedDescription address:(NSString *)feedAddress phoneNumber:(NSString *)feedPhoneNumber vendor:(Vendor *)feedVendor {
    self = [super init];
    if (self) {
        self.feedTitle = feedTitle;
        self.feedPublishTime = feedPublishTime;
        self.feedPrice = feedPrice;
        self.feedDescription = feedDescription;
        self.feedAddress = feedAddress;
        self.feedPhoneNumber = feedPhoneNumber;
        self.feedVendor = feedVendor;
    }
    return self;
}

@end
