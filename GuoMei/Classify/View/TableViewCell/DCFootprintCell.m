//
//  DCFootprintCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//
#define FootprintScreenW ScreenW*0.4
#import "DCFootprintCell.h"
#import "DCRecommendItem.h"
#import <UIImageView+WebCache.h>

@interface DCFootprintCell ()

@property (nonatomic, strong) UIImageView *goodImageView;

@property (nonatomic, strong) UILabel *goodName;

@property (nonatomic, strong) UILabel *priceLabel;

@end
@implementation DCFootprintCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}
#pragma mark - UI
- (void)setUpUI
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _goodImageView = [[UIImageView alloc] init];
    _goodImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_goodImageView];
    
    _goodName = [[UILabel alloc] init];
    _goodName.font = PFR12Font;
    [self addSubview:_goodName];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = PFR13Font;
    _priceLabel.textColor = [UIColor redColor];
    [self addSubview:_priceLabel];
    
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_goodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(FootprintScreenW * 0.9, FootprintScreenW * 0.9));
    }];
    
    [_goodName mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_goodImageView.mas_bottom)setOffset:5];
        make.left.mas_equalTo(_goodImageView);
        make.right.mas_equalTo(_goodImageView);
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_goodName.mas_bottom)setOffset:5];
        make.left.mas_equalTo(_goodImageView);
        make.right.mas_equalTo(_goodImageView);
    }];
    
}

#pragma mark - Setter Getter Methods
- (void)setFootprintItem:(DCRecommendItem *)footprintItem
{
    _footprintItem = footprintItem;
    [_goodImageView sd_setImageWithURL:[NSURL URLWithString:footprintItem.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[footprintItem.price floatValue]];
    _goodName.text = footprintItem.main_title;
}

@end
