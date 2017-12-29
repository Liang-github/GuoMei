//
//  DCDetailServicetCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailServicetCell.h"

@implementation DCDetailServicetCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    _serviceButton = [[DCLIRLButton alloc] init];
    [_serviceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _serviceButton.titleLabel.font = PFR13Font;
    [self addSubview:_serviceButton];
    
    _serviceLabel = [[UILabel alloc] init];
    _serviceLabel.textColor = [UIColor lightGrayColor];
    _serviceLabel.font = PFR12Font;
    _serviceLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_serviceLabel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.bottom.mas_equalTo(self.mas_centerY)setOffset:3];
        make.centerX.mas_equalTo(self);
    }];
    
    [_serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_serviceButton.mas_bottom)setOffset:5];
        make.centerX.mas_equalTo(self);
    }];
    
}
@end
