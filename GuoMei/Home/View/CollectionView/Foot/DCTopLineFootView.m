//
//  DCTopLineFootView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCTopLineFootView.h"
#import "DCTitleRolling.h"
#import <UIImageView+WebCache.h>

@interface DCTopLineFootView ()<UIScrollViewDelegate, CDDRollingDelegate>

@property (nonatomic, strong) DCTitleRolling *numericalScrollView;

@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, strong) UIImageView *topAdImageView;

@end
@implementation DCTopLineFootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
        [self setUpBase];
    }
    return self;
}
- (void)setUpUI
{
    
    _topAdImageView = [[UIImageView alloc] init];
    [_topAdImageView sd_setImageWithURL:[NSURL URLWithString:HomeBottomViewGIFImage]];
    _topAdImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_topAdImageView];
    
    //初始化
    _numericalScrollView = [[DCTitleRolling alloc] initWithFrame:CGRectMake(0, self.dc_height - 50, self.dc_width, 50) WithTitleData:^(CDDRollingGroupStyle *rollingGroupStyle, NSString *__autoreleasing *leftImage, NSArray *__autoreleasing *rolTitles, NSArray *__autoreleasing *rolTags, NSArray *__autoreleasing *rightImages, NSString *__autoreleasing *rightbuttonTitle, NSInteger *interval, float *rollingTime, NSInteger *titleFont, UIColor *__autoreleasing *titleColor, BOOL *isShowTagBorder) {
        
        *rollingTime = 0.25;
        *rolTags = @[@"冬季健康日",@"新手上路",@"年终内购会",@"GitHub星星走一波"];
        *rolTitles = @[@"先领券在购物，一元抢？",@"2000元热门手机推荐",@"好奇么？点进去哈",@"这套家具比房子还贵"];
        *leftImage = @"shouye_img_toutiao";
        *interval = 6.0;
        *titleFont = 14;
        *isShowTagBorder = YES;
        *titleColor = [UIColor darkGrayColor];
    }];
    
    _numericalScrollView.moreClickBlock = ^{
        NSLog(@"mall----more");
    };
    
    [_numericalScrollView dc_beginRolling];
    _numericalScrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_numericalScrollView];
    
    _bottomLineView = [[UIView alloc] init];
    _bottomLineView.backgroundColor = DCBGColor;
    [self addSubview:_bottomLineView];
    _bottomLineView.frame = CGRectMake(0, self.dc_height - 8, ScreenW, 8);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_topAdImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.width.mas_equalTo(self);
        [make.bottom.mas_equalTo(self)setOffset:-50];
    }];
}

- (void)setUpBase
{
    self.backgroundColor = [UIColor whiteColor];
    
}


- (void)dc_RollingViewSelectWithActionAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%zd头条滚动条",index);
}
@end
