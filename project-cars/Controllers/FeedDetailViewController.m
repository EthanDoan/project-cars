//
//  FeedDetailViewController.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "FeedDetailViewController.h"
#import "ImageTitleInfoView.h"
#import "VendorInfoView.h"
#import "SpecificationView.h"
#import "ContactView.h"
#import "MarketViewController.h"
#import "HelperMethods.h"


@interface SpecChildView : UIView

@end

@implementation SpecChildView

- (instancetype)initWithIcon:(UIImage *)icon text:(NSString *)text {
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 0, 50, 30)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = icon;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(58, 0, SCREEN_WIDTH/2 - 58, 30)];
        label.text = text;
        [label setFont:[UIFont systemFontOfSize:11.0f]];
        
        [self addSubview:imageView];
        [self addSubview:label];
    }
    return self;
}
@end



@interface FeedDetailViewController ()

@property (strong, nonatomic) ImageTitleInfoView *imageTitleInfoView;
@property (strong, nonatomic) VendorInfoView *vendorInfoView;
@property (strong, nonatomic) SpecificationView *specificationView;
@property (strong, nonatomic) ContactView *contactView;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (assign, nonatomic) NSInteger sumHeight;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *specs;


@end

@implementation FeedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _specs = [[NSMutableArray alloc] init];
    
    _sumHeight = NAVIGATION_BAR_HEIGHT;
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_scrollView];

    //image-title view
    _imageTitleInfoView = [[[NSBundle mainBundle] loadNibNamed:@"ImageTitleInfoView" owner:self options:nil] firstObject];
    [_imageTitleInfoView setFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_WIDTH)];
    _imageTitleInfoView.imageView.image = _vehicleFeed.productImages[0];
    _imageTitleInfoView.titleLabel.text = _vehicleFeed.feedTitle;
    _imageTitleInfoView.priceLabel.text = [NSString stringWithFormat:@"%zd", _vehicleFeed.feedPrice];
    _imageTitleInfoView.timeLabel.text = _vehicleFeed.feedPublishTime;
    [self.scrollView addSubview:_imageTitleInfoView];
    _sumHeight += _imageTitleInfoView.frame.size.height;
    
    //vendor-info view
    _vendorInfoView = [[[NSBundle mainBundle] loadNibNamed:@"VendorInfoView" owner:self options:nil] firstObject];
    [_vendorInfoView setFrame:CGRectMake(0, _imageTitleInfoView.frame.size.height + NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
    _vendorInfoView.imageView.image = _vehicleFeed.feedVendor.vendorAvatar;
    _vendorInfoView.nameLabel.text = _vehicleFeed.feedVendor.vendorName;
    _vendorInfoView.addressLabel.text = _vehicleFeed.feedVendor.vendorAddress;
    _vendorInfoView.dateJoinLabel.text = [NSString stringWithFormat:@"Date join: %@", _vehicleFeed.feedVendor.vendorDateJoin];
    _vendorInfoView.viewDetailButton.layer.borderColor = [UIColor orangeColor].CGColor;
    _vendorInfoView.viewDetailButton.layer.borderWidth = 1.0f;
    [self.scrollView addSubview:_vendorInfoView];
    _sumHeight += _vendorInfoView.frame.size.height;
    
    //description view
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, _sumHeight, SCREEN_WIDTH - 8, 100)];
    _descriptionLabel.text = _vehicleFeed.feedDescription;
    [_descriptionLabel setFont:[UIFont systemFontOfSize:14.0f]];
    _descriptionLabel.numberOfLines = 0;
    CGRect newFrame = _descriptionLabel.frame;
    newFrame.size.height = [self getHeightForText:_descriptionLabel.text withFont:_descriptionLabel.font andWidth:SCREEN_WIDTH] + 8;//8 for padding
    _descriptionLabel.frame = newFrame;
    [self.scrollView addSubview:_descriptionLabel];
    _sumHeight += _descriptionLabel.frame.size.height + 8;//8 for padding
    
    
    //specificationView
    _specificationView = [[[NSBundle mainBundle] loadNibNamed:@"SpecificationView" owner:self options:nil] firstObject];
    [self updateSpecificationView];
    [_scrollView addSubview:_specificationView];
    _sumHeight += _specificationView.frame.size.height;
    
    
    //contact view
    _contactView = [[[NSBundle mainBundle] loadNibNamed:@"ContactView" owner:self options:nil] firstObject];
    _contactView.locationLabel.text = _vehicleFeed.feedAddress;
    _contactView.phoneLabel.text = _vehicleFeed.feedPhoneNumber;
    [_contactView setFrame:CGRectMake(0, _sumHeight, SCREEN_WIDTH, SCREEN_WIDTH*130/375)];
    [self.scrollView addSubview:_contactView];
    _sumHeight += _contactView.frame.size.height;
    
    
    //finally, adjust scroll view content size
    [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, _sumHeight)];
    
    
}

-(float)getHeightForText:(NSString*)text withFont:(UIFont*)font andWidth:(float)width{
    CGSize constraint = CGSizeMake(width, FLT_MAX);
    CGSize title_size;
    float totalHeight;
    title_size = [text boundingRectWithSize:constraint
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{ NSFontAttributeName : font }
                                    context:nil].size;
    
    totalHeight = ceil(title_size.height);
    return totalHeight;
}

- (void)updateSpecificationView {
    if (_vehicleFeed.productBrand) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_brand"] text:_vehicleFeed.productBrand];
        [_specs addObject:specChildView];
    }
    if (_vehicleFeed.productName) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_name"] text:_vehicleFeed.productName];
        [_specs addObject:specChildView];
    }
    if (_vehicleFeed.productYear) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_year"] text:[NSString stringWithFormat:@"%zd", _vehicleFeed.productYear]];
        [_specs addObject:specChildView];
    }
    if (_vehicleFeed.vehicleKilometer) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_kilometer"] text:[NSString stringWithFormat:@"%zd", _vehicleFeed.vehicleKilometer]];
        [_specs addObject:specChildView];
    }
    if (_vehicleFeed.productStatus) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_status"] text:[HelperMethods convertStatusToString:_vehicleFeed.productStatus]];
        [_specs addObject:specChildView];
    }
    SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_transmission"] text:[HelperMethods convertTranmissionToString:_vehicleFeed.vehicleTransmissionType]];
    [_specs addObject:specChildView];
    specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_fuel"] text:[HelperMethods convertFuelToString:_vehicleFeed.vehicleFuelType]];
    [_specs addObject:specChildView];
    if (_vehicleFeed.productCountryOrigin) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_place"] text:_vehicleFeed.productCountryOrigin];
        [_specs addObject:specChildView];
    }
    specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_segment"] text:[HelperMethods convertSegmentToString:_vehicleFeed.vehicleSegment]];
    [_specs addObject:specChildView];
    if (_vehicleFeed.vehicleSeat) {
        SpecChildView *specChildView = [[SpecChildView alloc] initWithIcon:[UIImage imageNamed:@"ic_seat"] text:[NSString stringWithFormat:@"%zd", _vehicleFeed.vehicleSeat]];
        [_specs addObject:specChildView];
    }
    
    NSInteger div = _specs.count/2;
    [_specificationView setFrame:CGRectMake(0, _sumHeight, SCREEN_WIDTH, div*30 + 20)];
    
    int xline = 0;
    int yline = 0;
    
    for (int i=0; i<_specs.count; i++) {
        SpecChildView *specView = _specs[i];
        [specView setFrame:CGRectMake(xline*SCREEN_WIDTH/2, yline*30 + 8, SCREEN_WIDTH/2, 30)];
        [_specificationView addSubview:specView];
        
        xline++;
        if (xline==2) {
            xline=0;
            yline++;
        }
    }
}



@end
