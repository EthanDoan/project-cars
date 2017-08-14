//
//  HelperMethods.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "Vehicle.h"

@interface HelperMethods : NSObject
@property (assign, nonatomic) ProductStatus productStatus;
@property (assign, nonatomic) VehicleTransmissionType vehicleTranmissionType;
@property (assign, nonatomic) VehicleSegment vehicleSegment;
@property (assign, nonatomic) VehicleFuelType vehicleFuelType;


+ (NSString *)convertStatusToString:(ProductStatus)productStatus;
+ (NSString *)convertTranmissionToString:(VehicleTransmissionType)vehicleTranmissionType;
+ (NSString *)convertSegmentToString:(VehicleSegment)vehicleSegment;
+ (NSString *)convertFuelToString:(VehicleFuelType)vehicleFuelType;


@end
