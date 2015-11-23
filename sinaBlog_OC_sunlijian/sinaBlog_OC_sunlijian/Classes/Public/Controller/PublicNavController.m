//
//  PublicNavController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PublicNavController.h"

@interface PublicNavController ()

@end

@implementation PublicNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    //子控制器的数量
    NSInteger count = self.viewControllers.count;
    
    NSString *title = @"返回";
    
    //设置 item
    if (count >= 1) {
        if (count == 1) {
//            title = [self.viewControllers firstObject].title;
        }
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back_withtext" title:title target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
