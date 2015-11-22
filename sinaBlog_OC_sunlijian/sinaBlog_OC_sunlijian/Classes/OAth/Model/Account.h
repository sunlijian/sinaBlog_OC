//
//  Acount.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString *access_token;
@property (nonatomic, copy) NSString *expires_in;
@property (nonatomic, copy) NSString *remind_in;
@property (nonatomic, copy) NSString *uid;

//当前获取 的时间
@property (nonatomic, strong) NSDate *createDate;

//用户的头像和名字
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatar_large;

@end
