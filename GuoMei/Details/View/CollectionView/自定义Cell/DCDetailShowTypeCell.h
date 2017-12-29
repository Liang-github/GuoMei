//
//  DCDetailShowTypeCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCDetailShowTypeCell : UICollectionViewCell

@property (nonatomic, assign) BOOL isHasindicateButton;

@property (nonatomic, strong) UIButton *indicateButton;

@property (nonatomic, strong) UILabel *leftTitleLabel;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *hintLabel;

@end
