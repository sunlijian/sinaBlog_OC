//
//  PopMenuView.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PopMenuView.h"
#import "PopViewController.h"


@interface PopMenuView ()

{
    PopViewController *_controller;
}

@property (nonatomic, weak)UIImageView *bgImageView;

@property (nonatomic, weak)UIButton *button;

@property (nonatomic, strong)UITableView *customView;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation PopMenuView


- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName{
    if (self = [super initWithFrame:frame]) {
        self.size = [UIScreen mainScreen].bounds.size;
        
        [self addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *backgroundImage = [UIImage imageNamed:imageName];
        backgroundImage = [backgroundImage stretchableImageWithLeftCapWidth:backgroundImage.size.width * 0.5 topCapHeight:backgroundImage.size.height * 0.5];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.image = backgroundImage;
        
        imageView.userInteractionEnabled = YES;
        imageView.size = CGSizeMake(frame.size.width + 10, frame.size.height + 20);
        
        PopViewController *controller = [[PopViewController alloc]init];
        _controller = controller;
        
        _controller.view.frame = frame;
        _controller.view.backgroundColor = [UIColor clearColor];
        
        [imageView addSubview:_controller.view];
        
        self.bgImageView = imageView;
        
        [self addSubview:imageView];
        
    }
    return self;
}

- (void)showWithTitleButton:(UIButton *)button{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    
    CGRect rect = [button convertRect:button.bounds toView:window];
    
    self.bgImageView.centerX = CGRectGetMidX(rect);
    
    self.bgImageView.y = CGRectGetMaxY(rect) - 7;
    
    [window addSubview:self];
    
    self.button = button;
    
    _controller.type = kTitleButton;
}

- (void)showWithRightButton:(UIButton *)button{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    CGRect rect = [button convertRect:button.bounds toView:window];
    
    self.bgImageView.x = CGRectGetMaxX(rect) - self.bgImageView.width + 5;
    
    [window addSubview:self];
    
    self.bgImageView.y = CGRectGetMaxY(rect) - 7;
    
    _controller.type = kRightButton;
}

- (void)showWithMessageRightButton:(UIButton *)button{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    CGRect rect = [button convertRect:button.bounds toView:window];
    
    self.bgImageView.x = CGRectGetMaxX(rect) - self.bgImageView.width + 5;
    
    [window addSubview:self];
    
    self.bgImageView.y = CGRectGetMaxY(rect) - 7;
    
    _controller.type = kMessageRightButton;
}

- (void)dismiss{
    
    self.button.selected = NO;
    
    [self removeFromSuperview];
}




@end
