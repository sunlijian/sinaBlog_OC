//
//  AccountTool.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "AccountTool.h"
#import "Account.h"
#define ACCOUNT_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archiver"]
@implementation AccountTool


#pragma mark - 归档保存
+ (void)saveAccount:(Account *)account{
    [NSKeyedArchiver archiveRootObject:account toFile:ACCOUNT_PATH];
}

#pragma mark - 解档
+ (Account *)loadAccount{
    Account *account = [NSKeyedUnarchiver unarchiveObjectWithFile:ACCOUNT_PATH];
    if (!account) {
        return nil;
    }
    //判断用户是否过期
    NSDate *date = [account.createDate dateByAddingTimeInterval:[account.expires_in integerValue]];
    //当前时间
    NSDate *currentDate = [NSDate date];
    
    if ([currentDate compare:date] != NSOrderedAscending) {
        return nil;
    }
    
    return account;
}

@end
