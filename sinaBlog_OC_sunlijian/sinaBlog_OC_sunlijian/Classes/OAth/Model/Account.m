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
    self.createDate = [NSDate date];
}


#pragma mark - 归档
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.remind_in forKey:@"remind_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.createDate forKey:@"createDate"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.avatar_large forKey:@"avatar_large"];
}
#pragma mark - 解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.createDate = [aDecoder decodeObjectForKey:@"createDate"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.avatar_large = [aDecoder decodeObjectForKey:@"avatar_large"];
    }
    return self;
}


@end
