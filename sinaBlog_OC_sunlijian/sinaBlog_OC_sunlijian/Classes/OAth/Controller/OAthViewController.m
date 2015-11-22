//
//  OAthViewController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "OAthViewController.h"

/*
 App Key：1406639177
 App Secret：afb3c27002f5992323d305c5318c78fd
 
 //请求
 https://api.weibo.com/oauth2/authorize?client_id=123050457758183&redirect_uri=http://www.example.com/response&response_type=code
 
 //同意授权后会重定向
 http://www.example.com/response&code=CODE
 
*/


#define REDIRECT_URL @"http://www.baidu.com"
#define CLIENT_ID @"1406639177"
@interface OAthViewController ()<UIWebViewDelegate>

@end

@implementation OAthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置 webView
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    self.view = webView;
    //请求官网登陆网页
    NSString *string = [NSString stringWithFormat:@" https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",REDIRECT_URL, CLIENT_ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}


#pragma mark - 请求时执行的代理
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //获取请求的url
    NSString *urlStr = request.URL.absoluteString;
    //判断是否回调成功 并返回 no 截取 code
    if ([urlStr hasPrefix:REDIRECT_URL]) {
        NSRange range = [urlStr rangeOfString:@"code="];
        //截取
        NSString *code = [urlStr substringFromIndex:range.location + range.length];
        //获取 accessToken
        [self getAccessTokenWithCode:code];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - 获取 accessToken
- (void)getAccessTokenWithCode:(NSString *)code{
    
}





@end
