//
//  GKBaseViewController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKBaseViewController.h"
#import "UINavigationController+GKRotation.h"
#import "UITabBarController+GKRotation.h"

@interface GKBaseViewController ()

@end

@implementation GKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  强制屏幕转屏
 *
 *  @param orientation 屏幕方向
 */
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    // 设置屏幕旋转
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    self.view.frame = CGRectMake(0, 0, size.width, size.height);
    
    // 导航栏高度：横屏52 竖屏64
    CGFloat navbarH = size.width > size.height ? 52 : 64;
    
    self.navigationController.navigationBar.frame = CGRectMake(0, 0, size.width, navbarH);
    
    NSLog(@"%@", NSStringFromCGRect(self.navigationController.navigationBar.frame));
}

- (void)setGk_statusBarStyle:(BOOL)gk_statusBarStyle
{
    _gk_statusBarStyle = gk_statusBarStyle;
    
    // 让状态栏改变类型
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        [self prefersStatusBarHidden];
        
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
}

- (AppDelegate *)appDelegate
{
    if (!_appDelegate) {
        _appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return _appDelegate;
}

#pragma mark - 屏幕旋转
- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - 状态栏

// 解决屏幕横屏时，状态栏隐藏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return self.gk_statusBarStyle;
}

@end
