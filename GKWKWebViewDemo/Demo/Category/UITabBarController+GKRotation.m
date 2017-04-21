//
//  UITabBarController+GKRotation.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "UITabBarController+GKRotation.h"

@implementation UITabBarController (GKRotation)

/**
 * 如果window的根视图是UITabBarController，则会先调用这个Category
 * 只需要在支持除竖屏以外方向的页面重新下边三个方法
 */

// 是否支持自动转屏
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

// 支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}

#pragma mark - 状态栏相关
- (UIViewController *)childViewControllerForStatusBarHidden
{
    return self.selectedViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.selectedViewController;
}

@end
