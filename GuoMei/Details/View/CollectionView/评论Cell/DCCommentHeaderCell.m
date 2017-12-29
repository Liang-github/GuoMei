//
//  DCCommentHeaderCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCCommentHeaderCell.h"

@interface DCCommentHeaderCell ()

@property (nonatomic, strong) UIButton *indicateButton;

@property (nonatomic, strong) UILabel *commentNumLabel;

@property (nonatomic, strong) UILabel *goodCommentPLabel;

@end
@implementation DCCommentHeaderCell
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
    
    _commentNumLabel = [[UILabel alloc] init];
    _commentNumLabel.font = PFR13Font;
    [self addSubview:_commentNumLabel];
    
    _indicateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_indicateButton setImage:[UIImage imageNamed:@"icon_charge_jiantou"] forState:UIControlStateNormal];
    [self addSubview:_indicateButton];
    
    _goodCommentPLabel = [[UILabel alloc] init];
    _goodCommentPLabel.font = PFR12Font;
    [self addSubview:_goodCommentPLabel];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:DCMargin];
        make.centerY.mas_equalTo(self);
    }];
    
    [_indicateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-DCMargin];
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.mas_equalTo(self);
    }];
    
    [_goodCommentPLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(_indicateButton.mas_left)setOffset:-2];
        make.centerY.mas_equalTo(self);
    }];
    
}

#pragma mark - Setter Getter Methods
- (void)setComNum:(NSString *)comNum
{
    _comNum = comNum;
    _commentNumLabel.text = [NSString stringWithFormat:@"评论(%@)",comNum];
}


- (void)setWellPer:(NSString *)wellPer
{
    _wellPer = wellPer;
    _goodCommentPLabel.text = [NSString stringWithFormat:@"好评度：%@",wellPer];
    [DCSpeedy dc_setSomeOneChangeColor:_goodCommentPLabel SetSelectArray:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"%"] SetChangeColor:[UIColor redColor]];
}
@end
