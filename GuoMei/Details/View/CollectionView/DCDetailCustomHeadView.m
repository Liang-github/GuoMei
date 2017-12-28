//
//  DCDetailCustomHeadView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailCustomHeadView.h"

@interface DCDetailCustomHeadView ()

@property (nonatomic, strong) UILabel *guessMarkLabel;

@end
@implementation DCDetailCustomHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    
    _guessMarkLabel = [[UILabel alloc] init];
    _guessMarkLabel.text = @"猜你喜欢";
    _guessMarkLabel.font = PFR15Font;
    [self addSubview:_guessMarkLabel];
    
    _guessMarkLabel.frame = CGRectMake(DCMargin, 0, 200, self.dc_height);
}
@end
