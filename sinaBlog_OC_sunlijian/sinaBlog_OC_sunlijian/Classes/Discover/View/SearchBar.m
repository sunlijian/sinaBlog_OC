//
//  SearchBar.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/23.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "SearchBar.h"

@interface SearchBar ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cons;

@end

@implementation SearchBar


#pragma mark - 加载
+ (instancetype)loadSearchBar{
    return [[[NSBundle mainBundle] loadNibNamed:@"SearchView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib{
    //图标
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    leftView.contentMode = UIViewContentModeCenter;
    leftView.width = self.height;
    leftView.height = self.height;
    self.textField.leftView = leftView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.delegate = self;
}
#pragma mark - 点击取消按钮的时候
- (IBAction)didClickCancelButton:(id)sender {
    self.cons.constant = 0;
    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    }];
    [self.textField endEditing:YES];
}

#pragma mark - textField的代理 方法
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.cons.constant = self.cancelButton.width + 5;
    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
