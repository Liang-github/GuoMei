//
//  DCMyTrolleyViewController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//
#define collectionViewW 100
#define collectionViewH 150
#define recommendReusableViewH 40
#import "DCMyTrolleyViewController.h"

#import "DCRecommendItem.h"
#import "DCEmptyCartView.h"
#import "DCRecommendCell.h"
#import "DCRecommendReusableView.h"

#import <MJExtension.h>
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface DCMyTrolleyViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray<DCRecommendItem *> *recommendItem;

@property (nonatomic, weak) id dcObserve;


@end

static NSString *const DCRecommendCellID = @"DCRecommendCell";

@implementation DCMyTrolleyViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1;
        layout.itemSize = CGSizeMake(collectionViewW, collectionViewH);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        
        [_collectionView registerClass:[DCRecommendCell class] forCellWithReuseIdentifier:DCRecommendCellID];
        
    }
    return _collectionView;
}
- (NSMutableArray<DCRecommendItem *> *)recommendItem {
    if (!_recommendItem) {
        _recommendItem = [NSMutableArray array];
    }
    return _recommendItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBase];
    [self setUpRecommendData];
    [self setUpEmptyCartView];
    [self setUpRecommendReusableView];
}
- (void)setUpBase {
    self.view.backgroundColor = DCBGColor;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat colBottom = (self.isTabBar == NO) ? DCBottomTabH : 0;
    self.collectionView.frame = CGRectMake(0, ScreenH - collectionViewH - colBottom, ScreenW, collectionViewH);
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
- (void)setUpRecommendData {
    _recommendItem = [DCRecommendItem mj_objectArrayWithFilename:@"RecommendShop.plist"];
}
- (void)setUpRecommendReusableView {
    DCRecommendReusableView *recommendReusableView = [[DCRecommendReusableView alloc] init];
    recommendReusableView.backgroundColor = self.collectionView.backgroundColor;
    [self.view addSubview:recommendReusableView];
    recommendReusableView.frame = CGRectMake(0, _collectionView.dc_y - recommendReusableViewH, ScreenW, recommendReusableViewH);
}
- (void)setUpEmptyCartView {
    DCEmptyCartView *emptyCartView = [[DCEmptyCartView alloc] init];
    [self.view addSubview:emptyCartView];
    
    emptyCartView.frame = CGRectMake(0, DCTopNavH, ScreenW, ScreenH - DCTopNavH - DCBottomTabH - (collectionViewH + recommendReusableViewH));
    emptyCartView.buyingClickBlock = ^{
        NSLog(@"点击了立即抢购");
    };
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _recommendItem.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DCRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DCRecommendCellID forIndexPath:indexPath];
    cell.recommendItem = _recommendItem[indexPath.row];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击了推荐商品");
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:_dcObserve];
}

@end
