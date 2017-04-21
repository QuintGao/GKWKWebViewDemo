//
//  AppDelegate.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "AppDelegate.h"
#import "GKRootViewController.h"
#import "GKNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [GKNavigationController rootVC:[GKRootViewController new]];
    [self.window makeKeyAndVisible];
    
    self.allowRotate = YES;
    
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return self.allowRotate ? UIInterfaceOrientationMaskAllButUpsideDown : UIInterfaceOrientationMaskPortrait;
}

@end
