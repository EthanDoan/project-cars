//
//  Vehicle.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "Product.h"

typedef NS_ENUM(NSInteger, VehicleType) {
    VEHICLE_TYPE_PASSENGERCAR,
    VEHICLE_TYPE_TRUCK
};

typedef NS_ENUM(NSInteger, VehicleTransmissionType) {
    VEHICLE_TRANSMISSION_TYPE_AUTO,
    VEHICLE_TRANSMISSION_TYPE_MANUAL
};


typedef NS_ENUM(NSInteger, VehicleFuelType) {
    VEHICLE_FUEL_TYPE_GASOLINE,
    VEHICLE_FUEL_TYPE_DIESEL,
    VEHICLE_FUEL_TYPE_ELECTRIC
};

typedef NS_ENUM(NSInteger, VehicleSegment) {
    VEHICLE_SEGMENT_SEDAN,
    VEHICLE_SEGMENT_HATCHBACK,
    VEHICLE_SEGMENT_PICKUP,
    VEHICLE_SEGMENT_VAN,
    VEHICLE_SEGMENT_MINIVAN,
    VEHICLE_SEGMENT_MPV,
    VEHICLE_SEGMENT_SUV,
    VEHICLE_SEGMENT_CROSSOVER,
    VEHICLE_SEGMENT_COUPLE
};


@interface Vehicle : Product

@property (assign, nonatomic) VehicleType vehicleType;
@property (assign, nonatomic) VehicleTransmissionType vehicleTransmissionType;
@property (assign, nonatomic) NSInteger vehicleKilometer;
@property (assign, nonatomic) NSInteger vehicleSeat;
@property (assign, nonatomic) VehicleFuelType vehicleFuelType;
@property (assign, nonatomic) VehicleSegment vehicleSegment;


- (instancetype)initWithType:(VehicleType)vehicleType transmission:(VehicleTransmissionType)vehicleTransmissionType fuel:(VehicleFuelType)vehicleFuelType segment:(VehicleSegment)vehicleSegment kilometer:(NSInteger)vehicleKilometer seat:(NSInteger)vehicleSeat;

- (id)initFakeVehicle;



@end
