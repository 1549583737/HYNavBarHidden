//
//  TestCollectionController.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "TestCollectionController.h"
#import "UIViewController+NavBarHidden.h"

@interface TestCollectionController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak) UICollectionView * collectionView;

@end

@implementation TestCollectionController

-(void)viewDidLoad{
    
    [super viewDidLoad];

    //1.设置当有导航栏自动添加64的高度的属性为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //2.设置导航条内容
    [self setUpNavBar];
    
    //3.导航条上的自定义的子标签是否需要跟着隐藏
    [self  setIsNavBarItemAlpha:NO];
    
    //4.设置collectionView
    [self setUpCollectionView];
    
    //5.告诉程序是根据哪个scrollView的滚动来控制状态栏的变化
    self.keyScrollView = self.collectionView;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


#warning 监听滚动,调用框架接口
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //rate将决定颜色变化程度,值越大,颜色变化越明显,rate的取值范围是0.01 - 0.999999
    [self scrollControlRate:0.5 colorWithRed:1.0 green:0.0 blue:0.0 ];
    
}
- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setInViewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self setInViewWillDisappear];
}

- (void)setUpNavBar{

    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addBtn];
    UILabel * titleLabel =[[UILabel alloc]init];
    titleLabel.text = @"HelloYeah";
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - custom method
//初始化CollectionView
- (void)setUpCollectionView{
    
    //创建CollectionView
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];;
    
    //设置item属性
    layout.itemSize = CGSizeMake(150, 200);
    layout.minimumInteritemSpacing = 20;
    layout.sectionInset = UIEdgeInsetsMake(270, 20, 20, 20);
    
    collectionView.backgroundColor = [UIColor whiteColor];
   
    //添加到控制器上
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    [self setHeaderView];
    
    
    collectionView.dataSource = self;
    //成为collectionView代理,监听滚动.
    collectionView.delegate = self;
    //注册cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"test"];
        
}



//设置头部视图
- (void)setHeaderView{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1.jpg" ofType:nil];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:filePath]];
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.collectionView.frame.size.width, 250)];
    imageView.image = image;
    
    imageView.backgroundColor = [UIColor redColor];

    [self.collectionView addSubview:imageView];
}


#pragma mark - 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
    
}

@end
