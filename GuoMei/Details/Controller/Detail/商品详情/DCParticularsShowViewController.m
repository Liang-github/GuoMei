//
//  DCParticularsShowViewController.m
//  GuoMei
//
//  Created by PengLiang on 2018/1/2.
//  Copyright © 2018年 PengLiang. All rights reserved.
//

#import "DCParticularsShowViewController.h"
#import <WebKit/WebKit.h>

@interface DCParticularsShowViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation DCParticularsShowViewController

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero];
        _webView.frame = self.view.bounds;
        [self.view addSubview:_webView];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setUpBase {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.backgroundColor = self.view.backgroundColor;
}
- (void)setUpGoodsParticularsWKWebView {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_particularUrl]];
    [self.webView loadRequest:request];
}


@end
