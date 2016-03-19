# HYNavBarHidden
详细使用方法,原理说明,链接http://www.jianshu.com/p/b8b70afeda81


##### 下面这个界面有没有觉得很眼熟。打开你手里的App仔细观察，你会发现很多都有实现这个功能。比如美团外卖的首页模块，新浪微博的个人详情页面。要怎么样才能快速的实现这个功能呢！那下面由笔者来告诉你如何三行代码，集成这个功能。。。

![2.gif](http://upload-images.jianshu.io/upload_images/1338042-cf64012c1e1dc210.gif?imageMogr2/auto-orient/strip)

---
##### 这个分类不仅可以在系统的UITableViewController 和UICollectionViewController中使用，（系统的只需调用分类中两个方法即可）。而且当你的UIViewController中有1个或多个可以垂直滚动的scrollView都可以使用。（需要告诉控制器需要监听哪个scrollView的滚动，即设置keyScrollView）.
重要的是，这个分类的代码侵入性非常低，使用简单方便。当不需要这些功能的时候，你只需要注释掉两三行代码即可。


![1.gif](http://upload-images.jianshu.io/upload_images/1338042-1fc728b0d55b1f69.gif?imageMogr2/auto-orient/strip)

详细使用方法,原理说明,链接http://www.jianshu.com/p/b8b70afeda81
