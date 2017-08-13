//
//  Vendor.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Vendor : NSObject

@property (strong, nonatomic) NSString *vendorName;
@property (strong, nonatomic) NSString *vendorAddress;
@property (strong, nonatomic) UIImage *vendorAvatar;

- (instancetype)initWithName:(NSString *)vendorName address:(NSString *)vendorAddress avatar:(UIImage *)vendorAvatar;

@end
