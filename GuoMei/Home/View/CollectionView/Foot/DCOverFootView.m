//
//  DCOverFootView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCOverFootView.h"

@interface DCOverFootView ()
@property (nonatomic, strong) UILabel *overLabel;

@end
@implementation DCOverFootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI
{
    _overLabel = [[UILabel alloc] init];
    _overLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_overLabel];
    _overLabel.font = PFR16Font;
    _overLabel.textColor = [UIColor darkGrayColor];
    _overLabel.text = @"看完喽，下次在逛吧";
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_overLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}
@end
