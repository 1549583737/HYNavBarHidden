
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
    
    //设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //设置导航条上的自定义的子标签是否需要跟着隐藏.
    self.isTitleAlpha = YES;
    
    self.scrolOffsetY = 300;

    //右侧的相机是系统的自带的,无法跟随滚动透明度变化,原因是分类源码里是设置BarButtonItem.customView.alpha来控制透明度的.
    self.isRightAlpha = YES;
    
    //设置tableView的头部视图
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, 250)];
    imageView.image = [UIImage imageNamed:@"lol"];
    self.tableView.tableHeaderView = imageView;

}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
      [self scrollControl];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setInViewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self setInViewWillDisappear];
}

@end
