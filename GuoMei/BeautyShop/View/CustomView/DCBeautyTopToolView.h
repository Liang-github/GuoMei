//
//  DCBeautyTopToolView.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCBeautyTopToolView : UIView

@property (nonatomic, copy) dispatch_block_t leftItemClickBlock;

@property (nonatomic, copy) dispatch_block_t rightItemClickBlock;

@end
