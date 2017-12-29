//
//  DCCommentFooterCell.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCLIRLButton.h"

@interface DCCommentFooterCell : UICollectionViewCell

@property (nonatomic, strong) DCLIRLButton *commentFootButton;

@property (nonatomic, assign) BOOL isShowLine;

@end
