//
//  MainTabBarController.m
//  project-cars
//
//  Created by Doan Phuong on 8/13/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController () <UISearchBarDelegate>
@property (strong, nonatomic) UISearchBar *searchBar;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];

    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
    [_searchBar sizeToFit];
    self.navigationItem.titleView = _searchBar;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
