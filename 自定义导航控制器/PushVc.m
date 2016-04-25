//
//  PushVc.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/14.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "PushVc.h"

@implementation PushVc

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:0.999];

    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    NSLog(@"%@",self.navigationController.navigationBar.subviews.firstObject);
}

@end
