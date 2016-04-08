# HYNavBarHidden
详细使用方法,原理说明,欢迎大家关注笔者简书链接http://www.jianshu.com/p/ac237ebcd4fb.
#####在这给大家推荐一个非常好用的图片轮播组件.是目前笔者发现封装得最好的图片轮播器.代码十分值得学习借鉴,github链接https://github.com/codingZero/XRCarouselView

#导读

####下面这个界面有没有觉得很眼熟。打开你手里的App仔细观察，你会发现很多都有实现这个功能。比如美团外卖的首页模块，新浪微博的个人详情页面。要怎么样才能快速的实现这个功能呢！花了点时间在原先的基础上进行了一个优化.使用起来更加方便,接口更清晰.希望看了我的demo对大家以后实现类似功能有所帮助..
.

![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)


# 分类介绍
###### 我写的这个分类不仅可以在系统的UITableViewController 和UICollectionViewController中使用，（系统的只需调用分类中两个方法即可）。而且当你的UIViewController中有1个或多个可以垂直滚动的scrollView都可以使用。（需要告诉控制器需要监听哪个scrollView的滚动，即设置keyScrollView）.


# 看一下分类对外提供的接口

    分类接口如下

	#import <UIKit/UIKit.h>
	
	@interface UIViewController (NavBarHidden)
	
	/** 需要监听的ScrollView ,如果是系统的UITableViewController 和UICollectionViewController则不需要设置这个属性*/
	@property (nonatomic,weak) UIScrollView * keyScrollView;
	
	/** 设置导航条上的标签是否需要跟随滚动变化透明度,默认不会跟随滚动变化透明度 */
	@property (nonatomic,assign) BOOL  isLeftAlpha;
	@property (nonatomic,assign) BOOL  isTitleAlpha;
	@property (nonatomic,assign) BOOL  isRightAlpha;
	
	/** 恢复控制器导航条的透明度 */
	- (void)setInViewWillAppear;
        /** 消除对其他控制器的影响 */
	- (void)setInViewWillDisappear;
	
	/** 偏移大于等于offsetY的距离时,导航条的alpha为1 */
	- (void)scrollControlByOffsetY:(CGFloat)offsetY;
	
	@end
---

#### Demo源码分享，希望大家喜欢，下载的时候顺便star一下，好人多福。<https://github.com/newyeliang/HYNavBarHidden.git>
