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
#import "AccountTool.h"
#import "Account.h"
#import "AFNetworking.h"
#import "HomeDataTool.h"
#import "AccountTool.h"
#import "UserModel.h"
@interface HomeTableViewController ()

@property (nonatomic, weak)UIButton *currentButton;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航
    [self setNav];
    //获取个人信息
    [self loadUserInfo];
    //加载数据
//    [self loadData];
}

#pragma mark - 获取个人信息
- (void)loadUserInfo{
    [HomeDataTool getUserInfoWithUid:[AccountTool loadAccount].uid success:^(UserModel *user) {
        //
        NSString *screen_name = user.screen_name;
        //保存昵称
        [UserDefaults setObject:screen_name forKey:@"screen_name"];
        [UserDefaults synchronize];
        //给 titleButton 赋值
        UIButton *titleBtn = (UIButton *)self.navigationItem.titleView;
        [titleBtn setTitle:screen_name forState:UIControlStateNormal];
    } failure:^(NSError *error) {
        //
        NSLog(@"请求失败: %@", error);
    }];
}


#pragma mark - 请求数据
- (void)loadData{
    //接口
    NSString *urlString = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    //参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [AccountTool loadAccount].access_token;
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    [mgr GET:urlString parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
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
