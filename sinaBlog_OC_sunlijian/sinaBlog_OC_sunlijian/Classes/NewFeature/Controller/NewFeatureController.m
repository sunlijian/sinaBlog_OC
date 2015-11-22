//
//  NewFeatureController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "NewFeatureController.h"
#import "AppDelegate.h"
#define kButtonMargin 10
@interface NewFeatureController ()<UIScrollViewDelegate>

{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@end

@implementation NewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    //设置 scrollView
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    //添加图片
    NSInteger imageCount = 4;
    for (int i = 0; i < imageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]]];
        imageView.size = _scrollView.size;
        imageView.x = i * _scrollView.width;
        
        if (i == imageCount - 1) {
            //设置最后一页
            [self setUpLastPageWithView: imageView];
        }
        
        [_scrollView addSubview:imageView];
    }
    //设置 scrollView的大小
    _scrollView.contentSize = CGSizeMake(_scrollView.width * imageCount, 0);
    
    [self.view addSubview:_scrollView];
    
    //设置 pageController
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = imageCount;
    //设置颜色
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.centerX = _scrollView.width * 0.5;
    _pageControl.y = SCREEN_H * 0.9;
    [self.view addSubview:_pageControl];
    
}
#pragma mark - 设置最后一页的 button
- (void)setUpLastPageWithView:(UIImageView *)imageView{
    
    imageView.userInteractionEnabled = YES;
    //进入微博 button
    UIButton *enterButton = [[UIButton alloc]init];
    //图片
    [enterButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [enterButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    enterButton.size = enterButton.currentBackgroundImage.size;
    //字体
    [enterButton setTitle:@"进入微博" forState:UIControlStateNormal];
    //位置
    enterButton.centerX = imageView.width * 0.5;
    enterButton.y = imageView.height - 150;
    //添加监听事件
    [enterButton addTarget:self action:@selector(clickEnterButton) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:enterButton];
    
    //分享的 button
    UIButton *shareButton = [[UIButton alloc]init];
    //图片
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    //字体
    [shareButton setTitle:@" 分享到微博" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //大小
    [shareButton sizeToFit];
    shareButton.centerX = imageView.width * 0.5 - 5;
    shareButton.y = enterButton.y - 40;
    //添加监听事件
    [shareButton addTarget:self action:@selector(clickShareButton:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareButton];
}

#pragma mark - button 的点击
- (void)clickEnterButton{
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    UIWindow *window = appdelegate.window;
    window.rootViewController = [appdelegate switchController];
}
- (void)clickShareButton:(UIButton *)button{
    button.selected = !button.selected;
}


#pragma mark - 设置 pageControll 的滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = round(_scrollView.contentOffset.x / _scrollView.width);
    _pageControl.currentPage = page;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
