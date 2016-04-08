# HYNavBarHidden
详细使用方法,原理说明,欢迎大家关注笔者简书链接http://www.jianshu.com/p/ac237ebcd4fb.
#####在这给大家推荐一个非常好用的图片轮播组件.是目前笔者发现封装得最好的图片轮播器.代码十分值得学习借鉴,github链接https://github.com/codingZero/XRCarouselView

#导读

####下面这个界面有没有觉得很眼熟。打开你手里的App仔细观察，你会发现很多都有实现这个功能。比如美团外卖的首页模块，新浪微博的个人详情页面。要怎么样才能快速的实现这个功能呢！花了点时间在原先的基础上进行了一个优化.使用起来更加方便,接口更清晰.希望看了我的demo对大家以后实现类似功能有所帮助..
.

![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)
### 原理介绍：
 
要想把一个view设计成透明的我们一下子就会想到两种方案，设置view的alpha值为0，或者设置view的backgroundColor为clearColor.但是UINavigationBar是一个比较特殊的视图，它是没有alpha属性的，那我们可以设置opaque（不透明度）为NO，上代码试一试

	//方案一：不透明度为NO
	navigationBar.opaque = NO；
	//方案二：背景颜色为clearColor 
	navigationBar.backgroudcolor = [UIColor clearColor]；

	
结果，然并卵，完全没用。这时候该怎么办呢？这时候我们就得来看看UINavigationBar这个视图的结构了，如下图。

![NavgationBar.png](http://upload-images.jianshu.io/upload_images/1338042-37dc3d6d13928247.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

现在笔者教大家一个小技巧。请看下面代码：


	
    //设置一张空的图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];


这时候再打开项目层次图，你会有惊人的发现

![Snip20160314_4.png](http://upload-images.jianshu.io/upload_images/1338042-f536dfec210871ae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

对比一下，你会发现只剩两层了。不要问为什么，这都是系统帮你做的。。。当你设置了背景图片的时候，就会出现这样的结果。

知道了上述的原理，这就好办了，现在只要监听控制器内部的scrollView 的滚动，再通过设置透明度,实现渐变效果.核心代码如下.
![Snip20160402_1.png](http://upload-images.jianshu.io/upload_images/1338042-21dde31356e99a6d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

* 业务逻辑，功能实现其实都不是很难。但有一些细节需要处理,例如当导航控制器push到下一个控制器的时候,如何不影响下个控制器导航条.笔者原本考虑通过运行时把ViewWillAppear和ViewWillDisappear进行交换,在view显示和消失的时候进行一些处理,这样做,外界不需要调用任何代码,就可以实现效果.但交换方法会对系统的UIViewController有影响.所有控制器的这两个方法都会被改变.这不是我想要的.所以排除这种方案,只能通过提供两个接口供外界调用.代码如下


![Snip20160402_2.png](http://upload-images.jianshu.io/upload_images/1338042-2608c88e38047b24.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 框起来的这两行代码感觉挺有意思的,干什么用的,大家稍微分析一下就明白了.这是我解决pop回来恢复上个控制器导航条状态的方案,如果大家有更好的方法或思路可以提供建议和评论!!!

# 分类介绍
* ###### 我写的这个分类不仅可以在系统的UITableViewController 和UICollectionViewController中使用，（系统的只需调用分类中两个方法即可）。而且当你的UIViewController中有1个或多个可以垂直滚动的scrollView都可以使用。（需要告诉控制器需要监听哪个scrollView的滚动，即设置keyScrollView）.


# 现在来看一下分类对外提供的接口

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
