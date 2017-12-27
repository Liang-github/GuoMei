//
//  DCClassMianItem.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DCClassSubItem;
@interface DCClassMianItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSArray<DCClassSubItem *> *goods;

@end
