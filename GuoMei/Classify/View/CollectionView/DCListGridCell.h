//
//  DCListGridCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCRecommendItem;
@interface DCListGridCell : UICollectionViewCell

@property (nonatomic, strong) DCRecommendItem *youSelectItem;

@property (nonatomic, copy) dispatch_block_t colonClickBlock;

@end
