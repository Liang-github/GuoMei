//
//  DCShowTypeTwoCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCShowTypeTwoCell.h"
@interface DCShowTypeTwoCell ()
@end
@implementation DCShowTypeTwoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpData];
    }
    return self;
}
- (void)setUpData {
    self.leftTitleLabel.text = @"送至";
    self.hintLabel.text = @"由DC商贸配送监管";
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.hintLabel.font = PFR12Font;
    [self addSubview:self.iconImageView];
    self.iconImageView.image = [UIImage imageNamed:@"ptgd_icon_dizhi"];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.leftTitleLabel.mas_right)setOffset:DCMargin];
        make.centerY.mas_equalTo(self.leftTitleLabel);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.iconImageView.mas_right)setOffset:DCMargin];
        make.centerY.mas_equalTo(self.leftTitleLabel);
    }];
    
    [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView);
        [make.top.mas_equalTo(self.contentLabel.mas_bottom)setOffset:8];
    }];
    
}
@end
