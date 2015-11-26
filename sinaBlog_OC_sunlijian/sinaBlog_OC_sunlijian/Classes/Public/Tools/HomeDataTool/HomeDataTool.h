//
//  HomeDataTool.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
@interface HomeDataTool : NSObject

//请求个人信息
+ (void)getUserInfoWithUid:(NSString *)uid success:(void(^)(UserModel *user))success failure:(void(^)(NSError *error))failure;

//请求数据


@end
