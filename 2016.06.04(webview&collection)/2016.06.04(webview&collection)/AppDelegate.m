//
//  AppDelegate.m
//  2016.06.04(webview&collection)
//
//  Created by 顾明轩 on 16/6/4.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "CollectionViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置窗口大小
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置窗口背景颜色
    self.window.backgroundColor=[UIColor whiteColor];
    
    //创建一个流式布局的对象
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    
    //设置布局内项目的大小
    flowLayout.itemSize=CGSizeMake(50, 50);
    
    //设置创建单个集合的创建方向  垂直的去创建
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    //设置流式布局距离屏幕四周的边框距离
    flowLayout.sectionInset=UIEdgeInsetsMake(200, 0, 50, 0);
    
    //用这个对象来初始化一个集合视图控制器
    CollectionViewController *collection=[[CollectionViewController alloc]initWithCollectionViewLayout:flowLayout];
    
    //设置窗口的根视图控制器为这个集合视图控制器
    self.window.rootViewController=collection;
    
    //设置窗口可见且为焦点
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
