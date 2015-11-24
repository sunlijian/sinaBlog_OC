//
//  BaseDataTool.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataTool : NSObject

//字典转模型工具类
+ (void)getWithUrl:(NSString *)url params:(NSMutableDictionary *)params calzz:(Class)calzz success:(void(^)(id responseModel))success failure:(void(^)(NSError *error))failure;

@end
