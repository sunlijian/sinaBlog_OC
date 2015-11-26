//
//  NSString+category.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (category)

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGSize)sizeAttributesWithFont:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
