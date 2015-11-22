//
//  AppDelegate.m
//  sinaBlog_OC_sunlijian
//
//  Created by sunlijian on 15/11/21.
//  Copyright © 2015年 myCompany. All rights reserved.
//

#import "AppDelegate.h"
#import "PublicTarBarController.h"
#import "OAthViewController.h"
#import "NewFeatureController.h"
#import "WelcomController.h"
#import "HomeTableViewController.h"
#import "AccountTool.h"
#import "Account.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //新版本
    BOOL newVersion = [self hasNewVersion];
    
    if (newVersion) {
        self.window.rootViewController = [[NewFeatureController alloc]init];
    }else{
        self.window.rootViewController = [self switchController];
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
#pragma mark - 是否登陆过或过期
- (UIViewController *)switchController{
    Account *account = [AccountTool loadAccount];
    if (account) {
        return [[WelcomController alloc]init];
    }else{
        return [[OAthViewController alloc]init];
    }
}


#pragma mark - 是否有新版本
- (BOOL)hasNewVersion{
    //保存的版本
    NSString *keyVersion = @"keyVersion";
    NSString *localVersion = [[NSUserDefaults standardUserDefaults] objectForKey:keyVersion];
    //当前版本
    NSString *appVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:appVersion forKey:keyVersion];
    
    //进行判断
    if ([appVersion compare:localVersion] == NSOrderedDescending) {
        return YES;
    }else{
        return NO;
    }
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
