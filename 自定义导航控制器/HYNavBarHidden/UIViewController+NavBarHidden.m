//
//  UIViewController+scrollerHidden.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "UIViewController+NavBarHidden.h"
#import <objc/runtime.h>
#import "UIImage+imageFromColor.h"


@implementation UIViewController (NavBarHidden)

static CGFloat alpha = 0; //透明度

static bool _isNavBarItemAlpha = YES; //默认导航条上的子标签跟着隐藏


//清空默认导航条背景
- (void)clearNavBar{
    
    //设置一张空的图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
   
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];

    
}




//导航条上的子控件是否要跟着透明变化
- (void)setIsNavBarItemAlpha:(BOOL )isNavBarItemAlpha{
    
    _isNavBarItemAlpha = isNavBarItemAlpha;
   
}

//
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
//    
//    NSLog(@"%@",change);
//}


- (void)scrollControlRate:(CGFloat)rate colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{
    
    //传值处理
    if (rate >= 1) {
        rate = 0.999999;
    }else if(rate <= 0.000001){
        rate = 0.000001;
    }
    
    
    //根据滚动距离计算透明度
    CGFloat height = (1 - rate) * [UIScreen mainScreen].bounds.size.height;
    
    if ([self getScrollerView]){
        
        UIScrollView * scrollerView = [self getScrollerView];
        
        alpha =  scrollerView.contentOffset.y/height;
    }
    
    if (alpha <= 0) {
        alpha = 0.00001;
    }
    
    //设置背景图片
    UIImage * image = [UIImage imageFromColor:[UIColor colorWithRed:red green:green blue:blue  alpha:alpha]];
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条上的标签为透明
    if (_isNavBarItemAlpha)
    {
        self.navigationItem.leftBarButtonItem.customView.alpha = alpha;
        self.navigationItem.titleView.alpha = alpha;
        self.navigationItem.rightBarButtonItem.customView.alpha = alpha;
    }
    
}


// 获取tableView 或者 collectionView
- (UIScrollView *)getScrollerView{

    if ([self isKindOfClass:[UITableViewController class]]) {

        return  (UIScrollView *)self.view;
        
    }else if ([self isKindOfClass:[UICollectionViewController class]]){

        return  (UIScrollView *)self.view;

    }else{
        for (UIView * view in self.view.subviews) {
            
            if ([view isEqual:self.keyScrollView] & [view isKindOfClass:[UIScrollView class]]) {
                
                return (UIScrollView *)view;
            }
        }
    }
    return nil;
}


#pragma mark - 通过运行时动态添加keyScrollView属性
//定义关联的Key
static const char * key = "keyScrollView";

- (UIScrollView *)keyScrollView{
    
    return objc_getAssociatedObject(self, key);
}

- (void)setKeyScrollView:(UIScrollView *)keyScrollView{
    
    objc_setAssociatedObject(self, key, keyScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
        [self scrollControlRate:0.999999 colorWithRed:1 green:1 blue:1];
        NSLog(@"zzzz");

//    });
    
}

@end
