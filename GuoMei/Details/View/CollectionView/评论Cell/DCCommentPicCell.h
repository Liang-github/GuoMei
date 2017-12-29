//
//  DCCommentPicCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DCCommentPicItem;

@interface DCCommentPicCell : UICollectionViewCell

@property (nonatomic, strong) DCCommentPicItem *picItem;

@property (nonatomic, strong) UIImageView *picImageView;

@end
