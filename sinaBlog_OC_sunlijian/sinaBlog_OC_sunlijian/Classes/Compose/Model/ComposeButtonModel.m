//
//  ComposeButtonModel.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "ComposeButtonModel.h"

@implementation ComposeButtonModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
    }
    return self;
}

+ (instancetype)composeButtonWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

+ (NSArray *)composeButtonArray{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"compose.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dict = array[i];
        ComposeButtonModel *model = [ComposeButtonModel composeButtonWithDict:dict];
        [arrayM addObject:model];
    }
    return arrayM;
}


@end
