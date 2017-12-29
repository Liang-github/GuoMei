//
//  DCHomeRefreshGifHeader.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCHomeRefreshGifHeader.h"

@interface DCHomeRefreshGifHeader ()

@property (nonatomic, strong) UIImageView *refreshImage;
@end
@implementation DCHomeRefreshGifHeader

- (void)prepare {
    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i <= 60; i ++) {
        UIImage *image = [UIImage imageNamed:@"icon_refresh_1"];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i < 3; i ++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_refresh_%zd",i]];
        [refreshingImages addObject:image];
    }
    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
    
    self.stateLabel.textColor = [UIColor lightGrayColor];
    self.lastUpdatedTimeLabel.hidden = YES;
    [self setTitle:@"上拉加载数据" forState:MJRefreshStateIdle];
    [self setTitle:@"帮您加载数据" forState:MJRefreshStatePulling];
    [self setTitle:@"数据加载中" forState:MJRefreshStateRefreshing];
    self.refreshImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh"]];
    [self addSubview:self.refreshImage];
}

@end
