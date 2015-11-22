//
//  PublicTabBar.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PublicTabBar.h"

@interface PublicTabBar ()

@property (nonatomic, weak)UIButton *plusButton;

@end

@implementation PublicTabBar

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加一个中间的 button
        UIButton *button = [[UIButton alloc]init];
        
        //设置 button 的图片
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //添加监听事件
        [button addTarget:self action:@selector(plusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置大小
        button.size = button.currentBackgroundImage.size;
        
        self.plusButton = button;
        //添加
        [self addSubview:button];
        
    }
    
    return self;
}

#pragma mark - 布局
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat childW = SCREEN_W / 5;
    NSInteger count = self.subviews.count;
    NSInteger index = 0;
    for (int i = 0; i < count; i++) {
        UIView *childView = self.subviews[i];
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childView.x = childW * index;
            childView.width = childW;
            index ++;
            if (index == 2) {
                index ++;
            }
        }
    }
    self.plusButton.centerX = self.frame.size.width * 0.5;
    self.plusButton.centerY = self.frame.size.height * 0.5;
    
}

#pragma mark - 点击事件
- (void)plusButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectPlusButton:)]) {
        [self.delegate tabBar:self didSelectPlusButton:button];
    }
}

@end
