//
//  DCBrandsSortHeadView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCBrandsSortHeadView.h"
#import "DCClassMianItem.h"

@interface DCBrandsSortHeadView ()

@property (nonatomic, strong) UILabel *headLabel;

@end
@implementation DCBrandsSortHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    _headLabel = [[UILabel alloc] init];
    _headLabel.font = PFR13Font;
    _headLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:_headLabel];
    
    _headLabel.frame = CGRectMake(DCMargin, 0, self.dc_width, self.dc_height);
}
- (void)setHeadTitle:(DCClassMianItem *)headTitle {
    _headTitle = headTitle;
    _headLabel.text = headTitle.title;
}
@end
