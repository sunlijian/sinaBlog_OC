//
//  StatusFrameModel.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/26.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "StatusFrameModel.h"
#import "StatusModel.h"
#import "UserModel.h"
#import "NSString+category.h"
#define HeadImageWH 35
#define MARGIN 10
@implementation StatusFrameModel


- (void)setStatus:(StatusModel *)status {
    _status = status;
    
    //头像
    CGFloat headImageX = MARGIN;
    CGFloat headImageY = MARGIN;
    _headImageF = CGRectMake(headImageX, headImageY, HeadImageWH, HeadImageWH);
    
    //昵称
    CGFloat nameLabelX = CGRectGetMaxX(_headImageF) + MARGIN;
    CGFloat nameLabelY = MARGIN;
    CGSize nameLabelSize = [status.user.screen_name sizeAttributesWithFont:[UIFont systemFontOfSize:NAME_FONT_SIZE]];
    _nameLabelF = (CGRect){{nameLabelX, nameLabelY},nameLabelSize};
    
    //会员
    if (status.user.isVip) {
        CGFloat vipImageX = CGRectGetMaxX(_nameLabelF) + MARGIN;
        CGFloat vipImageY = nameLabelY;
        CGSize vipImageSize = CGSizeMake(_nameLabelF.size.height, _nameLabelF.size.height);
        _vipImageF = (CGRect){{vipImageX, vipImageY}, vipImageSize};
    }
    //创建时间
    CGFloat timeLabelX = nameLabelX;
    CGSize timeLabelSize = [status.created_at sizeAttributesWithFont:[UIFont systemFontOfSize:CREATETIME_FONT_SIZE]];
    CGFloat timeLabelY = CGRectGetMaxY(_headImageF) - timeLabelSize.height;
    _timeLabelF = (CGRect){{timeLabelX,timeLabelY}, timeLabelSize};
}


@end
