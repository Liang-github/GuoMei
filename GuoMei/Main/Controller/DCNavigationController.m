//
//  DCNavigationController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCNavigationController.h"
#import "GQGesVCTransition.h"
#import "UIBarButtonItem+DCBarButtonItem.h"


@interface DCNavigationController ()

@end

@implementation DCNavigationController

+ (void)load {
    [self setUpBase];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [GQGesVCTransition validateGesBackWithType:GQGesVCTransitionTypePanWithPercentRight withRequestFailToLoopScrollView:YES]; // 手势返回
}
+ (void)setUpBase {
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = DCBGColor;
    [bar setShadowImage:[UIImage new]];
    [bar setTintColor:[UIColor clearColor]];
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    // 设置导航栏字体颜色
    UIColor *naiColor = [UIColor blackColor];
    attributes[NSForegroundColorAttributeName] = naiColor;
    attributes[NSFontAttributeName] = PFR18Font;
    bar.titleTextAttributes = attributes;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count >= 1) {
        // 返回按钮自定义
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -15;
        
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"navigation_back_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"navigation_back_hl"] forState:UIControlStateHighlighted];
        button.frame = CGRectMake(0, 0, 33, 33);
        
        if (@available(ios 11.0,*)) {
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -15, 0, 0);
            button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
        }
        [button addTarget:self action:@selector(backButtonTapClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.navigationItem.leftBarButtonItems = @[negativeSpacer,backButton];
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 就有滑动返回功能
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    // 跳转
    [super pushViewController:viewController animated:animated];
}
#pragma mark - 点击
- (void)backButtonTapClick {
    [self popViewControllerAnimated:YES];
}
@end
