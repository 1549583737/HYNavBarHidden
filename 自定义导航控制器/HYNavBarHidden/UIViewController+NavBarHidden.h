//
//  UIViewController+scrollerHidden.h
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah--叶良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavBarHidden)

/** 需要监听的view */
@property (nonatomic,weak) UIScrollView * keyScrollView;

/** 设置导航条上的标签是否需要跟着隐藏  */
- (void)setIsNavBarItemAlpha:(BOOL )isNavBarItemAlpha;

/** 清除默认导航条的背景设置 */
- (void)setInViewWillAppear;
- (void)setInViewWillDisappear;


/** rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999 */
- (void)scrollControlRate:(CGFloat)height colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue ;

@end