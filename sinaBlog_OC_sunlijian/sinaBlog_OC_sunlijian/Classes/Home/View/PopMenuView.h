//
//  PopMenuView.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopMenuView : UIButton

- (void)showWithTitleButton:(UIButton *)button;

- (void)showWithRightButton:(UIButton *)button;

- (void)showWithMessageRightButton:(UIButton *)button;

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;

@end
