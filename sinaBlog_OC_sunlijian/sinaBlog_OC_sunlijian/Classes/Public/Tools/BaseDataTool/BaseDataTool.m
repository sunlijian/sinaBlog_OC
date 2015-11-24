//
//  BaseDataTool.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "BaseDataTool.h"
#import "HttpTool.h"
#import "MJExtension.h"
@implementation BaseDataTool

//字典转模型
+ (void)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params calzz:(Class)calzz success:(void (^)(id responseModel))success failure:(void (^)(NSError *error))failure{
    [HttpTool getWithUrl:url params:params success:^(id responseObject) {
        //
        if (success) {
            id result = [[calzz alloc]init];
            [result mj_setKeyValues:responseObject];
            success(result);
        }
    } failure:^(NSError *error) {
        //
        if (failure) {
            failure(error);
        }
    }];
}

@end
