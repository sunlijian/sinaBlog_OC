//
//  PublicTarBarController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PublicTarBarController.h"
#import "PublicTabBar.h"
#import "PublicNavController.h"
#import "HomeTableViewController.h"
#import "MessageTableViewController.h"
#import "DiscoverTableViewController.h"
#import "ProfileTableViewController.h"
@interface PublicTarBarController ()<PublicTabBarDelegate>

@end

@implementation PublicTarBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PublicTabBar *tabBar = [[PublicTabBar alloc]init];
    
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    //添加
    HomeTableViewController *home = [[HomeTableViewController alloc]init];
    [self addChildViewController:home imageName:@"tabbar_home" title:@"主页"];
    
    MessageTableViewController *message = [[MessageTableViewController alloc]init];
    [self addChildViewController:message imageName:@"tabbar_message_center" title:@"消息"];
    
    DiscoverTableViewController *discover = [[DiscoverTableViewController alloc]init];
    [self addChildViewController:discover imageName:@"tabbar_discover" title:@"发现"];
    
    ProfileTableViewController *profile = [[ProfileTableViewController alloc]init];
    [self addChildViewController:profile imageName:@"tabbar_profile" title:@"我"];
    
}


#pragma mark - 添加子控制器
- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName title:(NSString *)title
{
    //设置图片
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置 title
    childController.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childController.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //添加
    PublicNavController *nav = [[PublicNavController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectPlusButton:(UIButton *)plusButton{
    NSLog(@"-------");
}



@end
