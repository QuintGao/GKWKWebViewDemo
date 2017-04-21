//
//  GKDemo1ViewController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo3ViewController.h"
#import <WebKit/WebKit.h>

@interface GKDemo3ViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation GKDemo3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"视频旋转";
    
    
    WKWebViewConfiguration *congiguration = [WKWebViewConfiguration new];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) configuration:congiguration];
    self.webView.navigationDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    // 加载网页
    NSURL *url = [NSURL URLWithString:@"https://m.365yg.com/i6294079712998195713/?utm_campaign=client_share&app=news_article&utm_medium=toutiao_ios&tt_from=mobile_qq&utm_source=mobile_qq&iid=8918144290"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowVisible:) name:UIWindowDidBecomeVisibleNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowHidden:) name:UIWindowDidBecomeHiddenNotification object:nil];
    
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - 通知-设置播放器不可旋转
- (void)windowVisible:(NSNotification *)notify
{
    self.appDelegate.allowRotate = NO;
}

- (void)windowHidden:(NSNotification *)notify
{
    self.appDelegate.allowRotate = YES;
}

#pragma mark - 控制器可旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.webView.frame = CGRectMake(0, self.navigationController.navigationBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height);
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"页面加载完成");
}

@end
