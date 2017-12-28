//
//  DCRecommendReusableView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCRecommendReusableView.h"

@interface DCRecommendReusableView ()

@property (nonatomic, strong) UILabel *recommendLabel;

@end
@implementation DCRecommendReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    _recommendLabel = [[UILabel alloc] init];
    _recommendLabel.text = @"大家都在买";
    _recommendLabel.textColor = [UIColor darkGrayColor];
    _recommendLabel.font = PFR14Font;
    [self addSubview:_recommendLabel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_recommendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.left.mas_equalTo(self)setOffset:DCMargin];
    }];
    
}
@end
