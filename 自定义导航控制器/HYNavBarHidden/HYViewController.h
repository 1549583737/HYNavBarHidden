//
//  HYViewController.h
//  自定义导航控制器
//
//  Created by Sekorm on 16/4/22.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, HYHidenControlOptions) {

    HYHidenControlOptionLeft = 0x01,
    HYHidenControlOptionTitle = 0x01 << 1,
    HYHidenControlOptionRight = 0x01 << 2,
    
};

@interface HYViewController : UIViewController

/** 需要监听的view */
//@property (nonatomic,weak) UIScrollView * keyScrollView;
//
///** 设置导航条上的标签是否需要跟随滚动变化透明度,默认不会跟随滚动变化透明度 */
//@property (nonatomic,assign) BOOL  isLeftAlpha;
//@property (nonatomic,assign) BOOL  isTitleAlpha;
//@property (nonatomic,assign) BOOL  isRightAlpha;



/** ScrollView的Y轴偏移量大于scrolOffsetY的距离后,导航条的alpha为1 */
@property (nonatomic,assign) CGFloat scrolOffsetY;

- (void)setKeyScrollView:(UIScrollView * )keyScrollView scrolOffsetY:(CGFloat)scrolOffsetY options:(HYHidenControlOptions)options;

@end
