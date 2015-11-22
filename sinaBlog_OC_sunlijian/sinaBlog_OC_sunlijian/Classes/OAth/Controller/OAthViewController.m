//
//  OAthViewController.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/22.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "OAthViewController.h"//;

#import "AFNetworking.h"
#import "Account.h"
#import "AccountTool.h"
#import "PublicTarBarController.h"
#import "AppDelegate.h"
#import "WelcomController.h"
#import "SVProgressHUD.h"
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
#define CLIENT_SECRET @"afb3c27002f5992323d305c5318c78fd"
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
    NSString *string = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",CLIENT_ID, REDIRECT_URL];
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
    //获取 http 请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //请求地址
    NSString *urlStr = @"https://api.weibo.com/oauth2/access_token";
    //拼接参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = CLIENT_ID;
    params[@"client_secret"] = CLIENT_SECRET;
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = REDIRECT_URL;
    
    //给返回数据的解析器添加一个类型
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    
    [mgr POST:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //
//        NSLog(@"%@", responseObject);
        /*
         "access_token" = "2.00ZVSNCDfGHMXBe9a861e0edHJu78C";
         "expires_in" = 157679999;
         "remind_in" = 157679999;
         uid = 2781120581;
         */
        //字典转模型
        Account *account = [[Account alloc]init];
        [account setValuesForKeysWithDictionary:responseObject];
        //保存账号信息前获取个人信息
        [self loadUserInfoWithAccount: account];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - 获取个人信息
- (void)loadUserInfoWithAccount:(Account *)account{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //请求地址
    NSString *urlStr = @"https://api.weibo.com/2/users/show.json";
    //参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    //开始请求
    [mgr GET:urlStr parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        //
        NSLog(@"%@", responseObject);
        account.name = responseObject[@"name"];
        account.avatar_large = responseObject[@"avatar_large"];
        //保存帐号信息
        [AccountTool saveAccount:account];
        //成功弹窗
        [SVProgressHUD dismiss];
        //跳到欢迎页
        WelcomController *welcomVC = [[WelcomController alloc]init];
        //设置为根控制器
        AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
        UIWindow *window = appdelegate.window;
        window.rootViewController = welcomVC;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败弹窗
        [SVProgressHUD dismiss];
    }];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [SVProgressHUD show];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
}




@end
