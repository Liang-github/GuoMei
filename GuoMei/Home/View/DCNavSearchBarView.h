//
//  DCNavSearchBarView.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCNavSearchBarView : UIView

@property (nonatomic, strong) UIButton *voiceImageBtn;

@property (nonatomic, strong) UILabel *placeholdLabel;

@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;

@property (nonatomic, copy) dispatch_block_t searchViewBlock;

@property (nonatomic, assign) CGSize intrinsicContentSize;

@end
