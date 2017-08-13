//
//  Product.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ProductStatus){
    PRODUCT_STATUS_NEW,
    PRODUCT_STATUS_SECONDHAND
};

typedef NS_ENUM(NSInteger, ProductCategory) {
    PRODUCT_CATEGORY_VEHICLE,
    PRODUCT_CATEGORY_MOTOCYCLE
};

@interface Product : NSObject

@property (strong, nonatomic) NSMutableArray *productImages;
@property (assign, nonatomic) NSInteger productPrice;
@property (assign, nonatomic) ProductStatus productStatus;
@property (assign, nonatomic) ProductCategory productCategory;
@property (strong, nonatomic) NSString *productName;
@property (strong, nonatomic) NSString *productCountryOrigin;
@property (strong, nonatomic) NSString *productBrand;
@property (assign, nonatomic) NSInteger productYear;
@property (strong, nonatomic) NSString *productColor;


- (instancetype)initWithName:(NSString *)productName
             countryOfOrigin:(NSString *)productCountryOrigin
                       brand:(NSString *)productBrand
                      images:(NSMutableArray *)productImages
                       price:(NSInteger)productPrice
                    category:(ProductCategory)productCategory
                      status:(ProductStatus)productStatus
                        year:(NSInteger)productYear
                       color:(NSString *)productColor;


@end
