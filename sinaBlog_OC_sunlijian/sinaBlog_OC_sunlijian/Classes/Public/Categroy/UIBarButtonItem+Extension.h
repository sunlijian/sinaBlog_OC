//
//  UIBarButtonItem+Extension.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

//设置导航控制器 上的按钮
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action
;



@end
