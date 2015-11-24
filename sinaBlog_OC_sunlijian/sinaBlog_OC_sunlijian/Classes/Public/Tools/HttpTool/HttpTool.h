//
//  HttpTool.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

+ (void)getWithUrl:(NSString *)urlString params:(NSMutableDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

@end
