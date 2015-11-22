//
//  Acount.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "Account.h"

@implementation Account


#pragma mark - 获取当前的时间
- (void)setAccess_token:(NSString *)access_token{
    _access_token = access_token;
    _createDate = [NSDate date];
}


#pragma mark - 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:_expires_in forKey:@"expires_in"];
    [aCoder encodeObject:_remind_in forKey:@"remind_in"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_createDate forKey:@"createDate"];
}
#pragma mark - 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        _remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _createDate = [aDecoder decodeObjectForKey:@"createDate"];
    }
    return self;
}


@end
