//
//  ComposeButton.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "ComposeButton.h"
#import "POP.h"
@implementation ComposeButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.size = CGSizeMake(kComposeButtonW, kComposeButtonW);
        //设置文字
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //设置图片
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

#pragma mark - 布局子控件
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = kComposeButtonW;
    self.imageView.height = kComposeButtonW;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = kComposeButtonW;
    self.titleLabel.width = kComposeButtonW;
    self.titleLabel.height = kComposeButtonH - kComposeButtonW;
    
}

#pragma mark - 动画效果
- (void)startAnimWithBeginTime:(double)beginTime type:(kComposeButtonAnimType)type{
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //判断动画类型
    CGFloat result = -350;
    if (type == kComposeButtonAnimTypeDown) {
        result = 350;
    }
    
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.centerX, self.centerY + result)];
    //弹性
    anim.springBounciness = 10;
    //速度
    anim.springSpeed = 12;
    //开始动画时间
    anim.beginTime = beginTime;
    //添加
    [self pop_addAnimation:anim forKey:nil];
    
}



@end
