//
//  WelcomController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "WelcomController.h"

#import "UIImageView+webCache.h"
#import "AccountTool.h"
#import "Account.h"
#import "AppDelegate.h"
#import "PublicTarBarController.h"
@interface WelcomController ()

@property (nonatomic, strong) UIImageView *iconImage;

@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation WelcomController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    //设置头象
    [self.view addSubview:self.iconImage];
    //设置名字
    [self.view addSubview:self.nameLabel];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - 动画效果
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //起始位置
    self.iconImage.centerX = SCREEN_W * 0.5;
    self.iconImage.y = 200;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionTransitionNone animations:^{
        //
        self.iconImage.y = 100;
    } completion:^(BOOL finished) {
        //执行完毕 位置
        self.nameLabel.centerX = self.iconImage.centerX;
        self.nameLabel.y = CGRectGetMaxY(self.iconImage.frame) + 5;
        //透明度
        self.nameLabel.alpha = 0;
        self.nameLabel.hidden = NO;
        
        [UIView animateWithDuration:1 animations:^{
            //
            self.nameLabel.alpha = 1;
        } completion:^(BOOL finished) {
            //跳转
            [self performSelector:@selector(toHome) withObject:nil afterDelay:1];
        }];
        
    }];
    
}
#pragma mark - 跳转控制器
- (void)toHome{
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    UIWindow *window = appdelegate.window;
    window.rootViewController = [[PublicTarBarController alloc]init];
}


#pragma mark - 设置头像
- (UIImageView *)iconImage{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
        _iconImage.size = CGSizeMake(90, 90);
        //圆角
        _iconImage.layer.cornerRadius = _iconImage.height * 0.5;
        _iconImage.layer.masksToBounds = YES;
        //圆角线
        _iconImage.layer.borderWidth = 2;
        _iconImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
        //加载图片
        
        NSString *urlStr = [AccountTool loadAccount].avatar_large;
        NSURL *url = [NSURL URLWithString:urlStr];
        [_iconImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"avatar_default_big"]];
    }
    return _iconImage;
}
#pragma mark - 设置名字
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"欢迎回来";
        _nameLabel.textColor = [UIColor blackColor];
        _nameLabel.font = [UIFont systemFontOfSize:15];
        [_nameLabel sizeToFit];
        _nameLabel.hidden = YES;
    }
    return _nameLabel;
}

@end
