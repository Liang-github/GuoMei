//
//  DCUserInfo.h
//  GuoMei
//
//  Created by PengLiang on 2017/12/26.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "JKDBModel.h"

@interface DCUserInfo : JKDBModel

@property (nonatomic, copy) NSString *sex;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *userimage;

@property (nonatomic, copy) NSString *birthDay;

@property (nonatomic, copy) NSString *defaultAddress;

@end
