//
//  DCBeautyTopToolView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCBeautyTopToolView.h"

@interface DCBeautyTopToolView ()

@property (nonatomic, strong) UIButton *leftItemButton;

@property (nonatomic, strong) UIButton *rightItemButton;

@property (nonatomic, weak) id dcObserve;

@end

@implementation DCBeautyTopToolView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
        [self acceptanceNote];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor clearColor];
    
    _leftItemButton = ({
        UIButton *button = [UIButton new];
        [button setImage:[UIImage imageNamed:@"mshop_openmeidian_white_icon"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(leftButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    _rightItemButton = ({
        UIButton *button = [UIButton new];
        [button setImage:[UIImage imageNamed:@"mshop_message_white_icon"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(rightButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    
    [self addSubview:_rightItemButton];
    [self addSubview:_leftItemButton];
    
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = self.bounds;
    layer.colors = @[(id)[UIColor colorWithWhite:0 alpha:0.2].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.15].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.1].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.05].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.03].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.01].CGColor,(id)[UIColor colorWithWhite:0 alpha:0.0].CGColor];
    [self.layer addSublayer:layer];
}

- (void)acceptanceNote {
    WEAKSELF
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:SHOWTOPTOOLVIEW object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor whiteColor];
        [weakSelf.leftItemButton setImage:[UIImage imageNamed:@"mshop_openmeidian_gray_icon"] forState:0];
        [weakSelf.rightItemButton setImage:[UIImage imageNamed:@"mshop_message_gray_icon"] forState:0];
    }];
    
    _dcObserve = [[NSNotificationCenter defaultCenter]addObserverForName:HIDETOPTOOLVIEW object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.backgroundColor = [UIColor clearColor];
        [weakSelf.leftItemButton setImage:[UIImage imageNamed:@"mshop_openmeidian_white_icon"] forState:0];
        [weakSelf.rightItemButton setImage:[UIImage imageNamed:@"mshop_message_white_icon"] forState:0];
    }];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_leftItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20);
        make.left.equalTo(self.mas_left).offset(0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    [_rightItemButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_leftItemButton.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-0);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
}

#pragma mark - 消失
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:_dcObserve];
}
#pragma 自定义右边导航Item点击
- (void)rightButtonItemClick {
    !_rightItemClickBlock ? : _rightItemClickBlock();
}

#pragma 自定义左边导航Item点击
- (void)leftButtonItemClick {
    
    !_leftItemClickBlock ? : _leftItemClickBlock();
}

@end
