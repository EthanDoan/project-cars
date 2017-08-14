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
#import "FeedDetailViewController.h"
#import "BrandCollectionViewCell.h"

@interface MarketViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *brandCollectionView;
@property (strong, nonatomic) NSMutableArray *brands;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (assign, nonatomic) NSInteger sumHeight;

@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sumHeight = NAVIGATION_BAR_HEIGHT;
    self.feeds = [[NSMutableArray alloc] init];
    self.brands = [[NSMutableArray alloc] init];
    self.scrollView = [[UIScrollView alloc] init];
    [_scrollView setFrame:self.view.frame];
    [self.view addSubview:_scrollView];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    dict[@"brandName"] = @"BMW";
    dict[@"brandLogo"] = @"ic_bmw";
    [_brands addObject:dict];
    
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] init];
    dict1[@"brandName"] = @"Chevrolet";
    dict1[@"brandLogo"] = @"ic_chevrolet";
    [_brands addObject:dict1];

    NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] init];
    dict2[@"brandName"] = @"Ford";
    dict2[@"brandLogo"] = @"ic_ford";
    [_brands addObject:dict2];

    NSMutableDictionary *dict3 = [[NSMutableDictionary alloc] init];
    dict3[@"brandName"] = @"Honda";
    dict3[@"brandLogo"] = @"ic_honda";
    [_brands addObject:dict3];

    NSMutableDictionary *dict4 = [[NSMutableDictionary alloc] init];
    dict4[@"brandName"] = @"Hyundai";
    dict4[@"brandLogo"] = @"ic_hyundai";
    [_brands addObject:dict4];

    NSMutableDictionary *dict5 = [[NSMutableDictionary alloc] init];
    dict5[@"brandName"] = @"KIA";
    dict5[@"brandLogo"] = @"ic_kia";
    [_brands addObject:dict5];

    NSMutableDictionary *dict6 = [[NSMutableDictionary alloc] init];
    dict6[@"brandName"] = @"Lexus";
    dict6[@"brandLogo"] = @"ic_lexus";
    [_brands addObject:dict6];
    
    NSMutableDictionary *dict7 = [[NSMutableDictionary alloc] init];
    dict7[@"brandName"] = @"Mazda";
    dict7[@"brandLogo"] = @"ic_mazda";
    [_brands addObject:dict7];
    
    NSMutableDictionary *dict8 = [[NSMutableDictionary alloc] init];
    dict8[@"brandName"] = @"Mercedes";
    dict8[@"brandLogo"] = @"ic_mercedes";
    [_brands addObject:dict8];
    
    NSMutableDictionary *dict9 = [[NSMutableDictionary alloc] init];
    dict9[@"brandName"] = @"Mitsubishi";
    dict9[@"brandLogo"] = @"ic_mitsubishi";
    [_brands addObject:dict9];
    
    NSMutableDictionary *dict10 = [[NSMutableDictionary alloc] init];
    dict10[@"brandName"] = @"Toyota";
    dict10[@"brandLogo"] = @"ic_toyota";
    [_brands addObject:dict10];
    
    NSMutableDictionary *dict11 = [[NSMutableDictionary alloc] init];
    dict11[@"brandName"] = @"Suzuki";
    dict11[@"brandLogo"] = @"ic_suzuki";
    [_brands addObject:dict11];
    
    NSMutableDictionary *dict12 = [[NSMutableDictionary alloc] init];
    dict12[@"brandName"] = @"Audi";
    dict12[@"brandLogo"] = @"ic_audi";
    [_brands addObject:dict12];
    
    NSMutableDictionary *dict13 = [[NSMutableDictionary alloc] init];
    dict13[@"brandName"] = @"others";
    dict13[@"brandLogo"] = @"ic_others";
    [_brands addObject:dict13];
    
    [[NSUserDefaults standardUserDefaults] setObject:_brands forKey:@"brandArray"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    
    
    [_brandCollectionView reloadData];
    [_brandCollectionView setFrame:CGRectMake(0, 64, SCREEN_WIDTH, 100)];
    [_scrollView addSubview:_brandCollectionView];
    _sumHeight += _brandCollectionView.frame.size.height;
    
    [self fakeFeedData];
    [self.marketTableView reloadData];
    [_marketTableView setFrame:CGRectMake(0, _sumHeight, SCREEN_WIDTH, FEED_TABLEVIEW_HEIGHT*_feeds.count)];
    [_scrollView addSubview:_marketTableView];
    _sumHeight += _marketTableView.frame.size.height;
    
    [_scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, _sumHeight + TABBAR_HEIGHT)];
    
}

- (void)fakeFeedData {
    
    for (int i=0; i<10; i++) {
        VehicleFeed *vhFeed = [[VehicleFeed alloc] initFakeVehicle];
        vhFeed.feedVendor = [[Vendor alloc] initWithName:@"PMH Toyota" address:@"806 Nguyen Van Linh, P.Tan Phu, Q.7" avatar:[UIImage imageNamed:@"vendortoyota.jpg"] dateJoin:@"2017-08-14"];
        vhFeed.feedPhoneNumber = @"0909090909";
        vhFeed.feedAddress = @"807 Tran Van Dang, Q10";
        vhFeed.feedDescription = @"Liên hệ Ms. Tâm để nhận tư vấn khuyến mãi và lịch giao xe sớm\nBán Fortuner với nhiều chương trình Khuyến mãi\nHỗ trợ Khách hàng có nhu cầu Kinh doanh xe chạy Grap – Uber\nTHU MUA XE CŨ VỚI GIÁ CAO - ĐỔI XE MỚI\nChương trình khuyến mãi hấp dẫn với nhiều lựa chọn tại Toyota Hùng Vương cho các dòng xe:\n- Áo trùm xe\n- Ví da đựng hồ sơ\n- Thảm trải sàn\n- Phiếu xăng, phiếu thay nhớt, móc khóa Toyota, khung ảnh, áo thun Toyota,.....\n- Hỗ trợ trả góp đến 95% giá trị xe, lãi suất 0.5%/tháng, thời hạn vay đến 8 năm.\n- Hỗ trợ giao xe và làm thủ tục đăng ký xe trên toàn quốc.\nPhòng Kinh Doanh – Ms. Tâm\nCông ty TNHH Toyota Hùng Vương\n26 Kinh Dương Vương, Phường 13, Quận 6, TP.Hồ Chí Minh.";
        vhFeed.feedPrice = 600000000;
        vhFeed.feedTitle = @"Xe Mới Mazda 3 AT 1.5 FL 2017";
        vhFeed.feedPublishTime = [NSString stringWithFormat:@"%@", [NSDate date]];
        [_feeds addObject:vhFeed];
    }
    
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
    FeedDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FeedDetailViewController"];
    vc.vehicleFeed = _feeds[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - BrandCollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (!_brands) {
        return 0;
    } else {
        return _brands.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BrandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCollectionViewCell" forIndexPath:indexPath];
    if (!cell) {
        [collectionView registerClass:[BrandCollectionViewCell class] forCellWithReuseIdentifier:@"BrandCollectionViewCell"];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BrandCollectionViewCell" forIndexPath:indexPath];
    }
    NSDictionary *dict = _brands[indexPath.item];
    cell.cellImageView.image = [UIImage imageNamed:dict[@"brandLogo"]];
    cell.cellTitleLabel.text = dict[@"brandName"];
    
    return cell;
}




@end
