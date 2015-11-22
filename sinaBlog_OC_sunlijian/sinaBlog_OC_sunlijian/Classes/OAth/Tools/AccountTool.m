//
//  AccountTool.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "AccountTool.h"
#define ACCOUNT_PATH [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archiver"]
@implementation AccountTool

#pragma mark - 归档保存
+ (void)saveAccount:(Account *)account{
    [NSKeyedArchiver archiveRootObject:account toFile:ACCOUNT_PATH];
}



@end
