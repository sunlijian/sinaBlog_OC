//
//  HomeTableViewCell.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/24.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "StatusFrameModel.h"
#import "StatusModel.h"
#import "UIImageView+WebCache.h"
#import "UserModel.h"
#import "NSString+category.h"
@interface HomeTableViewCell ()

@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *vipImage;
@property (nonatomic, strong) UILabel *createdTimeLabel;

@end


@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.headImage];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.vipImage];
        [self.contentView addSubview:self.createdTimeLabel];
    }
    return self;
}

- (void)setStatusFrame:(StatusFrameModel *)statusFrame{
    _statusFrame = statusFrame;
    StatusModel *status = statusFrame.status;
    
    //头像
    self.headImage.frame = statusFrame.headImageF;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:status.user.profile_image_url] placeholderImage:[UIImage imageNamed:@""]];
    //昵称
    self.nameLabel.frame = statusFrame.nameLabelF;
    self.nameLabel.text = status.user.screen_name;
    //会员
    if (status.user.isVip) {
        self.vipImage.hidden = NO;
        self.vipImage.frame = statusFrame.vipImageF;
        self.vipImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"common_icon_membership_level%zd",status.user.mbrank]];
    }else{
        self.vipImage.hidden = YES;
    }
    //创建时间
    self.createdTimeLabel.frame = statusFrame.timeLabelF;
    self.createdTimeLabel.text = status.created_at;
    self.createdTimeLabel.width = [self.createdTimeLabel.text sizeAttributesWithFont:[UIFont systemFontOfSize:CREATETIME_FONT_SIZE]].width;
}

- (UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
    }
    return _headImage;
}
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:NAME_FONT_SIZE];
    }
    return _nameLabel;
}
- (UIImageView *)vipImage{
    if (!_vipImage) {
        _vipImage = [[UIImageView alloc]init];
    }
    return _vipImage;
}
- (UILabel *)createdTimeLabel{
    if (!_createdTimeLabel) {
        _createdTimeLabel = [[UILabel alloc]init];
        _createdTimeLabel.font = [UIFont systemFontOfSize:CREATETIME_FONT_SIZE];
    }
    return _createdTimeLabel;
}

@end
