//
//  DCColonInsView.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCColonInsView : UIView
- (void)setUpUI;

@property (nonatomic, copy) dispatch_block_t collectionBlock;

@property (nonatomic, copy) dispatch_block_t addShopCarBlock;

@property (nonatomic, copy) dispatch_block_t sameBrandBlock;

@property (nonatomic, copy) dispatch_block_t samePriceBlock;
@end
