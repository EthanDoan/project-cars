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
#import "MarketViewController.h"

@interface FeedDetailViewController ()

@property (strong, nonatomic) ImageTitleInfoView *imageTitleInfoView;
@property (strong, nonatomic) VendorInfoView *vendorInfoView;
@property (strong, nonatomic) UILabel *descriptionLabel;
@property (assign, nonatomic) NSInteger sumHeight;

@end

@implementation FeedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sumHeight = NAVIGATION_BAR_HEIGHT;

    _imageTitleInfoView = [[[NSBundle mainBundle] loadNibNamed:@"ImageTitleInfoView" owner:self options:nil] firstObject];
    
    [_imageTitleInfoView setFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_WIDTH)];
    _imageTitleInfoView.imageView.image = _vehicleFeed.productImages[0];
    _imageTitleInfoView.titleLabel.text = _vehicleFeed.feedTitle;
    _imageTitleInfoView.priceLabel.text = [NSString stringWithFormat:@"%zd", _vehicleFeed.feedPrice];
    _imageTitleInfoView.timeLabel.text = _vehicleFeed.feedPublishTime;
    [self.view addSubview:_imageTitleInfoView];
    _sumHeight += _imageTitleInfoView.frame.size.height;
    
    _vendorInfoView = [[[NSBundle mainBundle] loadNibNamed:@"VendorInfoView" owner:self options:nil] firstObject];
    [_vendorInfoView setFrame:CGRectMake(0, _imageTitleInfoView.frame.size.height + NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
    _vendorInfoView.imageView.image = _vehicleFeed.feedVendor.vendorAvatar;
    _vendorInfoView.nameLabel.text = _vehicleFeed.feedVendor.vendorName;
    _vendorInfoView.addressLabel.text = _vehicleFeed.feedVendor.vendorAddress;
    _vendorInfoView.viewDetailButton.layer.borderColor = [UIColor orangeColor].CGColor;
    _vendorInfoView.viewDetailButton.layer.borderWidth = 1.0f;
    [self.view addSubview:_vendorInfoView];
    _sumHeight += _vendorInfoView.frame.size.height;
    
    _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _sumHeight, SCREEN_WIDTH, 100)];
    _descriptionLabel.text = @"Liên hệ Ms. Tâm để nhận tư vấn khuyến mãi và lịch giao xe sớm\n     Bán Fortuner với nhiều chương trình Khuyến mãi\n Hỗ trợ Khách hàng có nhu cầu Kinh doanh xe chạy Grap – Uber\n THU MUA XE CŨ VỚI GIÁ CAO - ĐỔI XE MỚI\nChương trình khuyến mãi hấp dẫn với nhiều lựa chọn tại Toyota Hùng Vương cho các dòng xe:\n- Áo trùm xe\n- Ví da đựng hồ sơ\n- Thảm trải sàn\n- Phiếu xăng, phiếu thay nhớt, móc khóa Toyota, khung ảnh, áo thun Toyota,.....\n- Hỗ trợ trả góp đến 95% giá trị xe, lãi suất 0.5%/tháng, thời hạn vay đến 8 năm.\n- Hỗ trợ giao xe và làm thủ tục đăng ký xe trên toàn quốc.\nPhòng Kinh Doanh – Ms. Tâm\nCông ty TNHH Toyota Hùng Vương\n26 Kinh Dương Vương, Phường 13, Quận 6, TP.Hồ Chí Minh.";
    [_descriptionLabel setFont:[UIFont systemFontOfSize:12.0f]];
    _descriptionLabel.numberOfLines = 0;
    [_descriptionLabel setTextColor:[UIColor blueColor]];

    //Calculate the expected size based on the font and linebreak mode of your label
    CGSize maximumLabelSize = CGSizeMake(SCREEN_WIDTH, FLT_MAX);
    CGSize expectedLabelSize = [_vehicleFeed.feedDescription sizeWithFont:_descriptionLabel.font constrainedToSize:maximumLabelSize lineBreakMode:_descriptionLabel.lineBreakMode];

    
    CGRect newFrame = _descriptionLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    _descriptionLabel.frame = newFrame;
    
    [self.view addSubview:_descriptionLabel];
    [self.view bringSubviewToFront:_descriptionLabel];
    
    
}

@end
