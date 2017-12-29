//
//  DCGoodsHandheldCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCGoodsHandheldCell.h"
#import <UIImageView+WebCache.h>

@interface DCGoodsHandheldCell ()

@property (nonatomic, strong) UIImageView *handheldImageView;

@end
@implementation DCGoodsHandheldCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI
- (void)setUpUI
{
    _handheldImageView = [[UIImageView alloc] init];
    _handheldImageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:_handheldImageView];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_handheldImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - Setter Getter Methods
- (void)setHandheldImage:(NSString *)handheldImage
{
    _handheldImage = handheldImage;
    
    [_handheldImageView sd_setImageWithURL:[NSURL URLWithString:handheldImage]];
}
@end
