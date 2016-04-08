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

1. keyScrollView:当一个控制器中有多个ScrollView,要指明是监听哪个ScrollView的滚动

2.导航条中item是否跟着渐隐,分别设置左边,中间,右边三个的BOOL值.默认为NO	

	/** 设置导航条上的标签是否需要跟随滚动变化透明度,默认不会跟随滚动变化透明度 */
	@property (nonatomic,assign) BOOL  isLeftAlpha;
	@property (nonatomic,assign) BOOL  isTitleAlpha;
	@property (nonatomic,assign) BOOL  isRightAlpha;

3.opaqueOffsetY:偏移大于等于offsetY时,导航条的alpha为1,完全不透明


###方法  (push或者pop控制器时,消除或回复导航条状态)

4.方法setInViewWillAppear : 

5.方法setInViewWillDisappear :

#效果演示
---
![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)

###在这给大家推荐一个非常好用的图片轮播组件.是目前笔者发现封装得最好的图片轮播器.代码十分值得学习借鉴,github链接https://github.com/codingZero/XRCarouselView

#效果演示
---
https://camo.githubusercontent.com/314a7cae39cce63008d7f212614b1bf51e06da3a/687474703a2f2f7777312e73696e61696d672e636e2f6c617267652f62363832333261316777316632673636746338766b67323061643035623774662e676966
