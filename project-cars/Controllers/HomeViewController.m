//
//  HomeViewController.m
//  project-cars
//
//  Created by Doan Phuong on 8/15/17.
//  Copyright © 2017 Phuong Doan. All rights reserved.
//

#import "HomeViewController.h"
#import "MainTabBarController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:self.navigationItem.backBarButtonItem.style target:nil action:nil];
    
}

- (IBAction)logInButtonClicked:(UIButton *)sender {
    MainTabBarController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
