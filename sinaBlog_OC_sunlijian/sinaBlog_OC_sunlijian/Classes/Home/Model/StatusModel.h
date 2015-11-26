//
//  StatusModel.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/24.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserModel;
@interface StatusModel : NSObject


//发布当前微博的人
@property (nonatomic, strong) UserModel *user;

//当前微博的内容
@property (nonatomic, copy) NSString *text;
//微博的 id
@property (nonatomic, assign) long long id;
//来源
@property (nonatomic, copy) NSString *source;
//创建时间
@property (nonatomic, copy) NSString *created_at;


//转发数
@property (nonatomic, assign) NSInteger reposts_count;
//评论数
@property (nonatomic, assign) NSInteger comments_count;
//赞
@property (nonatomic, assign) NSInteger attitudes_count;



@end
