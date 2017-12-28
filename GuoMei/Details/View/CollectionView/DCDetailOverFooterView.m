//
//  DCDetailOverFooterView.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailOverFooterView.h"
#import "DCLIRLButton.h"

@interface DCDetailOverFooterView ()

@property (nonatomic, strong) DCLIRLButton *overMarkButton;

@end
@implementation DCDetailOverFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = DCBGColor;
    _overMarkButton = [DCLIRLButton buttonWithType:UIButtonTypeCustom];
    [_overMarkButton setImage:[UIImage imageNamed:@"Details_Btn_Up"] forState:UIControlStateNormal];
    [_overMarkButton setTitle:@"上拉查看图文详情" forState:0];
    _overMarkButton.titleLabel.font = PFR12Font;
    [_overMarkButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self addSubview:_overMarkButton];
    
    _overMarkButton.frame = CGRectMake(0, 0, self.dc_width, self.dc_height);
}
@end
