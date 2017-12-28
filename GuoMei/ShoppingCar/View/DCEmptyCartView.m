//
//  DCEmptyCartView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCEmptyCartView.h"

@interface DCEmptyCartView ()

@property (nonatomic, strong) UIImageView *emptyImageView;

@property (nonatomic, strong) UILabel *sloganLabel;

@property (nonatomic, strong) UILabel *adLabel;

@property (nonatomic, strong) UIButton *buyingButton;

@end
@implementation DCEmptyCartView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI {
    _emptyImageView = [[UIImageView alloc] init];
    _emptyImageView.image = [UIImage imageNamed:@"bj_baobei"];
    [self addSubview:_emptyImageView];
    
    _sloganLabel = [[UILabel alloc] init];
    _sloganLabel.textColor = [UIColor darkGrayColor];
    _sloganLabel.text = @"此处非常冷清。。。。";
    _sloganLabel.font = PFR12Font;
    _sloganLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_sloganLabel];
    
    _adLabel = [[UILabel alloc] init];
    _adLabel.textColor = [UIColor orangeColor];
    _adLabel.font = PFR14Font;
    _adLabel.text = @"DC超市 酒水茗茶，全城畅想 →";
    _adLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_adLabel];
    
    _buyingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _buyingButton.titleLabel.font = PFR14Font;
    [_buyingButton setTitle:@"立即抢购" forState:UIControlStateNormal];
    [_buyingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _buyingButton.backgroundColor = [UIColor whiteColor];
    [_buyingButton addTarget:self action:@selector(buyingButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_buyingButton];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self);
        if (iphone5) {
            make.size.mas_equalTo(CGSizeMake(150, 150));
        }else{
            make.size.mas_equalTo(CGSizeMake(170, 170));
        }
    }];
    
    [_sloganLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(_emptyImageView.mas_bottom)setOffset:DCMargin];
    }];
    [_adLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(_sloganLabel.mas_bottom)setOffset:DCMargin];
    }];
    
    [_buyingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(_adLabel.mas_bottom)setOffset:DCMargin * 2];
        make.size.mas_equalTo(CGSizeMake(120, 35));
    }];
}
- (void)buyingButtonClick {
    !_buyingClickBlock ? : _buyingClickBlock();
}

@end
