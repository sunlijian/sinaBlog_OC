//
//  ComposeButton.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "ComposeButton.h"

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

@end
