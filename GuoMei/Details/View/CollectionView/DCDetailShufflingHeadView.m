//
//  DCDetailShufflingHeadView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailShufflingHeadView.h"
#import <SDCycleScrollView.h>

@interface DCDetailShufflingHeadView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end
@implementation DCDetailShufflingHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenW, self.dc_height) delegate:self placeholderImage:nil];
    _cycleScrollView.autoScroll = NO;
    [self addSubview:_cycleScrollView];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    NSLog(@"点击了%zd轮播图",index);
}
- (void)setShufflingArray:(NSArray *)shufflingArray {
    _shufflingArray = shufflingArray;
    _cycleScrollView.imageURLStringsGroup = shufflingArray;
}
@end
