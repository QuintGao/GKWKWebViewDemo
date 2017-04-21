//
//  GKCoverViewController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//  此类用于把控制器旋转成横屏

#import "GKCoverViewController.h"

@interface GKCoverViewController ()

@end

@implementation GKCoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

@end
