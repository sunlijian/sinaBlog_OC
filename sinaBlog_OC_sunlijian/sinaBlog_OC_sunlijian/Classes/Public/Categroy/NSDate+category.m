//
//  NSDate+category.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "NSDate+category.h"

@implementation NSDate (category)

#pragma mark - 是否是今年
- (BOOL)isThisYearWithDate:(NSDate *)date{
    //当前时间
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy";
    //取出字符串
    NSString *currentStr = [formatter stringFromDate:currentDate];
    NSString *dateStr = [formatter stringFromDate:date];

    return [currentStr isEqualToString:dateStr];
}

#pragma mark - 是否是今天
- (BOOL)isThisTodayWithDate:(NSDate *)date{
    //当前时间
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    //取出字符串
    NSString *currentStr = [formatter stringFromDate:currentDate];
    NSString *dateStr = [formatter stringFromDate:date];
    
    return [currentStr isEqualToString:dateStr];
}

#pragma mark - 是否是昨天
- (BOOL)isYesterdayWithDate:(NSDate *)date{
    //当前时间
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    //取出字符串
    NSString *currentStr = [formatter stringFromDate:currentDate];
    NSString *dateStr = [formatter stringFromDate:date];
    
    //转换成date
    NSDate *currentStrDate = [formatter dateFromString:currentStr];
    NSDate *dateStrDate = [formatter dateFromString:dateStr];
    
    NSTimeInterval timeInterval = [currentStrDate timeIntervalSinceDate:dateStrDate];
    
    if (timeInterval == 24 * 60 * 60) {
        return YES;
    }
    return NO;
}

@end
