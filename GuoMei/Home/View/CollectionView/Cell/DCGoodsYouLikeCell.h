//
//  DCGoodsYouLikeCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCRecommendItem;
@interface DCGoodsYouLikeCell : UICollectionViewCell

@property (nonatomic, strong) DCRecommendItem *youLikeItem;

@property (nonatomic, strong) UIButton *sameButton;

@property (nonatomic, copy) dispatch_block_t lookSameBlock;

@end
