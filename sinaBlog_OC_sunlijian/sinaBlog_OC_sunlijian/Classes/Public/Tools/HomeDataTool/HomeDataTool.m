//
//  HomeDataTool.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "HomeDataTool.h"
#import "Account.h"
#import "AccountTool.h"
#import "UserModel.h"
#import "BaseDataTool.h"
@implementation HomeDataTool

#pragma mark - 请求个人信息

+ (void)getUserInfoWithUid:(NSString *)uid success:(void (^)(UserModel *))success failure:(void (^)(NSError *))failure{
    //接口
    NSString *urlStr = @"https://api.weibo.com/2/users/show.json";
    //参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = [AccountTool loadAccount].access_token;
    params[@"uid"] = uid;
    
    [BaseDataTool getWithUrl:urlStr params:params calzz:[UserModel class] success:success failure:failure];
}

#pragma mark - 请求数据

@end
