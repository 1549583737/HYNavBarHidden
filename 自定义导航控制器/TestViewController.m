
//
//  TestViewController.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "TestViewController.h"
#import "UIViewController+NavBarHidden.h"

@implementation TestViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //清除默认导航条的背景颜色
    [self clearNavBar];
    
    //设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置tableView的头部视图
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 250)];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    self.tableView.tableHeaderView = imageView;
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999
    [self scrollControlRate:0.5 colorWithRed:0.0 green:1.0 blue:0.0 isNavBarItemAlpha:YES];

}

@end
