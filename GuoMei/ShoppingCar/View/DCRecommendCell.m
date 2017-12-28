//
//  DCRecommendCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCRecommendCell.h"

#import "DCRecommendItem.h"

#import <UIImageView+WebCache.h>

@interface DCRecommendCell ()

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UILabel *goodsLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@end
@implementation DCRecommendCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodsImageView];
    
    _goodsLabel = [[UILabel alloc] init];
    _goodsLabel.font = PFR12Font;
    _goodsLabel.numberOfLines = 0;
    _goodsLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_goodsLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = PFR12Font;
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_priceLabel];
}
#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:DCMargin];
        make.size.mas_equalTo(CGSizeMake(self.dc_width * 0.7, self.dc_width * 0.7));
        
    }];
    
    [_goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.height.mas_equalTo(35);
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:DCMargin];
        
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.mas_equalTo(self).multipliedBy(0.8);
        make.top.mas_equalTo(_goodsLabel.mas_bottom);
        
    }];
}

#pragma mark - Setter Getter Methods
- (void)setRecommendItem:(DCRecommendItem *)recommendItem
{
    _recommendItem = recommendItem;
    
    [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:recommendItem.image_url]];
    _goodsLabel.text = recommendItem.main_title;
    
    _priceLabel.text = ([recommendItem.price integerValue] >= 10000) ? [NSString stringWithFormat:@"¥ %.2f万",[recommendItem.price floatValue] / 10000.0] : [NSString stringWithFormat:@"¥ %.2f",[recommendItem.price floatValue]];
}
@end
