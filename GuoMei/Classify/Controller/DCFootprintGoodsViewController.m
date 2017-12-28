//
//  DCFootprintGoodsViewController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#define FootprintScreenW ScreenW * 0.4

#import "DCFootprintGoodsViewController.h"
#import "DCRecommendItem.h"
#import "DCFootprintCell.h"
#import <MJExtension.h>
#import "UIViewController+XWTransition.h"

@interface DCFootprintGoodsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIView *footprintView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<DCRecommendItem *> *footprintItem;

@end

static NSString *DCFootprintCellID = @"DCFootprintCell";

@implementation DCFootprintGoodsViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[DCFootprintCell class] forCellReuseIdentifier:DCFootprintCellID];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpFootprintAlertView];
    [self setUpInit];
    [self setUpHeadTitle];
    [self setUpData];
}
- (void)setUpInit {
    self.view.backgroundColor = DCBGColor;
    self.tableView.backgroundColor = self.view.backgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _footprintView = [[UIView alloc] init];
    _footprintView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:_footprintView];
    [_footprintView addSubview:_tableView];
    
    _footprintView.frame = CGRectMake(0, 0, FootprintScreenW, ScreenH);
}
- (void)setUpData {
    _footprintItem = [DCRecommendItem mj_objectArrayWithFilename:@"FootprintGoods.plist"];
}
- (void)setUpHeadTitle {
    UILabel *myFootLabel = [[UILabel alloc] init];
    myFootLabel.text = @"我的足迹";
    myFootLabel.textAlignment = NSTextAlignmentCenter;
    myFootLabel.font = PFR15Font;
    [_footprintView addSubview:myFootLabel];
    myFootLabel.frame = CGRectMake(0, 20, FootprintScreenW, 44);
    
    _tableView.frame = CGRectMake(0, myFootLabel.dc_bottom, FootprintScreenW, ScreenH - myFootLabel.dc_bottom);
}
- (void)setUpFootprintAlertView {
    XWInteractiveTransitionGestureDirection direction = XWInteractiveTransitionGestureDirectionLeft;
    WEAKSELF
    [self xw_registerBackInteractiveTransitionWithDirection:direction transitonBlock:^(CGPoint startPoint){
        [weakSelf selfViewBack];
    } edgeSpacing:80];
}
- (void)selfViewBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _footprintItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DCFootprintCell *cell = [tableView dequeueReusableCellWithIdentifier:DCFootprintCellID forIndexPath:indexPath];
    cell.footprintItem = _footprintItem[indexPath.row];
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return FootprintScreenW + 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了足迹的第%zd条数据",indexPath.row);
}

@end
