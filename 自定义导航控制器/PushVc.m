//
//  PushVc.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/14.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "PushVc.h"

#import "UIImage+imageFromColor.h"

@implementation PushVc

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UIImage * image = [UIImage imageFromColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
     [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
}

@end
