//
//  NavigationController.m
//  自定义导航控制器
//
//  Created by Sekorm on 2016/12/5.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers count] > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
