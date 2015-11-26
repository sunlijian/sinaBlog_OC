//
//  NSString+category.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "NSString+category.h"

@implementation NSString (category)

- (CGSize)sizeAttributesWithFont:(UIFont *)font{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    return [self sizeWithAttributes:dict];
}

- (CGSize)sizeWithFont:(UIFont *)font{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    return [self sizeWithAttributes:dict];
}

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = font;
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

@end
