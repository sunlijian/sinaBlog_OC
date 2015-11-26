//
//  UserModel.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "UserModel.h"
@implementation UserModel

//是否是会员
- (void)setMbtype:(NSInteger)mbtype{
    _mbtype = mbtype;
    self.isVip = mbtype >= 2;
}

@end
