//
//  GKRootViewController.m
//  GKWKWebViewDemo
//
//  Created by QuintGao on 2017/4/21.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "GKRootViewController.h"

@interface GKRootViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation GKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"GKDemo";
    
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.dataSource = @[@{@"title"     : @"竖屏控制器不可旋转，播放web视频时可旋转",
                          @"className" : @"GKDemo1ViewController"},
                        @{@"title"     : @"竖屏控制器可旋转，播放web视频时可旋转",
                          @"className" : @"GKDemo2ViewController"},
                        @{@"title"     : @"竖屏控制器可旋转，播放web视频时不可旋转",
                          @"className" : @"GKDemo3ViewController"}];
}

#pragma mark - UITableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.dataSource[indexPath.row] objectForKey:@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *vc = [NSClassFromString([self.dataSource[indexPath.row] objectForKey:@"className"]) new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
