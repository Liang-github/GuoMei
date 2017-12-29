//
//  DCGoodsYouLikeCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//
#define cellWH ScreenW*0.5 - 50


#import "DCGoodsYouLikeCell.h"

#import "DCRecommendItem.h"

#import <UIImageView+WebCache.h>

@interface DCGoodsYouLikeCell ()

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UILabel *goodsLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation DCGoodsYouLikeCell
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
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodsImageView];
    
    _goodsLabel = [[UILabel alloc] init];
    _goodsLabel.font = PFR12Font;
    _goodsLabel.numberOfLines = 2;
    _goodsLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_goodsLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = PFR15Font;
    [self addSubview:_priceLabel];
    
    _sameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _sameButton.titleLabel.font = PFR10Font;
    [_sameButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_sameButton setTitle:@"看相似" forState:UIControlStateNormal];
    [_sameButton addTarget:self action:@selector(lookSameGoods) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_sameButton];
    [DCSpeedy dc_chageControlCircularWith:_sameButton AndSetCornerRadius:0 SetBorderWidth:1.0 SetBorderColor:[UIColor darkGrayColor] canMasksToBounds:YES];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:DCMargin];
        make.size.mas_equalTo(CGSizeMake(cellWH , cellWH));
        
    }];
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(40);
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:DCMargin];
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_goodsImageView);
        make.width.mas_equalTo(self).multipliedBy(0.5);
        make.top.mas_equalTo(_goodsLabel.mas_bottom);
        
    }];
    
    [_sameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-DCMargin];
        make.centerY.mas_equalTo(_priceLabel);
        make.size.mas_equalTo(CGSizeMake(35, 18));
    }];
}


#pragma mark - Setter Getter Methods
- (void)setYouLikeItem:(DCRecommendItem *)youLikeItem
{
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:youLikeItem.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[youLikeItem.price floatValue]];
    _goodsLabel.text = youLikeItem.main_title;
}

#pragma mark - 点击事件
- (void)lookSameGoods
{
    !_lookSameBlock ? : _lookSameBlock();
}
@end
