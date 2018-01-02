//
//  DCGoodBaseViewController.h
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCGoodBaseViewController : UIViewController

@property (nonatomic, copy) void(^changeTitleBlock)(BOOL isChange);
@property (nonatomic, strong) NSString *goodTitle;

@property (nonatomic, strong) NSString *goodPrice;

@property (nonatomic, strong) NSString *goodSubtitle;

@property (nonatomic, strong) NSString *goodImageView;

@property (nonatomic, strong) NSArray *shufflingArray;

@end
