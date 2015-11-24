//
//  HttpTool.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"

@implementation HttpTool


#pragma mark - 请求个人信息
+ (void)getWithUrl:(NSString *)urlString params:(NSMutableDictionary *)params success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //
        if (success) {
            NSLog(@"%@", responseObject);
            success(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        //
        if (failure) {
            failure(error);
        }
    }];
}

@end
