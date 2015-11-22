//
//  TitleButton.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "TitleButton.h"
#define MARGIN 5
@implementation TitleButton

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + MARGIN;
    
    self.width = self.titleLabel.width + self.imageView.width + MARGIN;
    self.centerX = self.superview.width * 0.5;
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [super setImage:image forState:state];
    [self sizeToFit];
}
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

@end
