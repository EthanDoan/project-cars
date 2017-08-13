//
//  Product.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "Product.h"

@interface Product()

@end


@implementation Product

- (instancetype)initWithName:(NSString *)productName countryOfOrigin:(NSString *)productCountryOrigin brand:(NSString *)productBrand images:(NSMutableArray *)productImages price:(NSInteger)productPrice category:(ProductCategory)productCategory status:(ProductStatus)productStatus year:(NSInteger)productYear color:(NSString *)productColor {
    self = [super init];
    
    if (self) {
        self.productName = productName;
        self.productCountryOrigin = productCountryOrigin;
        self.productBrand = productBrand;
        self.productImages = productImages;
        self.productPrice = productPrice;
        self.productCategory = productCategory;
        self.productStatus = productStatus;
        self.productYear = productYear;
        self.productColor = productColor;
    }
    return self;
}

@end
