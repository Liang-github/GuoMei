//
//  DCCenterTopToolView.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/22.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCCenterTopToolView : UIView

// 左边Item点击
@property (nonatomic, copy) dispatch_block_t leftItemClickBlock;
// 右边item点击
@property (nonatomic, copy) dispatch_block_t rightItemClickBlock;

@end
