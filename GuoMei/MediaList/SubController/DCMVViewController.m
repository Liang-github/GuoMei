//
//  DCMVViewController.m
//  GuoMei
//
//  Created by PengLiang on 2017/12/27.
//  Copyright © 2017年 PengLiang. All rights reserved.
//

#import "DCMVViewController.h"
#import <WebKit/WebKit.h>

@interface DCMVViewController ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, weak) UIProgressView *progressView;

@end

@implementation DCMVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpStarWebView];
    [self setUpProgress];
    [self setUpNote];
}

- (void)setUpStarWebView {
    WKWebView *webView = [[WKWebView alloc] init];
    webView.backgroundColor = [UIColor whiteColor];
    self.webView = webView;
    [self.view insertSubview:webView atIndex:0];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    // 加载数据
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_url]];
    [webView loadRequest:request];
}
#pragma mark - 初始化进度条
- (void)setUpProgress {
    UIProgressView *progressView = [[UIProgressView alloc] init];
    progressView.progress = 0;
    _progressView = progressView;
    progressView.trackTintColor = [UIColor clearColor];
    progressView.tintColor = [UIColor redColor];
    [self.view addSubview:progressView];
}
#pragma mark - 通知
- (void)setUpNote {
    // 进度条观察者
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    self.webView = nil;
    self.webView.navigationDelegate = nil;
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.webView.frame = CGRectMake(0, 0, self.view.dc_width, self.view.dc_height - 49);
    self.progressView.frame = CGRectMake(0, 0, ScreenW, 1.5);
}
@end
