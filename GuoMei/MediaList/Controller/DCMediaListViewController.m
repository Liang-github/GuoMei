//
//  DCMediaListViewController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCMediaListViewController.h"

#import "DCMRViewController.h"
#import "DCMQViewController.h"
#import "DCMVViewController.h"

#import "DCMediaTopToolView.h"

@interface DCMediaListViewController ()

@property (nonatomic, strong) DCMediaTopToolView *topToolView;
@end

@implementation DCMediaListViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setUpNavTopView];
    
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        *norColor = [UIColor darkGrayColor];
        *selColor = [UIColor redColor];
        *proColor = [UIColor redColor];
        *titleFont = PFR16Font
        
        *titleButtonWidth = 65;
        
        *isShowPregressView = YES;
        *isOpenStretch = YES;
        *isOpenShade = YES;
    }];
    
    [self setUpProgressAttribute:^(CGFloat *progressLength, CGFloat *progressHeight) {
        *progressHeight = 3;
    }];
    
    [self setUpTopTitleViewAttribute:^(CGFloat *topDistance, CGFloat *titleViewHeight) {
        *topDistance = 64;
    }];
    
    
    [self setUpAllChildViewController];
}
- (void)setUpNavTopView {
    _topToolView = [[DCMediaTopToolView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 64)];
    _topToolView.leftItemClickBlock = ^{
        
    };
    _topToolView.rightItemClickBlock = ^{
        
    };
    _topToolView.searchButtonClickBlock = ^{
        NSLog(@"点击了美媒搜索榜");
    };
    [self.view addSubview:_topToolView];
}

- (void)setUpAllChildViewController {
    DCMRViewController *vc01 = [DCMRViewController new];
    vc01.title = @"推荐";
    [self addChildViewController:vc01];
    
    DCMQViewController *vc02 = [DCMQViewController new];
    vc02.title = @"圈子";
    [self addChildViewController:vc02];
    
    DCMVViewController *vc03 = [DCMVViewController new];
    vc03.title = @"视频";
    vc03.url = @"http://www.jianshu.com/p/3f248b614bdc";
    [self addChildViewController:vc03];
}
@end
