//
//  Vehicle.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle


- (instancetype)initWithType:(VehicleType)vehicleType transmission:(VehicleTransmissionType)vehicleTransmissionType fuel:(VehicleFuelType)vehicleFuelType segment:(VehicleSegment)vehicleSegment kilometer:(NSInteger)vehicleKilometer seat:(NSInteger)vehicleSeat {
    self = [super init];
    if (self) {
        self.vehicleType = vehicleType;
        self.vehicleTransmissionType = vehicleTransmissionType;
        self.vehicleFuelType = vehicleFuelType;
        self.vehicleSegment = vehicleSegment;
        self.vehicleKilometer = vehicleKilometer;
        self.vehicleSeat = vehicleSeat;
    }
    return  self;
}


- (instancetype)initFakeVehicle{
    self = [super init];
    if (self) {
        
        self.productName = @"Mazda 3";
        self.productCountryOrigin = @"Japan";
        self.productBrand = @"Mazda";
        self.productImages = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"mazda3.jpg"], nil];
        self.productPrice = 500000;
        self.productCategory = PRODUCT_CATEGORY_VEHICLE;
        self.productStatus = PRODUCT_STATUS_SECONDHAND;
        self.productYear = 2014;
        self.productColor = @"cyan";
        self.vehicleType = VEHICLE_TYPE_PASSENGERCAR;
        self.vehicleTransmissionType = VEHICLE_TRANSMISSION_TYPE_AUTO;
        self.vehicleFuelType = VEHICLE_FUEL_TYPE_GASOLINE;
        self.vehicleSegment = VEHICLE_SEGMENT_SEDAN;
        self.vehicleKilometer = 20000;
        self.vehicleSeat = 5;
        
    }
    return self;
}

@end
