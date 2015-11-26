//
//  StatusModel.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/24.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "StatusModel.h"
#import "UserModel.h"
#import "MJExtension.h"
#import "NSDate+category.h"
@implementation StatusModel

#pragma mark - user转换
- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"user"]) {
        NSLog(@"%@", key);
        self.user = [[[UserModel alloc]init] mj_setKeyValues:value];
    }
}

#pragma mark - 创建时间和处理
- (NSString *)created_at{
    //创建的时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss z yyyy";    //    Sat Oct 17 11:35:32 +0800 2015
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    //创建的时间
    NSDate *createdDate = [formatter dateFromString:_created_at];
    NSDate *currentDate = [NSDate date];
    //时间处理
    NSString *dateString;
    if ([createdDate isThisYearWithDate:createdDate]) {
        
        if ([createdDate isThisTodayWithDate:createdDate]){
            
            NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:createdDate];
            
            if (timeInterval < 60) {
                dateString = @"刚刚";
            }else if (timeInterval < 60 * 60){
                dateString = [NSString stringWithFormat:@"%d分钟前",(int)timeInterval/60];
            }else{
                dateString = [NSString stringWithFormat:@"%d小时前", (int)timeInterval/(60 * 60)];
            }
        }else if ([createdDate isYesterdayWithDate:createdDate]){
            formatter.dateFormat = @"昨天 HH:mm";
            dateString = [formatter stringFromDate:createdDate];
        }else{
           formatter.dateFormat = @"MM-dd";
            dateString = [formatter stringFromDate:createdDate];
        }
    }else{
        formatter.dateFormat = @"yyyy-MM-dd";
        dateString = [formatter stringFromDate:createdDate];
    }
    return dateString;
}


@end
