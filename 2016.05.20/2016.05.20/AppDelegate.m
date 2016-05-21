//
//  AppDelegate.m
//  2016.05.20
//
//  Created by 顾明轩 on 16/5/21.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "FirViewController.h"
#import "SecViewController.h"
#import "ThrViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化三个vc
    FirViewController *fir_vc=[[FirViewController alloc]init];
    SecViewController *sec_vc=[[SecViewController alloc]init];
    ThrViewController *thr_vc=[[ThrViewController alloc]init];
    
    //用三个vc初始化三个nav
    UINavigationController *fir_nav=[[UINavigationController alloc]initWithRootViewController:fir_vc];
    UINavigationController *sec_nav=[[UINavigationController alloc]initWithRootViewController:sec_vc];
    UINavigationController *thr_nav=[[UINavigationController alloc]initWithRootViewController:thr_vc];
    
    //设置背景颜色,一般导航栏都是设置着色，bartintcolor 和tintcolor
    //[[UINavigationBar appearance]setBackgroundColor:[UIColor cyanColor]];
    
    //初始化一个数组用来保存三个导航视图
    NSArray *array_nav=[NSArray arrayWithObjects:fir_nav,sec_nav,thr_nav, nil];
    NSArray *array_vc=[NSArray arrayWithObjects:fir_vc,sec_vc,thr_vc, nil];
    
    //初始化一个UITabBarController对象
    UITabBarController *tbc=[[UITabBarController alloc]init];
    //设置tbc上面vc，使用nav来设置
    [tbc setViewControllers:array_nav];
    
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //把根vc设置为tbc
    self.window.rootViewController=tbc;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
