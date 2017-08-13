//
//  Vendor.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "Vendor.h"

@implementation Vendor

- (instancetype)initWithName:(NSString *)vendorName address:(NSString *)vendorAddress avatar:(UIImage *)vendorAvatar {
    self = [super init];
    if (self) {
        self.vendorName = vendorName;
        self.vendorAddress = vendorAddress;
        self.vendorAvatar = vendorAvatar;
    }
    return self;
}

@end
