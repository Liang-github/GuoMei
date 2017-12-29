//
//  DCCommentPicCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCCommentPicCell.h"
#import "DCCommentPicItem.h"
#import "SDPhotoBrowser.h"
#import <UIImageView+WebCache.h>


@interface DCCommentPicCell ()<SDPhotoBrowserDelegate>

@property (nonatomic, strong) UILabel *nickName;

@property (nonatomic, strong) UILabel *picNum;

@property (nonatomic, strong) NSArray *imagesArray;

@end
@implementation DCCommentPicCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    _picImageView = [[UIImageView alloc] init];
    _picImageView.contentMode = UIViewContentModeScaleAspectFit;
    _picImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)];
    [_picImageView addGestureRecognizer:tap];
    [self addSubview:_picImageView];
    
    _nickName = [[UILabel alloc] init];
    _nickName.font = PFR11Font;
    [self addSubview:_nickName];
    
    _picNum = [[UILabel alloc] init];
    _picNum.textColor = [UIColor whiteColor];
    _picNum.backgroundColor = RGB(60, 53, 44);
    _picNum.textAlignment = NSTextAlignmentCenter;
    _picNum.font = PFR10Font;
    [self addSubview:_picNum];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        [make.top.mas_equalTo(self)setOffset:2];
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    [_picNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_picImageView);
        make.bottom.mas_equalTo(_picImageView);
        make.size.mas_equalTo(CGSizeMake(30, 18));
    }];
    
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(_picImageView.mas_bottom)setOffset:2];
        make.left.mas_equalTo(_picImageView);
    }];
}

#pragma mark - Setter Getter Methods
- (void)setPicItem:(DCCommentPicItem *)picItem
{
    _picItem = picItem;
    
    [_picImageView sd_setImageWithURL:[NSURL URLWithString:picItem.images[0]]];
    _picNum.text = [NSString stringWithFormat:@"%zd张",picItem.images.count];
    _nickName.text = [DCSpeedy dc_EncryptionDisplayMessageWith:picItem.nickName WithFirstIndex:2];
    
    _imagesArray = picItem.images;
}

#pragma mark - 图片点击
- (void)tapImageView
{
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.currentImageIndex = 0;
    browser.sourceImagesContainerView = self;
    browser.isCascadingShow = YES; //层叠
    browser.imageCount = _imagesArray.count;
    browser.delegate = self;
    [browser show];
}

#pragma mark - SDPhotoBrowserDelegate
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    NSURL *url = [NSURL new];
    if (index < _imagesArray.count) {
        url = [NSURL URLWithString:_imagesArray[index]];
    }
    return url;
}

- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return _picImageView.image;
}
@end
