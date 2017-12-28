//
//  DCListGridCell.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/28.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCListGridCell.h"
#import "DCRecommendItem.h"
#import <UIImageView+WebCache.h>

@interface DCListGridCell ()

@property (nonatomic, strong) UIImageView *freeSuitImageView;

@property (nonatomic, strong) UIImageView *gridImageView;

@property (nonatomic, strong) UILabel *gridLabel;

@property (nonatomic, strong) UIImageView *autotrophyImageView;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *commentNumLabel;

@property (nonatomic, strong) UIButton *colonButton;

@end
@implementation DCListGridCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI {
    self.backgroundColor = [UIColor whiteColor];
    _freeSuitImageView = [[UIImageView alloc] init];
    _freeSuitImageView.image = [UIImage imageNamed:@"taozhang_tag"];
    [self addSubview:_freeSuitImageView];
    
    _autotrophyImageView = [[UIImageView alloc] init];
    [self addSubview:_autotrophyImageView];
    _autotrophyImageView.image = [UIImage imageNamed:@"detail_title_ziying_tag"];
    _gridImageView = [[UIImageView alloc] init];
    _gridImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_gridImageView];
    
    _gridLabel = [[UILabel alloc] init];
    _gridLabel.font = PFR14Font;
    _gridLabel.numberOfLines = 2;
    _gridLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_gridLabel];
    
    _priceLabel = [[UILabel alloc] init];
    _priceLabel.font = PFR15Font;
    _priceLabel.textColor = [UIColor redColor];
    [self addSubview:_priceLabel];
    
    _commentNumLabel = [[UILabel alloc] init];
    NSInteger pNum = arc4random()%10000;
    _commentNumLabel.text = [NSString stringWithFormat:@"%zd人已评价",pNum];
    _commentNumLabel.font = PFR10Font;
    _commentNumLabel.textColor = [UIColor darkGrayColor];
    [self addSubview:_commentNumLabel];
    
    _colonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_colonButton setImage:[UIImage imageNamed:@"icon_shenglue"] forState:UIControlStateNormal];
    [_colonButton addTarget:self action:@selector(colonButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_colonButton];
    
    [DCSpeedy dc_setUpAcrossPartingLineWith:self WithColor:[[UIColor lightGrayColor]colorWithAlphaComponent:0.4]];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_gridImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        [make.left.mas_equalTo(self)setOffset:DCMargin * 2];
        make.size.mas_equalTo(CGSizeMake(90, 90));
    }];
    
    [_autotrophyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(_gridImageView.mas_right)setOffset:DCMargin];
        make.top.mas_equalTo(_gridImageView);
    }];
    
    [_gridLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.left.mas_equalTo(_gridImageView.mas_right)setOffset:DCMargin];
        [make.top.mas_equalTo(_gridImageView)setOffset:-3];
        [make.right.mas_equalTo(self)setOffset:-DCMargin];
    }];
    
    
    [_freeSuitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_gridLabel.mas_bottom)setOffset:2];
    }];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_freeSuitImageView.mas_bottom)setOffset:2];
    }];
    
    [_commentNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_autotrophyImageView);
        [make.top.mas_equalTo(_priceLabel.mas_bottom)setOffset:2];
    }];
    
    [_colonButton mas_makeConstraints:^(MASConstraintMaker *make) {
        [make.right.mas_equalTo(self)setOffset:-DCMargin];
        [make.bottom.mas_equalTo(self)setOffset:-DCMargin];
        make.size.mas_offset(CGSizeMake(22, 15));
    }];
}
- (void)setYouSelectItem:(DCRecommendItem *)youSelectItem
{
    _youSelectItem = youSelectItem;
    [_gridImageView sd_setImageWithURL:[NSURL URLWithString:youSelectItem.image_url]];
    _priceLabel.text = [NSString stringWithFormat:@"¥ %.2f",[youSelectItem.price floatValue]];
    _gridLabel.text = youSelectItem.main_title;
    //首行缩进
    [DCSpeedy dc_setUpLabel:_gridLabel Content:youSelectItem.main_title IndentationFortheFirstLineWith:_gridLabel.font.pointSize * 2.5];
}

#pragma mark - 点击事件
- (void)colonButtonClick
{
    !_colonClickBlock ? : _colonClickBlock();
}
@end
