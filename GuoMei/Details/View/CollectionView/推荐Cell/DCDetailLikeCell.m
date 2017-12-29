//
//  DCDetailLikeCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/29.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCDetailLikeCell.h"
#import "DCRecommendItem.h"
#import "DCDetailLikeItemCell.h"
#import <MJExtension.h>


@interface DCDetailLikeCell ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray<DCRecommendItem *> *detailRecItem;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

static NSString *const DCDetailLikeItemCellID = @"DCDetailLikeItemCell";

@implementation DCDetailLikeCell

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(self.dc_width/3, self.dc_width/3 + 60);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [self addSubview:_collectionView];
        _collectionView.frame = CGRectMake(0, 0, self.dc_width, self.dc_height - 20);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        
        [_collectionView registerClass:[DCDetailLikeItemCell class] forCellWithReuseIdentifier:DCDetailLikeItemCellID];
    }
    return _collectionView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpUI];
        
        [self seUpPageControl];
    }
    return self;
}


- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = self.backgroundColor;
    
    _detailRecItem = [DCRecommendItem mj_objectArrayWithFilename:@"DetailRecommend.plist"];
}

#pragma mark - 设置分页点
- (void)seUpPageControl
{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectZero];
    self.pageControl.userInteractionEnabled = NO;
    self.pageControl.hidesForSinglePage = YES;
    self.pageControl.numberOfPages = 3;
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:self.pageControl];
    
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _pageControl.frame = CGRectMake(self.dc_width * 0.5 - 40, self.dc_height - (DCMargin * 2), 80, 20);//指定位置大小
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _detailRecItem.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DCDetailLikeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCDetailLikeItemCellID forIndexPath:indexPath];
    cell.youLikeItem = _detailRecItem[indexPath.row];
    return cell;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger current = scrollView.contentOffset.x / CGRectGetWidth(scrollView.frame);
    //下角小圆圈
    self.pageControl.currentPage = current;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"推荐喜欢商品%zd",indexPath.row);
    
}
@end
