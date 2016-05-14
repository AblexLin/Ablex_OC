//
//  AppDelegate.m
//  2016.05.14
//
//  Created by 顾明轩 on 16/5/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序初始化
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建一个自己定制的继承uiviewcontroller的类的对象的创建
    RootViewController *gmx_rootviewcontroller=[[RootViewController alloc]init];

    //创建一个窗口对象，就是我们这个程序在手机上能看到的界面，界面大小和手机屏幕一样。
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //frame指的是本控件相对于父控件的位置(相对的)
    //bounds指的是本身，也就是控件本身的位置和大小，所以bounds的起点一直是0，0，长宽就是自己的大小(绝对的，其实就是)
    //手机状态栏的高度永远是20
    
    //打印看看窗口的大小和起始坐标,打印结果x=0,y=0,width=320,height=480
    NSLog(@"x=%g,y=%g,width=%g,height=%g",self.window.frame.origin.x,self.window.frame.origin.y,self.window.frame.size.width,self.window.frame.size.height);
    
    //把自己定制类的对象赋值给窗口的rootViewController
    self.window.rootViewController=gmx_rootviewcontroller;
    
    //设置窗口的背景颜色
    self.window.backgroundColor=[UIColor whiteColor];
    
    //设置窗口为关键，并可视化
    [self.window makeKeyAndVisible];//这个必须放在上面，先让窗口可视化，然后添加的按钮，才能够点击
    
//    //显示窗口(一个蓝色的块)
//    UIView *v=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 130)];
//    UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
//    vv.backgroundColor=[UIColor redColor];
//    v.backgroundColor=[UIColor greenColor];
//    
//    //把vv加到v上面
//    [v addSubview:vv];
//    //把v加到window上
//    [self.window addSubview:v];
    
    //创建一个标签label
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 140, 20)];
    //设置属性的两种做法，都可以。
    [label setText:@"你麻痹"];
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setTextColor:[UIColor redColor]];

    label.text=@"添加一个联系人:";
    label.backgroundColor=[UIColor whiteColor];
    label.textColor=[UIColor redColor];
    
    //创建一个按钮button
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];//这个模式点时候显示的确定就读不到了
    btn.frame=CGRectMake(140, 30, 20, 20);
    btn.backgroundColor=[UIColor whiteColor];
    
    //设置按钮的图像，必须使用UIButtonTypeCustom这个定制点模式
//    [btn setImage:[UIImage imageNamed:@"aaa.png"] forState:UIControlStateNormal];
    
//    [btn setTitle:@"确定" forState:UIControlStateNormal];
    
    //按钮的事件//添加一个目标
    [btn addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];//按下的时候响应
    [btn addTarget:self action:@selector(buttonOut:) forControlEvents:UIControlEventTouchUpInside];//抬起的时候响应
    //添加到窗口
    [self.window addSubview:label];
    [self.window addSubview:btn];

    return YES;
}

//按钮的UIControlEventTouchDown也就是按下事件的实现
-(void)buttonTap:(UIButton *)sender
{
//    UIButton *btn=sender; //不赋值也可以，就是没有自动索引啦这样记不得行为就不能打印了
    NSLog(@"按钮终于被按下了!!!%@",[sender titleLabel].text);
}

//按钮的UIControlEventTouchUpInside也就是抬起事件的实现
-(void)buttonOut:(UIButton *)sender
{
//    UIButton *btn=sender; //不赋值也可以，就是没有自动索引啦这样记不得行为就不能打印了
    NSLog(@"按钮终于被松开了!!!%@",sender.titleLabel.text);
}

//应用程序即将进入后台
- (void)applicationWillResignActive:(UIApplication *)application {

}

//应用程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
}

//应用程序即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {

}

//应用程序已经进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

//应用程序退出
- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
