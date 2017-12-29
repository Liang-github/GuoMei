//
//  DCFeatureChoseTopCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCFeatureChoseTopCell : UITableViewCell

@property (nonatomic, copy) dispatch_block_t crossButtonClickBlock;

@property (nonatomic, strong) UILabel *goodPriceLabel;

@property (nonatomic, strong) UIImageView *goodImageView;

@property (nonatomic, strong) UILabel *chooseAttLabel;



@end
