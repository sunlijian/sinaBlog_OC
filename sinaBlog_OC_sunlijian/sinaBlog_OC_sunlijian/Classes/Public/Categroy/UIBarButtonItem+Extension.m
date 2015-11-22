//
//  UIBarButtonItem+Extension.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

//设置导航控制器 上的按钮
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    //设置图片
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    //设置大小
    button.size = button.currentImage.size;
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    //设置图片
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted",imageName]] forState:UIControlStateHighlighted];
    //设置字
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:RGB(53, 53, 53) forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    
    //设置大小
    [button sizeToFit];
    //添加点击事件
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

@end
