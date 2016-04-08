# HYNavBarHidden分类
---

超简单好用的监听滚动,导航条渐隐的UI效果实现(时下最流行的UI效果之一)

使用过程中发现bug请先下载最新版，若bug依旧存在，请及时反馈，谢谢

详细使用方法,原理说明,欢迎大家关注笔者简书链接http://www.jianshu.com/p/ac237ebcd4fb.

#HYNavBarHidden的优点
---
1.文件少，代码简洁,不依赖其他第三方库

2.接口简单,使用方便

3.对源码无侵入性,导入分类即可使用,无需继承

# HYNavBarHidden的常用属性方法
---
####属性
1.keyScrollView:当控制器中有多个ScrollView时,要指明是监听哪个ScrollView的滚动

2.导航条中item是否跟着渐隐,分别设置左边,中间,右边三个的BOOL值.默认为NO	

	/** 设置导航条上的标签是否需要跟随滚动变化透明度,默认不会跟随滚动变化透明度 */
	@property (nonatomic,assign) BOOL  isLeftAlpha;
	@property (nonatomic,assign) BOOL  isTitleAlpha;
	@property (nonatomic,assign) BOOL  isRightAlpha;

3.scrolOffsetY:偏移大于等于scrolOffsetY时,导航条的alpha为1,完全不透明


###方法  (push或者pop控制器时,消除或回复导航条状态)

4.- (void)setInViewWillAppear 在控制器的viewWillAppear:方法中调用

5.- (void)setInViewWillDisappear 在控制器的viewWillDisappear:方法中调用
 
6.- (void)scrollControl 在scrollView代理方法中调用

#效果演示
---
![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)

###最后在这给大家推荐一个极为好用的图片轮播器.是目前笔者发现封装得最好的图片轮播器之一.代码十分值得学习借鉴,github源码链接https://github.com/codingZero/XRCarouselView
---
![3.gif](http://upload-images.jianshu.io/upload_images/1338042-3c3b404123db6f3b.gif?imageMogr2/auto-orient/strip)



