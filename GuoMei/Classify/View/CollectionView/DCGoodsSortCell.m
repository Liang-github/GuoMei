//
//  DCGoodsSortCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCGoodsSortCell.h"
#import "DCClassMianItem.h"
#import "DCClassSubItem.h"
#import <UIImageView+WebCache.h>

@interface DCGoodsSortCell ()

@property (nonatomic, strong) UIImageView *goodsImageView;

@property (nonatomic, strong) UILabel *goodsTitleLabel;

@end
@implementation DCGoodsSortCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = DCBGColor;
    _goodsImageView = [[UIImageView alloc] init];
    _goodsImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_goodsImageView];
    
    _goodsTitleLabel = [[UILabel alloc] init];
    _goodsTitleLabel.font = PFR13Font;
    _goodsTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_goodsTitleLabel];
}
- (void)layoutSubviews
{
    [_goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:5];
        make.size.mas_equalTo(CGSizeMake(self.dc_width * 0.85, self.dc_width * 0.85));
    }];
    
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_goodsImageView.mas_bottom)setOffset:5];
        make.width.mas_equalTo(_goodsImageView);
        make.centerX.mas_equalTo(self);
    }];
}


#pragma mark - Setter Getter Methods
- (void)setSubItem:(DCClassSubItem *)subItem
{
    _subItem = subItem;
    if ([subItem.image_url containsString:@"http"]) {
        [_goodsImageView sd_setImageWithURL:[NSURL URLWithString:subItem.image_url]];
    }else{
        _goodsImageView.image = [UIImage imageNamed:subItem.image_url];
    }
    _goodsTitleLabel.text = subItem.goods_title;
}
@end
