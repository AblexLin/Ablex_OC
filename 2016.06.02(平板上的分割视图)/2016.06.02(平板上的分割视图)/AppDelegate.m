//
//  AppDelegate.m
//  2016.06.02(平板上的分割视图)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuTableViewController.h"
#import "DetailViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //让我们设置的widown去获取屏幕自身的大小
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置背景颜色
    self.window.backgroundColor=[UIColor whiteColor];
    
    //初始化两个视图控制器
    MenuTableViewController *menu=[[MenuTableViewController alloc]init];
    DetailViewController *detail=[[DetailViewController alloc]init];
    
    
    //重点在这里，代理的赋值
    menu.delegate=detail;
    
    //初始化两个导航视图控制器
    UINavigationController *menuNav=[[UINavigationController alloc]initWithRootViewController:menu];
    UINavigationController *detailNav=[[UINavigationController alloc]initWithRootViewController:detail];
    
    //定义一个数组，用来初始化分割视图用
    NSArray *vcr=[NSArray arrayWithObjects:menuNav,detailNav, nil];
    
    //初始化一个分割视图
    UISplitViewController *svc=[[UISplitViewController alloc]init];
    
    //通过视图控制器来初始化分割视图
    [svc setViewControllers:vcr];
    
    //设置窗口的根视图为这个分割视图控制器
    self.window.rootViewController=svc;
    
    //设置主窗口可见并为焦点
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
