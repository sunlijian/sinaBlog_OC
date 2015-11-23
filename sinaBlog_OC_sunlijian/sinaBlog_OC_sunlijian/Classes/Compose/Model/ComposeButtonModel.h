//
//  ComposeButtonModel.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface ComposeButtonModel : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)composeButtonWithDict:(NSDictionary *)dict;

+ (NSArray *)composeButtonArray;



@end
