//
//  ComposeView.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "ComposeView.h"
#import "POP.h"
#import "UIImage+ImageEffects.h"
#import "ComposeButtonModel.h"
#import "ComposeButton.h"


@interface ComposeView ()

@property (nonatomic, weak)UIViewController *controller;

@property (nonatomic, strong) NSArray *buttonModels;

@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation ComposeView

- (instancetype)initWithTarget:(UIViewController *)controller{
    if (self = [super init]) {
        self.size = CGSizeMake(SCREEN_W, SCREEN_H);
        //获取 当前屏幕的磨砂效果
        UIImage *image = [self currentScreenImage];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:imageView];
        
        //添加顶部 logo
        UIImageView *slognImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
        slognImage.centerX = self.width * 0.5;
        slognImage.y = 100;
        [self addSubview:slognImage];
        
        //添加 button
        [self addMenuButtons];
        
        self.controller = controller;
    }
    
    return self;
}

#pragma mark - 截取屏图片
- (UIImage *)currentScreenImage{
    //取出 window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    //开启截图
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(SCREEN_W, SCREEN_H), NO, 1);
    
    [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:NO];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    image = [image applyLightEffect];
    
    //关闭
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 添加 button
- (void)addMenuButtons{
    //button 的数量
    NSInteger count = self.buttonModels.count;
    //最大列数
    NSInteger maxCol = 3;
    //间距
    CGFloat margin = (SCREEN_W - 3 * kComposeButtonW)/ (maxCol + 1);
    
    for (int i = 0; i < count; i ++) {
        ComposeButton *button = [[ComposeButton alloc]init];
        int rowIndex = i / maxCol;
        int colIndex = i % maxCol;
        //设置位置
        button.x = (colIndex + 1)*margin + colIndex * kComposeButtonW;
        button.y = (rowIndex + 1)*margin + rowIndex * kComposeButtonH;
        //设置图片和字体
        ComposeButtonModel *model = self.buttonModels[i];
        [button setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
        [button setTitle:model.title forState:UIControlStateNormal];
        [self.buttons addObject:button];
        [self addSubview:button];
    }
}
#pragma mark - 懒加载
- (NSArray *)buttonModels{
    if (!_buttonModels) {
        _buttonModels = [ComposeButtonModel composeButtonArray];
    }
    return _buttonModels;
}
- (NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

#pragma mark - 添加动画
- (void)startAnimation{
    [self.controller.view addSubview:self];
}

@end
