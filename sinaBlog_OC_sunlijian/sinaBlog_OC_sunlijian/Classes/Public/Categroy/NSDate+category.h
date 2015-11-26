//
//  NSDate+category.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (category)

//是否是今年
- (BOOL)isThisYearWithDate:(NSDate *)date;
//是否是今天
- (BOOL)isThisTodayWithDate:(NSDate *)date;
//是否是昨天
- (BOOL)isYesterdayWithDate:(NSDate *)date;



@end
