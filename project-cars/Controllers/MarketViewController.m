//
//  MarketViewController.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "MarketViewController.h"
#import "VehicleFeed.h"
#import "Vendor.h"
#import "VehicleFeedTableViewCell.h"

@interface MarketViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.feeds = [[NSMutableArray alloc] init];
    
    for (int i=0; i<10; i++) {
        VehicleFeed *vhFeed = [[VehicleFeed alloc] initFakeVehicle];
        vhFeed.feedVendor = [[Vendor alloc] initWithName:@"PMH Toyota" address:@"806 Nguyen Van Linh, P.Tan Phu, Q.7"];
        vhFeed.feedPhoneNumber = @"0909090909";
        vhFeed.feedAddress = @"807 Tran Van Dang, Q10";
        vhFeed.feedDescription = @"Liên hệ Ms. Tâm để nhận tư vấn khuyến mãi và lịch giao xe sớm\n      Bán Fortuner với nhiều chương trình Khuyến mãi\n Hỗ trợ Khách hàng có nhu cầu Kinh doanh xe chạy Grap – Uber\n THU MUA XE CŨ VỚI GIÁ CAO - ĐỔI XE MỚI\nChương trình khuyến mãi hấp dẫn với nhiều lựa chọn tại Toyota Hùng Vương cho các dòng xe:\n- Áo trùm xe\n- Ví da đựng hồ sơ\n- Thảm trải sàn\n- Phiếu xăng, phiếu thay nhớt, móc khóa Toyota, khung ảnh, áo thun Toyota,.....\n- Hỗ trợ trả góp đến 95% giá trị xe, lãi suất 0.5%/tháng, thời hạn vay đến 8 năm.\n- Hỗ trợ giao xe và làm thủ tục đăng ký xe trên toàn quốc.\nPhòng Kinh Doanh – Ms. Tâm\nCông ty TNHH Toyota Hùng Vương\n26 Kinh Dương Vương, Phường 13, Quận 6, TP.Hồ Chí Minh.";
        vhFeed.feedPrice = 600000000;
        vhFeed.feedTitle = @"Xe Mới Mazda 3 AT 1.5 FL 2017";
        vhFeed.feedPublishTime = [NSString stringWithFormat:@"%@", [NSDate date]];
        [_feeds addObject:vhFeed];
    }
    
    [self.marketTableView reloadData];
    
    
    
}

#pragma mark - MarketTableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (!_feeds) {
        return 0;
    } else {
        return _feeds.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VehicleFeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VehicleFeedTableViewCell"];
    
    if (!cell) {
        [tableView registerClass:[VehicleFeedTableViewCell class] forCellReuseIdentifier:@"VehicleFeedTableViewCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"VehicleFeedTableViewCell"];
    }
    
    VehicleFeed *feed = _feeds[indexPath.row];
    cell.feedImageView.image = feed.productImages[0];
    cell.feedTitleLabel.text = feed.feedTitle;
    cell.feedPriceLabel.text = [NSString stringWithFormat:@"%zd vnd", feed.feedPrice];
    cell.feedTimeLabel.text = [NSString stringWithFormat:@"%@ | %@", feed.feedPublishTime, feed.feedAddress];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
