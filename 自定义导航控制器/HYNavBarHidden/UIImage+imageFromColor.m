//
//  UIImage+imageFromColor.m
//  自定义导航控制器
//
//  Created by HelloYeah on 16/3/12.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "UIImage+imageFromColor.h"



@implementation UIImage (imageFromColor)

+ (UIImage *)imageFromColor:(UIColor *)color{

    CGSize  size = CGSizeMake(1.0f, 1.0f);
    //开启图形上下文
    UIGraphicsBeginImageContext(size);
    //获取当前图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    //渲染图形上下文
    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    //从图形上下文中获取图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;
}

@end
