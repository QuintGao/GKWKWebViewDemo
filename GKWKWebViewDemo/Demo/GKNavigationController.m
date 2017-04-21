//
//  GKNavigationController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKNavigationController.h"

@interface GKNavigationController ()

@end

@implementation GKNavigationController

+ (instancetype)rootVC:(UIViewController *)vc
{
    return [[self alloc] initWithRootViewController:vc];
}

+ (void)load
{
    UINavigationBar *navBar = nil;
    
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 9.0) {
        navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    }else{
        navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    }
    
    [navBar setBackgroundImage:[self imageWithColor:[UIColor blackColor]] forBarMetrics:UIBarMetricsDefault];
    
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:18]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    return [self imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

@end
