//
//  DCFiltrateViewController.h
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCFiltrateViewController : UIViewController

@property (nonatomic, copy) void(^sureClickBlock)(NSArray *selectArray);

@end
