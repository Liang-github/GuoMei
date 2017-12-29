//
//  DCNewWelfareLayout.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DCNewWelfareLayoutDelegate<NSObject>

@optional;
- (CGFloat)dc_HeightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)dc_HeightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath;

@end
@interface DCNewWelfareLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) id<DCNewWelfareLayoutDelegate>delegate;

@end
