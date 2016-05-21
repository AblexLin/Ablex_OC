//
//  AppDelegate.m
//  2016.05.21
//
//  Created by 顾明轩 on 16/5/21.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize pc,sc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    ViewController *root=[[ViewController alloc]init];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    sc=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    UIView *v1=[[UIView alloc]initWithFrame:CGRectMake(5, 5, 310, 470)];
    UIView *v2=[[UIView alloc]initWithFrame:CGRectMake(325, 5, 310, 470)];
    UIView *v3=[[UIView alloc]initWithFrame:CGRectMake(645, 5, 310, 470)];
    
    v1.backgroundColor=[UIColor redColor];
    v2.backgroundColor=[UIColor greenColor];
    v3.backgroundColor=[UIColor orangeColor];
    
    //给滚动视图加三个子视图
    [sc addSubview:v1];
    [sc addSubview:v2];
    [sc addSubview:v3];
    
    //允许滚动条件1
    sc.scrollEnabled=YES;
    
    //允许滚动条件2
    sc.contentSize=CGSizeMake(960, 0);
    
    //默认在第二页
    sc.contentOffset=CGPointMake(320, 0);
    
    //使用代理来获取滚动时的行为
    sc.delegate=self;
    
    pc=[[UIPageControl alloc]initWithFrame:CGRectMake(135, 430, 50, 37)];
    
    //设置有三页
    pc.numberOfPages=3;
    
    //设置页小点的颜色
    pc.pageIndicatorTintColor=[UIColor blueColor];
    
    //设置当前页
    pc.currentPage=1;
    
    //使用代理来获取页控件的代理
    //结果发现不能代理
    [pc addTarget:self action:@selector(pushTap) forControlEvents:UIControlEventValueChanged];
    
    self.window.rootViewController=root;
    [self.window makeKeyAndVisible];
    [self.window addSubview:sc];
    [self.window addSubview:pc];
    return YES;
}

//滚动视图已经滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"只要一滚动数据改变了，不论滚动的多少!");
//    float width=scrollView.frame.size.width;
//    float height=scrollView.frame.size.height;
    if (scrollView.contentOffset.x>0 && scrollView.contentOffset.x<320) {
        self.pc.currentPage=0;
    }
    if (scrollView.contentOffset.x>320 && scrollView.contentOffset.x<640) {
        self.pc.currentPage=1;
    }
    if (scrollView.contentOffset.x>640 && scrollView.contentOffset.x<960) {
        self.pc.currentPage=2;
    }
    NSLog(@"%g",scrollView.contentOffset.x);
}

-(void)pushTap
{
    //偏置和页控件的切换
    self.sc.contentOffset=CGPointMake(320*self.pc.currentPage, 0);
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
