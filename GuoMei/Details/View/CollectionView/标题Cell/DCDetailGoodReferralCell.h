//
//  DCDetailGoodReferralCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCDetailGoodReferralCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *goodTitleLabel;

@property (nonatomic, strong) UILabel *goodPriceLabel;

@property (nonatomic, strong) UILabel *goodSubtitleLabel;

@property (nonatomic, strong) UIButton *perferentialButton;

@property (nonatomic, copy) dispatch_block_t shareButtonClickBlock;

@end
