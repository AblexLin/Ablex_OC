//
//  AppDelegate.m
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //创建一个背景为白色的纯文本编程窗口
    ViewController *root=[[ViewController alloc]init];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //其实就是这个意思
//    [self.window addSubview:root.view];
    self.window.rootViewController=root;//把视图赋值给了根视图
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];

    //生成两个按钮，分别用来显示警报(UIAlertView),操作表(UIActionSheet),这两个都不支持使用了，先学着
    buttonForAlarm=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonForAlarm setTitle:@"UIAlertView" forState:UIControlStateNormal];
    [buttonForAlarm setFrame:CGRectMake(10, 30, 110, 40)];
    [buttonForAlarm setBackgroundColor:[UIColor lightGrayColor]];
    buttonForAlarm.layer.cornerRadius=10.0;
    [buttonForAlarm addTarget:self action:@selector(pushTap:) forControlEvents:UIControlEventTouchUpInside];
    buttonForSheet=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [buttonForSheet setTitle:@"UIActionSheet" forState:UIControlStateNormal];
    [buttonForSheet setFrame:CGRectMake(190, 30, 110, 40)];
    [buttonForSheet setBackgroundColor:[UIColor lightGrayColor]];
    buttonForSheet.layer.cornerRadius=10.0;
    [buttonForSheet addTarget:self action:@selector(pushTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //ios8的警报和操作表使用方式
    UIAlertController *alertcontroller=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"这个游戏不能低于18岁!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertaction=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:nil];//创建一个按钮
    [alertcontroller addAction:alertaction];//把这个按钮添加到警报控制器上
    //[root presentViewController:alertcontroller animated:YES completion:nil];//再把警报控制器添加到root上去
    //这个显示的是没有按钮的需要自己新增一个动作
    //最好是在ViewController里面去新建，下面看那里的
    
    
    [self.window addSubview:buttonForSheet];
    [self.window addSubview:buttonForAlarm];//这里添加的按钮将一直会在最新的视图上
    //UIAlertView和UIActionSheet在ios7以后叫UIActionController看ViewController.m里面的实现
    
    return YES;
}

//根据按钮的名称来判断哪个按钮被按下了，这个方法也不错哦!
-(void)pushTap:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"UIAlertView"]) {
        NSLog(@"UIAlertView被按下了!");
        UIAlertView *alertview=[[UIAlertView alloc]initWithTitle:@"你要删除联系人吗?" message:nil delegate:self cancelButtonTitle:@"是" otherButtonTitles:@"否", nil];
        [alertview show];//使用show来显示,这个事ios8之前度使用方式
    }
    else if([sender.titleLabel.text isEqualToString:@"UIActionSheet"]){
        NSLog(@"UIActionSheet被按下了!");
        UIActionSheet *actionsheet=[[UIActionSheet alloc]initWithTitle:@"显示一个标题" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除联系人" otherButtonTitles:@"其他",nil];
        [actionsheet showInView:self.window];//使用showInView来显示
    }
}

//UIAlertView锁定点击了什么按钮的行为
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //buttonIndex的数据是从左往右来表示0～n
    if (buttonIndex==0) {
        NSLog(@"你选择了是!");//警报一般不在这里写逻辑，写逻辑就用操作表
    }
    else if(buttonIndex==1){
        NSLog(@"你选择了否!");
    }
}

//UIAlertView锁定点击了什么按钮的行为
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //buttonIndex的数据是从上往下来表示0～n
    if (buttonIndex==0) {
        NSLog(@"你选择了删除联系人");//一般都用这个来做选择
    }
    if (buttonIndex==1) {
        NSLog(@"你选择了其他");
    }
    if (buttonIndex==2) {
        NSLog(@"你选择了取消");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
}
- (void)applicationWillEnterForeground:(UIApplication *)application {
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
}
- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
