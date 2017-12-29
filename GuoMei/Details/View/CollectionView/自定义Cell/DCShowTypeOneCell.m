//
//  DCShowTypeOneCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCShowTypeOneCell.h"

@implementation DCShowTypeOneCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpData];
    }
    return self;
}
- (void)setUpData {
    self.hintLabel.text = @"可选增值服务";
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.hintLabel.font = PFR12Font;
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.leftTitleLabel.mas_right)setOffset:DCMargin];
        make.width.mas_equalTo(self).multipliedBy(0.78);
        make.centerY.mas_equalTo(self.leftTitleLabel);
    }];
    
    [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentLabel);
        [make.top.mas_equalTo(self.contentLabel.mas_bottom)setOffset:8];
    }];
}
@end
