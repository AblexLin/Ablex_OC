//
//  AppDelegate.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/26.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "Class_one_ViewController.h"
#import "Class_two_TableViewController.h"
#import "Class_three_TableViewController.h"
#import "Class_four_TableViewController.h"
#import "Class_five_TableViewController.h"
#import "Class_six_TableViewController.h"
#import "Class_seven_TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序加载完成
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建一个纯文本的工程
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    
    //初始化Class_one_ViewController和Class_two_TableViewController
    //Class_one_ViewController *root_class_one=[[Class_one_ViewController alloc]init];
    //Class_two_TableViewController *root_class_two=[[Class_two_TableViewController alloc]initWithStyle:UITableViewStylePlain];
    //Class_three_TableViewController *root_class_three=[[Class_three_TableViewController alloc]initWithStyle:UITableViewStylePlain];
    //Class_four_TableViewController  *root_class_four=[[Class_four_TableViewController alloc]initWithStyle:UITableViewStylePlain];
    //Class_five_TableViewController  *root_class_five=[[Class_five_TableViewController alloc]initWithStyle:UITableViewStyleGrouped];//标题头会更大些
    //Class_six_TableViewController  *root_class_six=[[Class_six_TableViewController alloc]initWithStyle:UITableViewStylePlain];
    Class_seven_TableViewController  *root_class_seven=[[Class_seven_TableViewController alloc]initWithStyle:UITableViewStylePlain];
    
    //定义导航视图和标签栏视图
    //UINavigationController *nav_class_one=[[UINavigationController alloc]initWithRootViewController:root_class_one];
    //UINavigationController *nav_class_two=[[UINavigationController alloc]initWithRootViewController:root_class_two];
    //UINavigationController *nav_class_three=[[UINavigationController alloc]initWithRootViewController:root_class_three];
    //UINavigationController *nav_class_four=[[UINavigationController alloc]initWithRootViewController:root_class_four];
    //UINavigationController *nav_class_five=[[UINavigationController alloc]initWithRootViewController:root_class_five];
    //UINavigationController *nav_class_six=[[UINavigationController alloc]initWithRootViewController:root_class_six];
    UINavigationController *nav_class_seven=[[UINavigationController alloc]initWithRootViewController:root_class_seven];
    
    //初始化一个标签栏控件
    UITabBarController *tab=[[UITabBarController alloc]init];
    
    //定义一个数组来初始化标签栏视图1(1~6class)
    //NSArray *array_viewcontrollers=[NSArray arrayWithObjects:nav_class_one,nav_class_two,nav_class_three,nav_class_four,nav_class_five,nav_class_six, nil];
    //定义一个数组来初始化标签栏视图2(7~11class)
    NSArray *array_viewcontrollers2=[NSArray arrayWithObject:nav_class_seven];
    
    //给标签栏视图添加视图控制器
    [tab setViewControllers:array_viewcontrollers2 animated:YES];
    
    //设置系统的根视图控制器为tab
    self.window.rootViewController=tab;
    
    //设置主窗口为关键且可见
    [self.window makeKeyAndVisible];
    
    return YES;
}

//应用程序生命周期中的－－应用程序将要进入后台
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
//应用程序生命周期中的－－应用程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
//应用程序生命周期中的－－应用程序将要进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
//应用程序生命周期中的－－应用程序已经进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//应用程序生命周期中的－－应用程序将要结束
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
