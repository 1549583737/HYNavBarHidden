# HYNavBarHidden分类
---

超简单好用的监听滚动,导航条渐隐的UI效果实现(时下最流行的UI效果之一)

由于只有一个类文件,大家使用的时候直接拖进去去使用就好.笔者就不做cocoapods导入了.

使用过程中发现bug请先下载最新版，若bug依旧存在，请及时反馈，谢谢


#HYNavBarHidden的优点<通过分类和继承两种方案实现,大家各凭喜好使用>
---
1.文件少，代码简洁,不依赖其他第三方库

2.接口简单,使用方便

# HYNavBarHidden的使用
---
1.导入分类或者继承<通过分类和继承两种方案实现,大家各凭喜好使用>


2.使用方法,控制器实现接口方法


   -(void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HYHidenControlOptions)options;

#warning 

由于导航控制器有push和pop操作,当有下级控制器时,则两个控制器共用一个导航条.侧滑时,导航条的效果有点瑕疵

解决方案和思路(根据不同的需求自行选择)

1.当前控制器没有下级的控制器,即避免push操作了.

2.禁用手势侧滑.并在view的生命周期方法里面再进行调整恢复导航控制器的样式

3.自定义导航条,使每个控制器都有自己的独立的导航条.相互不影响,功能实现参考demo

#效果演示
---
![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)

###最后在这给大家推荐一个极为好用的图片轮播器.是目前笔者发现封装得最好的图片轮播器之一.github源码链接https://github.com/codingZero/XRCarouselView
---
![3.gif](http://upload-images.jianshu.io/upload_images/1338042-3c3b404123db6f3b.gif?imageMogr2/auto-orient/strip)



