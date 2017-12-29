//
//  DCShowTypeFourCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCShowTypeFourCell.h"

@implementation DCShowTypeFourCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpData];
    }
    return self;
}
- (void)setUpData {
    self.leftTitleLabel.text = @"领券";
    [self addSubview:self.iconImageView];
    self.iconImageView.image = [UIImage imageNamed:@"biaoqian"];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //重写leftTitleLableFrame
    [self.leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:DCMargin];
        make.centerY.mas_equalTo(self);
    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self.leftTitleLabel.mas_right)setOffset:DCMargin];
        make.centerY.mas_equalTo(self.leftTitleLabel);
    }];
}
@end
