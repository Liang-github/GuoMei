//
//  DCBrandSortCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCBrandSortCell.h"

#import "DCClassMianItem.h"
#import "DCClassSubItem.h"

#import <UIImageView+WebCache.h>

@interface DCBrandSortCell ()

@property (nonatomic, strong) UIImageView *brandImageView;

@end
@implementation DCBrandSortCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = DCBGColor;
    _brandImageView = [[UIImageView alloc] init];
    _brandImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_brandImageView];
}
- (void)layoutSubviews {
    [_brandImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.size.mas_equalTo(CGSizeMake(self.dc_width - 20, self.dc_height - 25));
    }];
}
- (void)setSubItem:(DCClassSubItem *)subItem {
    _subItem = subItem;
    [_brandImageView sd_setImageWithURL:[NSURL URLWithString:subItem.image_url]];
}
@end
