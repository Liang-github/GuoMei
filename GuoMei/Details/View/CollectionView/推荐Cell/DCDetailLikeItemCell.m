//
//  DCDetailLikeItemCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailLikeItemCell.h"
#import "DCRecommendItem.h"
#import <UIImageView+WebCache.h>

@interface DCDetailLikeItemCell ()

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UILabel *goodsLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@end
@implementation DCDetailLikeItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodsImageView];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor = [UIColor blackColor];
    _priceLabel.font = PFR14Font;
    [self addSubview:_priceLabel];
    
    _goodsLabel = [[UILabel alloc] init];
    _goodsLabel.font = PFR11Font;
    _goodsLabel.numberOfLines = 2;
    _goodsLabel.textColor = [UIColor darkGrayColor];
    _goodsLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_goodsLabel];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:5];
        make.width.mas_equalTo(self.dc_width).multipliedBy(0.75);
        make.height.mas_equalTo(self.dc_width).multipliedBy(0.75);
        make.centerX.mas_equalTo(self);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:DCMargin];
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:2];
    }];
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(self)setOffset:DCMargin];
        [make.right.mas_equalTo(self)setOffset:-DCMargin];
        [make.top.mas_equalTo(_priceLabel.mas_bottom)setOffset:2];
    }];
}
- (void)setYouLikeItem:(DCRecommendItem *)youLikeItem {
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:youLikeItem.image_url]];
     _priceLabel.text = [NSString stringWithFormat:@"￥ %.2f",[youLikeItem.price floatValue]];
    _goodsLabel.text = youLikeItem.main_title;
}
@end
