//
//  DCRecommendItem.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCRecommendItem : NSObject

@property (nonatomic, copy) NSString *image_url;

@property (nonatomic, copy) NSString *main_title;

@property (nonatomic, copy) NSString *goods_title;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *stock;

@property (nonatomic, copy) NSString *nature;

@property (nonatomic, copy) NSArray *images;

@end
