//
//  GKDemo1ViewController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKDemo2ViewController.h"
#import <WebKit/WebKit.h>

@interface GKDemo2ViewController ()<WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation GKDemo2ViewController

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
}

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
