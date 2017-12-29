//
//  DCCommentFooterCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCCommentFooterCell.h"


@interface DCCommentFooterCell ()

@property (nonatomic, strong) UIView *vLine;

@end
@implementation DCCommentFooterCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    _commentFootButton = [DCLIRLButton buttonWithType:UIButtonTypeCustom];
    [_commentFootButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _commentFootButton.titleLabel.font = PFR12Font;
    _commentFootButton.userInteractionEnabled = NO;
    [self addSubview:_commentFootButton];
    
    _vLine = [[UIView alloc] init];
    _vLine.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.15];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_commentFootButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    if (_isShowLine) {
        [self addSubview:_vLine];
        [_vLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
            make.width.mas_equalTo(1);
            make.height.mas_equalTo(self).multipliedBy(0.6);
        }];
    }
}
@end
