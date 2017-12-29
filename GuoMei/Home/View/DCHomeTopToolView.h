//
//  DCHomeTopToolView.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCHomeTopToolView : UIView

@property (nonatomic, copy) dispatch_block_t leftItemClickBlock;

@property (nonatomic, copy) dispatch_block_t rightItemClickBlock;

@property (nonatomic, copy) dispatch_block_t rightRItemClickBlock;

@property (nonatomic, copy) dispatch_block_t searchButtonClickBlock;

@property (nonatomic, copy) dispatch_block_t voiceButtonClickBlock;

@end
