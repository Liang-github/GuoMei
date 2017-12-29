//
//  DCCommentContentCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCCommentContentCell.h"
#import "DCCommentPicItem.h"
#import "DCCommentPicCell.h"
#import "DCPartCommentHeadView.h"

#import <MJExtension.h>

@interface DCCommentContentCell ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) DCPartCommentHeadView *headView;
@property (nonatomic, strong) NSMutableArray<DCCommentPicItem *> *picItem;
@end
static NSString *const DCCommentPicCellID = @"DCCommentPicCell";
@implementation DCCommentContentCell
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        //注册
        [_collectionView registerClass:[DCCommentPicCell class] forCellWithReuseIdentifier:DCCommentPicCellID];
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark - Intial
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
    self.collectionView.backgroundColor = self.backgroundColor;
    
    _picItem = [DCCommentPicItem mj_objectArrayWithFilename:@"CommentPic.plist"];
    
    [self setUpCommentCell];
}

- (void)setUpCommentCell
{
    _headView = [[DCPartCommentHeadView alloc] init];
    _headView.picNum = @"12";
    [self addSubview:_headView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self);
        make.left.mas_equalTo(self);
        make.top.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.top.mas_equalTo(self)setOffset:100];
        make.left.mas_equalTo(self);
        make.width.mas_equalTo(self);
        make.height.mas_equalTo(100);
    }];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _picItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DCCommentPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCCommentPicCellID forIndexPath:indexPath];
    cell.picItem = _picItem[indexPath.row];
    return cell;
}


#pragma mark - <UICollectionViewDelegate>
#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(100, 100);
    
}
@end
