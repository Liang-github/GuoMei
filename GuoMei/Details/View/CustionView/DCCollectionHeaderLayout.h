//
//  DCCollectionHeaderLayout.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HorizontalCollectionLayoutDelegate<NSObject>

@optional

- (NSString *)collectionViewItemSizeWithIndexPath:(NSIndexPath *)indexPath;

- (CGSize)collectionViewDynamicHeaderSizeWithIndexPath:(NSIndexPath *)indexPath;

- (CGSize)collectionViewDynamicFooterSizeWithIndexPath:(NSIndexPath *)indexPath;

@end
@interface DCCollectionHeaderLayout : UICollectionViewFlowLayout
// item 的行距（默认4.0）
@property (nonatomic, assign) CGFloat lineSpacing;
// item 的间距 （默认4.0）
@property (nonatomic, assign) CGFloat interitemSpacing;
// header 高度（默认0.0）
@property (nonatomic, assign) CGFloat headerViewHeight;
// footer 高度（默认0.0）
@property (nonatomic, assign) CGFloat footerViewHeight;
// item 高度 (默认30)
@property (nonatomic, assign) CGFloat itemHeight;
// footer 边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets footerInset;
// header 边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets headerInset;
// item 边距缩进（默认UIEdgeInsetsZero）
@property (nonatomic, assign) UIEdgeInsets itemInset;
// item Label Font（默认系统字体15）
@property (nonatomic, copy) UIFont *labelFont;

@property (nonatomic, weak) id<HorizontalCollectionLayoutDelegate> delegate;
@end
