//
//  HelperMethods.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "HelperMethods.h"

@implementation HelperMethods

+ (NSString *)convertStatusToString:(ProductStatus)productStatus {
    switch (productStatus) {
        case PRODUCT_STATUS_NEW:
            return @"New";
            break;
        case PRODUCT_STATUS_SECONDHAND:
            return @"Used";
            break;
        default:
            break;
    }
}

+ (NSString *)convertTranmissionToString:(VehicleTransmissionType)vehicleTranmissionType {
    switch (vehicleTranmissionType) {
        case VEHICLE_TRANSMISSION_TYPE_AUTO:
            return @"Auto";
            break;
        case VEHICLE_TRANSMISSION_TYPE_MANUAL:
            return @"Manual";
            break;
        default:
            break;
    }
}

+ (NSString *)convertSegmentToString:(VehicleSegment)vehicleSegment {
    switch (vehicleSegment) {
        case VEHICLE_SEGMENT_MPV:
            return @"MPV";
            break;
        case VEHICLE_SEGMENT_SUV:
            return @"SUV";
            break;
        case VEHICLE_SEGMENT_VAN:
            return @"VAN";
            break;
        case VEHICLE_SEGMENT_SEDAN:
            return @"Sedan";
            break;
        case VEHICLE_SEGMENT_COUPLE:
            return @"Couple";
            break;
        case VEHICLE_SEGMENT_PICKUP:
            return @"Pick-up";
            break;
        case VEHICLE_SEGMENT_MINIVAN:
            return @"Mini Van";
            break;
        case VEHICLE_SEGMENT_CROSSOVER:
            return @"Cross-over";
            break;
        case VEHICLE_SEGMENT_HATCHBACK:
            return @"Hatchback";
            break;
        default:
            break;
    }
}

+ (NSString *)convertFuelToString:(VehicleFuelType)vehicleFuelType {
    switch (vehicleFuelType) {
        case VEHICLE_FUEL_TYPE_GASOLINE:
            return @"Gasoline";
            break;
        case VEHICLE_FUEL_TYPE_DIESEL:
            return @"Diesel";
        case VEHICLE_FUEL_TYPE_ELECTRIC:
            return @"Electric";
        default:
            break;
    }
}







@end
