//
//  UserModel.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

//头像
@property (nonatomic, copy) NSString *profile_image_url;
//昵称
@property (nonatomic, copy) NSString *screen_name;
//会员等级
@property (nonatomic, assign) NSInteger mbrank;
//会员类型
@property (nonatomic, assign) NSInteger mbtype;

@property (nonatomic, copy) NSString *name;

//是否是会员
@property (nonatomic, assign) BOOL isVip;

@end
