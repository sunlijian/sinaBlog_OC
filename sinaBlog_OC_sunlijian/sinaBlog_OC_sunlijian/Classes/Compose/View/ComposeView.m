//
//  ComposeView.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "ComposeView.h"
#import "UIImage+ImageEffects.h"
#import "ComposeButtonModel.h"
#import "ComposeButton.h"
#import "ComposeController.h"
#import "PublicNavController.h"
@interface ComposeView ()

@property (nonatomic, weak)UIViewController *controller;

@property (nonatomic, strong) NSArray *buttonModels;

@property (nonatomic, strong) NSMutableArray *buttons;

@property (nonatomic, weak) UIImageView *slogImage;

@end

@implementation ComposeView

- (instancetype)initWithTarget:(UIViewController *)controller{
    if (self = [super init]) {
        self.size = CGSizeMake(SCREEN_W, SCREEN_H);
        //获取 当前屏幕的磨砂效果
        UIImage *image = [self currentScreenImage];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        
        //添加顶部 logo
        UIImageView *slognImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"compose_slogan"]];
        slognImage.centerX = self.width * 0.5;
        slognImage.y = 100;
        self.slogImage = slognImage;
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
        button.y = (rowIndex + 1)*margin + rowIndex * kComposeButtonH + SCREEN_H;
        //设置图片和字体
        ComposeButtonModel *model = self.buttonModels[i];
        [button setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
        [button setTitle:model.title forState:UIControlStateNormal];
        //添加监听事件
        [button addTarget:self action:@selector(clickComposeButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttons addObject:button];
        [self addSubview:button];
    }
}
#pragma mark - button 点击事件
- (void)clickComposeButton:(ComposeButton *)button{
    [UIView animateWithDuration:0.25 animations:^{
//        //
        self.slogImage.alpha = 0.1;
        [self.buttons enumerateObjectsUsingBlock:^(ComposeButton * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (button == obj) {
                obj.transform = CGAffineTransformMakeScale(2, 2);
                obj.alpha = 0.1;
            }else{
                obj.transform = CGAffineTransformMakeScale(0.5, 0.5);
                obj.alpha = 0.1;
            }
        }];
    } completion:^(BOOL finished) {
        //
        ComposeController *Vc = [[ComposeController alloc]init];
        
        [self.controller presentViewController:[[PublicNavController alloc]initWithRootViewController:Vc] animated:YES completion:nil];
    }];
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
    
    //遍历数组 给每一个 button 添加动画
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //
        [obj startAnimWithBeginTime:CACurrentMediaTime() + idx * 0.025 type:kComposeButtonAnimTypeUp];
    }];
}
#pragma mark - 消失动画
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //数据反转一下
    NSArray *reversButtons = [self.buttons reverseObjectEnumerator].allObjects;
    //动画
    [reversButtons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj startAnimWithBeginTime:CACurrentMediaTime() + idx * 0.025 type:kComposeButtonAnimTypeDown];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            //
            self.alpha = 0;
        } completion:^(BOOL finished) {
            //
            [self removeFromSuperview];
        }];
    });
    
}

@end
