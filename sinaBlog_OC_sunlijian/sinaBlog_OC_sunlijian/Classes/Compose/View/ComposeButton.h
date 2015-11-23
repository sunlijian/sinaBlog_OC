//
//  ComposeButton.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kComposeButtonAnimTypeUp,
    kComposeButtonAnimTypeDown
} kComposeButtonAnimType;

#define kComposeButtonW 80
#define kComposeButtonH 110
@interface ComposeButton : UIButton

- (void)startAnimWithBeginTime:(double)beginTime type:(kComposeButtonAnimType)type;

@end
