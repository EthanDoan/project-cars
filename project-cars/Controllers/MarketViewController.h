//
//  MarketViewController.h
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define NAVIGATION_BAR_HEIGHT 64.f
#define TABBAR_HEIGHT 49.f
#define FEED_TABLEVIEW_HEIGHT 95.f

@interface MarketViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *marketTableView;

@property (strong, nonatomic) NSMutableArray *feeds;


@end
