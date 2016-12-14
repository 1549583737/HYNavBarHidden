# HYNavBarHidden分类
---

超简单好用的监听滚动,导航条渐隐的UI效果实现(时下最流行的UI效果之一)

由于只有一个类文件,大家使用的时候直接拖进去去使用就好.笔者就不做cocoapods导入了.

使用过程中发现bug请先下载最新版，若bug依旧存在，请及时反馈，谢谢


#HYNavBarHidden的优点<通过分类和继承两种方案实现,大家各凭喜好使用,继承方案源码较简单，可以先看继承方案，熟悉实现原理>
---
1.文件少，代码简洁,不依赖其他第三方库

2.接口简单,使用方便

# HYNavBarHidden的使用
---
1.导入分类或者继承<通过分类和继承两种方案实现,大家各凭喜好使用>

2.使用方法,控制器实现接口方法

      -(void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HYHidenControlOptions)options;
     
3.分类方案 

      //分类方案 需要在相应的控制器里调用对应的方法 处理导航控制器push和pop操作
      - (void)hy_viewWillAppear:(BOOL)animated;
      - (void)hy_viewWillDisappear:(BOOL)animated;
      - (void)hy_viewDidDisappear:(BOOL)animated;

#warning 

由于导航控制器有push和pop操作,当有下级控制器时,则两个控制器共用一个导航条.侧滑时,导航条的效果有点瑕疵(边缘侧滑回上个控制器的时候，透明度有闪一下恢复的效果)
解决方案和思路(根据不同的需求自行选择)

1.当前控制器没有下级的控制器,即避免push操作了.

2.禁用手势侧滑.并在view的生命周期方法里面再进行调整恢复导航控制器的样式

3.pop出来的控制器中，隐藏导航条，用自定义的一个view充当导航条。这样可以完美的解决，并且不需要调用分类中 三个生命周期中的方法。(hy_viewWillAppear:,
hy_viewWillDisappear,hy_viewDidDisappear:)
#效果演示
---
![1.gif](http://upload-images.jianshu.io/upload_images/1338042-b49f8c85cef44460.gif?imageMogr2/auto-orient/strip)





