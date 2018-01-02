//
//  DCGoodsParticularsViewController.m
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "DCGoodsParticularsViewController.h"
#import "DCParticularsShowViewController.h"

@interface DCGoodsParticularsViewController ()

@end

@implementation DCGoodsParticularsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
    
    [self setUpDisplayStyle:^(UIColor *__autoreleasing *titleScrollViewBgColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIColor *__autoreleasing *proColor, UIFont *__autoreleasing *titleFont, CGFloat *titleButtonWidth, BOOL *isShowPregressView, BOOL *isOpenStretch, BOOL *isOpenShade) {
        
        *titleFont = PFR16Font;      //字体尺寸 (默认fontSize为15)
        *norColor = [UIColor darkGrayColor];
        
        /*
         以下BOOL值默认都为NO
         */
        *isShowPregressView = YES;                      //是否开启标题下部Pregress指示器
        *isOpenStretch = YES;                           //是否开启指示器拉伸效果
        *isOpenShade = YES;                             //是否开启字体渐变
    }];
}
- (void)setUpAllChildViewController {
    DCParticularsShowViewController *vc01 = [DCParticularsShowViewController new];
    vc01.title = @"商品介绍";
    vc01.particularUrl = CDDJianShu01;
    [self addChildViewController:vc01];
    
    DCParticularsShowViewController *vc02 = [DCParticularsShowViewController new];
    vc02.title = @"规格参数";
    vc02.particularUrl = CDDJianShu02;
    [self addChildViewController:vc02];
    
    DCParticularsShowViewController *vc03 = [DCParticularsShowViewController new];
    vc03.title = @"包装清单";
    vc03.particularUrl = CDDJianShu03;
    [self addChildViewController:vc03];
    
    DCParticularsShowViewController *vc04 = [DCParticularsShowViewController new];
    vc04.title = @"售后服务";
    vc04.particularUrl = CDDJianShu04;
    [self addChildViewController:vc04];
}


@end
