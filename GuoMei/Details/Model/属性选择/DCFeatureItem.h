//
//  DCFeatureItem.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DCFeatureTitleItem,DCFeatureList;

@interface DCFeatureItem : NSObject

@property (nonatomic, strong) DCFeatureTitleItem *attr;

@property (nonatomic, strong) NSArray<DCFeatureList *> *list;

@end
