//
//  PublicTabBarItem.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "PublicTabBarItem.h"
#import "PublicTarBarController.h"
#import <objc/runtime.h>

@implementation PublicTabBarItem

#pragma mark - 重定 badgeValue 的set方法
- (void)setBadgeValue:(NSString *)badgeValue{
    [super setBadgeValue:badgeValue];
    
    
    if (!badgeValue) {
        return;
    }
    //拿到对应的 UITabBarController
    UITabBarController *target = [self valueForKeyPath:@"_target"];
    //进行遍历
    for (UIView *tabBarButton in target.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITarBarButton")]) {
            for (UIView *badgeView in tabBarButton.subviews) {
                if ([badgeView isKindOfClass:NSClassFromString(@"_UIBageView")]) {
                    for (UIView *badgeBackground in badgeView.subviews) {
                        if ([badgeBackground isKindOfClass:NSClassFromString(@"_UIBadgeBackground")]) {
                            //拿到后 获取身上的成员变量
                            unsigned int count;
                            Ivar *vars = class_copyIvarList(NSClassFromString(@"_UIBadgeBackground"), &count);
                            for (int i = 0; i < count; i ++) {
                                Ivar var = vars[i];
                                //获取成员名字
                                NSString *name = [NSString stringWithCString:ivar_getName(var) encoding:NSUTF8StringEncoding];
                                //获取成员类型
//                                NSString *type = [NSString stringWithCString:ivar_getTypeEncoding(var) encoding:NSUTF8StringEncoding];
                                if ([name isEqualToString:@"_image"]) {
                                    //KVC 赋值
                                    [badgeBackground setValue:[UIImage imageNamed:@"main_badgeValue"] forKeyPath:name];
                                }
                            }
                            //释放内存
                            free(vars);
                        }
                    }
                }
            }
        }
    }
}














@end
