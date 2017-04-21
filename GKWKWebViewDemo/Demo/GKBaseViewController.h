//
//  GKBaseViewController.h
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface GKBaseViewController : UIViewController

/**
 *  强制屏幕转屏
 *
 *  @param orientation 屏幕方向
 */
- (void)interfaceOrientation:(UIInterfaceOrientation)orientation;

/** 设置单个控制器的状态栏类型 */
@property (nonatomic, assign) BOOL gk_statusBarStyle;

@property (nonatomic, strong) AppDelegate *appDelegate;

@end
