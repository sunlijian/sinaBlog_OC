//
//  PopViewController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PopViewController.h"
#import "PopTableViewCell.h"
@interface PopViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSMutableArray *array;

@end

@implementation PopViewController

- (NSMutableArray *)array{
    if (!_array) {
        if (_type == kTitleButton) {
            _array = [NSMutableArray arrayWithObjects:@"首页", @"好友圈", @"群微博", @"我的微博", @"特别关注", @"数码", @"政府",@"政治", @"本地生活", @"游泳",@"名人明星",@"同事", @"同学", @"悄悄关注",@"周边微博", nil];
        }
        if (_type == kRightButton) {
            _array = [NSMutableArray arrayWithObjects:@"雷达",@"扫一扫", nil];
        }
        if (_type == kMessageRightButton) {
            _array = [NSMutableArray arrayWithObjects:@"发起聊天",@"私密聊天", nil];
        }
        
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (PopTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[PopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}



@end
