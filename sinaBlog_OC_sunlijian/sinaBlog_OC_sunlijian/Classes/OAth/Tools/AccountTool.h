//
//  AccountTool.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface AccountTool : NSObject

//保存信息
+ (void)saveAccount:(Account *)account;

@end
