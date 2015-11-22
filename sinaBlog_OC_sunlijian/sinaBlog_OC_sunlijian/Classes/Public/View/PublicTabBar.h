//
//  PublicTabBar.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PublicTabBar;
@protocol PublicTabBarDelegate <NSObject,UITabBarDelegate>

- (void)tabBar:(UITabBar *)tabBar didSelectPlusButton:(UIButton *)plusButton;

@end

@interface PublicTabBar : UITabBar

@property (nonatomic, weak)id <PublicTabBarDelegate> delegate;

@end
