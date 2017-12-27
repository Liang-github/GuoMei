//
//  DCTabBarController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCTabBarController.h"
#import "DCNavigationController.h"
#import "DCLoginMeViewController.h"
#import "DCTabBar.h"

@interface DCTabBarController ()<UITabBarControllerDelegate>


@end

@implementation DCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    [self setUpTabBar];
    [self addDcChildViewController];
    
}
- (void)setUpTabBar {
    DCTabBar *tabBar = [[DCTabBar alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    [self setValue:tabBar forKey:@"tabBar"];
}



@end
