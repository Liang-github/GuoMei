//
//  DCAttributeItemCell.m
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "DCAttributeItemCell.h"
#import "DCFeatureItem.h"
#import "DCContentItem.h"
#import <Masonry.h>
#import "DCSpeedy.h"

@interface DCAttributeItemCell ()

@property (nonatomic, strong) UIButton *contentButton;

@end
@implementation DCAttributeItemCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    _contentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _contentButton.enabled = NO;
    [self addSubview:_contentButton];
    
    _contentButton.titleLabel.font = PFR12Font;
    [_contentButton setTitleColor:[UIColor blackColor] forState:0];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_contentButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}
- (void)setContentItem:(DCContentItem *)contentItem
{
    _contentItem = contentItem;
    [_contentButton setTitle:contentItem.content forState:0];
    
    if (contentItem.isSelect) {
        [_contentButton setImage:[UIImage imageNamed:@"isSelectYes"] forState:0];
        [_contentButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _contentButton.backgroundColor = [UIColor whiteColor];
        
        [DCSpeedy dc_chageControlCircularWith:self AndSetCornerRadius:3 SetBorderWidth:1 SetBorderColor:[UIColor redColor] canMasksToBounds:YES];
    }else{
        
        [_contentButton setImage:nil forState:0];
        [_contentButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _contentButton.backgroundColor = RGB(230, 230, 230);
        
        [DCSpeedy dc_chageControlCircularWith:self AndSetCornerRadius:3 SetBorderWidth:1 SetBorderColor:RGB(230, 230, 230) canMasksToBounds:YES];
    }
}
@end
