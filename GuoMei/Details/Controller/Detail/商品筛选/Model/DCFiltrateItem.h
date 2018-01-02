//
//  DCFiltrateItem.h
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCContentItem;
@interface DCFiltrateItem : NSObject

@property (nonatomic, assign) BOOL isOpen;

@property (nonatomic, copy) NSString *headTitle;

@property (nonatomic, strong) NSArray<DCContentItem *> *content;

@end
