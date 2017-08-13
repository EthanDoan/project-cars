//
//  Vendor.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vendor : NSObject

@property (strong, nonatomic) NSString *vendorName;
@property (strong, nonatomic) NSString *vendorAddress;

- (instancetype)initWithName:(NSString *)vendorName address:(NSString *)vendorAddress;

@end
