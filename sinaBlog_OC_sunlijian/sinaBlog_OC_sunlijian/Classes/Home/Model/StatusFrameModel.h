//
//  StatusFrameModel.h
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StatusModel;
#define NAME_FONT_SIZE 14
#define CREATETIME_FONT_SIZE 12
@interface StatusFrameModel : NSObject

@property (nonatomic, strong) StatusModel *status;

//头像
@property (nonatomic, assign) CGRect headImageF;
//昵称
@property (nonatomic, assign) CGRect nameLabelF;
//会员
@property (nonatomic, assign) CGRect vipImageF;
//时间
@property (nonatomic, assign) CGRect timeLabelF;
//来源
@property (nonatomic, assign) CGRect sourceLabelF;
//原创的字体内容
@property (nonatomic, assign) CGRect contentLabelF;
//配图的大小
@property (nonatomic, assign) CGRect originalImageF;
//工具条的大小
@property (nonatomic, assign) CGRect toolBarF;
//原创微博整体的大小
@property (nonatomic, assign) CGRect originalViewF;

//转发微博的内容
@property (nonatomic, assign) CGRect retweetContentLabelF;
//转发微博的图片大小
@property (nonatomic, assign) CGRect retweetImageF;
//转发微博整体的 View
@property (nonatomic, assign) CGRect retweetViewF;

//整个 cell 的高度
@property (nonatomic, assign) CGFloat cellHeight;

@end
