//
//  AppDelegate.m
//  2016.05.19
//
//  Created by 顾明轩 on 16/5/19.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"

//导入七个视图
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThridViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
#import "SeventhViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //定义一个UITabBarController
    UITabBarController *tbc=[[UITabBarController alloc]init];
    
    //初始化viewcontroller
    ViewController *one=[[ViewController alloc]init];
    SecondViewController *two=[[SecondViewController alloc]init];
    ThridViewController *three=[[ThridViewController alloc]init];
    ForthViewController *four=[[ForthViewController alloc]init];
    FifthViewController *five=[[FifthViewController alloc]init];
    SixthViewController *six=[[SixthViewController alloc]init];
    SeventhViewController *seven=[[SeventhViewController alloc]init];

    //定义一个
    UINavigationController *nav_one=[[UINavigationController alloc]initWithRootViewController:one];
    UINavigationController *nav_two=[[UINavigationController alloc]initWithRootViewController:two];
    UINavigationController *nav_three=[[UINavigationController alloc]initWithRootViewController:three];
    UINavigationController *nav_four=[[UINavigationController alloc]initWithRootViewController:four];
    UINavigationController *nav_five=[[UINavigationController alloc]initWithRootViewController:five];
    UINavigationController *nav_six=[[UINavigationController alloc]initWithRootViewController:six];
    UINavigationController *nav_seven=[[UINavigationController alloc]initWithRootViewController:seven];
    
    //定义一个存放viewcontroller的数组
    NSArray *viewcontrollers=[NSArray arrayWithObjects:nav_one,nav_two,nav_three,nav_four,nav_five,nav_six,nav_seven, nil];
    
    //定义一个UITabBarController内的viewcontroller
    [tbc setViewControllers:viewcontrollers animated:YES];
    
    //窗口初始化
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //把根视图设置为tbc
    self.window.rootViewController=tbc;
    
    //把根视图设置为焦点且可见
    [self.window makeKeyAndVisible];

    return YES;
}

@end
