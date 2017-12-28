//
//  DCFeatureItemCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCFeatureItemCell.h"
#import "DCFeatureItem.h"
#import "DCFeatureList.h"

@interface DCFeatureItemCell ()

@property (nonatomic, strong) UILabel *attLabel;

@end
@implementation DCFeatureItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI
{
    _attLabel = [[UILabel alloc] init];
    _attLabel.textAlignment = NSTextAlignmentCenter;
    _attLabel.font = PFR13Font;
    [self addSubview:_attLabel];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_attLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
- (void)setContent:(DCFeatureList *)content
{
    _content = content;
    _attLabel.text = content.infoname;
    
    if (content.isSelect) {
        _attLabel.textColor = [UIColor redColor];
        [DCSpeedy dc_chageControlCircularWith:_attLabel AndSetCornerRadius:5 SetBorderWidth:1 SetBorderColor:[UIColor redColor] canMasksToBounds:YES];
    }else{
        _attLabel.textColor = [UIColor blackColor];
        [DCSpeedy dc_chageControlCircularWith:_attLabel AndSetCornerRadius:5 SetBorderWidth:1 SetBorderColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.4] canMasksToBounds:YES];
    }
}
@end
