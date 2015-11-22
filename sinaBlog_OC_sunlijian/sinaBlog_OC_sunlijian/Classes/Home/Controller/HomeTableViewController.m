//
//  HomeTableViewController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "HomeTableViewController.h"
#import "TempTableViewController.h"
#import "TitleButton.h"
#import "PopMenuView.h"

@interface HomeTableViewController ()

@property (nonatomic, weak)UIButton *currentButton;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航
    [self setNav];
}
#pragma mark - 设置导航
- (void)setNav{
    //左边
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" target:self action:@selector(clickLeftButtonItem)];
    
    //右边
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" target:self action:@selector(clickRightButtonItem:)];

    
    //设置 titleview
    TitleButton *button = [[TitleButton alloc]init];
    //设置图片
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    //设置字体
    [button setTitle:@"我的呢称" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor redColor]];
    //大小
    [button sizeToFit];
    
    //添加监听事件
    [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    
    self.navigationItem.titleView = button;
}
#pragma mark - titleButton的监听事件
- (void)titleButtonClick:(UIButton *)button{
    button.selected = !button.selected;
    
    PopMenuView *popView = [[PopMenuView alloc]initWithFrame:CGRectMake(5, 10, 200, 400) imageName:@"popover_background"];
    
    [popView showWithTitleButton:button];
}


#pragma mark - leftBarButtonItem  rightBarButtonItem点击事件
- (void)clickLeftButtonItem{
    
    TempTableViewController *temp = [[TempTableViewController alloc]init];
    
    [self.navigationController pushViewController:temp animated:YES];
}
- (void)clickRightButtonItem:(UIButton *)button{
    PopMenuView *popView = [[PopMenuView alloc]initWithFrame:CGRectMake(5, 10, 100, 80) imageName:@"popover_background_right"];
    
    [popView showWithRightButton:button];
}


@end
