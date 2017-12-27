//
//  DCBaseSetViewController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCBaseSetViewController.h"

@interface DCBaseSetViewController ()

@end

@implementation DCBaseSetViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    
    [self setUpAcceptNote];
}
- (void)setUpAcceptNote {
    WEAKSELF
    [[NSNotificationCenter defaultCenter] addObserverForName:LOGINSELECTCENTERINDEX object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.tabBarController.selectedIndex = 3;// 跳转到我的界面
    }];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DCBGColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
