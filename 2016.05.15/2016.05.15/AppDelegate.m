//
//  AppDelegate.m
//  2016.05.15
//
//  Created by 顾明轩 on 16/5/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//实现showlabel
@synthesize showLabel,buttonsArray,text_button,judgerResult,lastPushButton,lastPushNumber,pushType;

//初始化应用程序
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //XCODE7.0下创建一个空的窗口
    ViewController *root=[[ViewController alloc]init];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor blackColor];
    self.window.rootViewController=root;
    [self.window makeKeyAndVisible];
    
    //创建计算器的界面
    //1.创建计算器的显示页面
    [self creatShowLabel];
    //2.创建计算器的按钮部分
    [self creatAllButton];

    return YES;
}

//1.创建计算器的显示页面
-(void)creatShowLabel
{
    //这样做的话，就不能再按钮行为里面读取了，所以要把这个在@property里面做成类的数据～～～
    //UILabel *showLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 110)];
    showLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 110)];
    showLabel.text=@"0";                                //设置文本框显示文字
    showLabel.textColor=[UIColor whiteColor];           //设置文本框字体颜色
    showLabel.font=[UIFont systemFontOfSize:60];        //设置文本框字体大小
    showLabel.textAlignment=NSTextAlignmentRight;       //设置文本框字体对齐
    [self.window addSubview:showLabel];                 //设置文本框窗口显示
}

//2.创建计算器的按钮部分
-(void)creatAllButton
{
    self.buttonsArray =[NSArray arrayWithObjects:@"AC",@"+/-",@"%",@"÷",@"7",@"8",@"9",@"×",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+",@"0",@" ",@".",@"=", nil];
    for (int i=0; i<5; i++) {
        for (int j=0; j<4; j++) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            //根据实际布局，把特殊情况下的按钮创建出来
            if (i==4 && j==0) {
                [button setFrame:CGRectMake(1+j*79.75, 130+70*i, 78.75*2+1, 69)];
            }
            else if (i==4 && j==1){
                continue;
            }
            else{
                [button setFrame:CGRectMake(1+j*79.75, 130+70*i, 78.75, 69)];
            }
            
            //根据列举出来的数组显示界面文字
            [button setTitle:[buttonsArray objectAtIndex:j+4*i] forState:UIControlStateNormal];
            
            //设置按钮背景颜色
            if (j==3) {
                [button setBackgroundColor:[UIColor orangeColor]];
            }
            else if(i==0 && j!=3) {
                [button setBackgroundColor:[UIColor grayColor]];
            }
            else{
                [button setBackgroundColor:[UIColor lightGrayColor]];
            }
            
            //设置title字体颜色
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //设置title字体大小
            button.titleLabel.font=[UIFont systemFontOfSize:25];
            
            //3.设计按钮按下的行为
            [button addTarget:self action:@selector(pushDownTheButton:) forControlEvents:UIControlEventTouchUpInside];
            
            //设置窗口显示按钮
            [self.window addSubview:button];
        }
    }
    
}

//3.实现按钮按下的行为
-(void)pushDownTheButton:(UIButton *)sender
{
    //先获取被点击了的按钮上的text
    self.text_button=sender.titleLabel.text;
    
    //如果输入的是ac
    if ([text_button isEqualToString:@"AC"]) {
        self.showLabel.text=@"0";
        self.lastPushButton=NULL;
        self.lastPushNumber=@"0";
        self.pushType=0;
    }
    
    //如果按下的是＋/-
    if ([text_button isEqualToString:@"+/-"]) {
        if ([showLabel.text floatValue]>=0) {
            text_button=[NSString stringWithFormat:@"-%g",[showLabel.text floatValue]];
        }
        else{
            text_button=[NSString stringWithFormat:@"%g",-[showLabel.text floatValue]];
        }
        self.showLabel.text=text_button;
        self.lastPushNumber=text_button;//刷新这个变量
        self.pushType=1;
    }
    
    //如果输入的是.
    if ([text_button isEqualToString:@"."]) {
        text_button=[NSString stringWithFormat:@"%@%@",showLabel.text,text_button];
        self.showLabel.text=text_button;
        self.lastPushNumber=text_button;//刷新这个变量
        self.pushType=1;
    }

    //如果按下的是%
    if ([text_button isEqualToString:@"%"]) {
        text_button=[NSString stringWithFormat:@"%g",[showLabel.text floatValue]/100];
        self.showLabel.text=text_button;
        self.lastPushNumber=text_button;//刷新这个变量
        self.pushType=1;
    }
    
    //如果按下的是+号
    if ([text_button isEqualToString:@"+"]) {
        self.calResult=showLabel.text;//首先记录屏幕的数字的字符串
        self.lastPushButton=@"+";
        self.pushType=0;
    }
    
    //如果按下的是-号
    if ([text_button isEqualToString:@"-"]) {
        self.calResult=showLabel.text;//首先记录屏幕的数字的字符串
        self.lastPushButton=@"-";
        self.pushType=0;
    }
    
    //如果按下的是×号
    if ([text_button isEqualToString:@"×"]) {
        self.calResult=showLabel.text;//首先记录屏幕的数字的字符串
        self.lastPushButton=@"×";
        self.pushType=0;
    }
    
    //如果按下的是÷号
    if ([text_button isEqualToString:@"÷"]) {
        self.calResult=showLabel.text;//首先记录屏幕的数字的字符串
        self.lastPushButton=@"÷";
        self.pushType=0;
    }
    
    //如果按下了=号
    if ([text_button isEqualToString:@"="]) {
        if ([self.lastPushButton isEqualToString:@"+"]) {
            text_button=[NSString stringWithFormat:@"%g",[self.calResult floatValue]+[self.lastPushNumber floatValue]];
        }
        if ([self.lastPushButton isEqualToString:@"-"]) {
            text_button=[NSString stringWithFormat:@"%g",[self.calResult floatValue]-[self.lastPushNumber floatValue]];
        }
        if ([self.lastPushButton isEqualToString:@"×"]) {
            text_button=[NSString stringWithFormat:@"%g",[self.calResult floatValue]*[self.lastPushNumber floatValue]];
        }
        if ([self.lastPushButton isEqualToString:@"÷"]) {
            text_button=[NSString stringWithFormat:@"%g",[self.calResult floatValue]/[self.lastPushNumber floatValue]];
        }
        if ([self.lastPushButton isEqualToString:@"="]) {
            text_button=showLabel.text;
            self.pushType=0;
        }
        self.showLabel.text=text_button;
        self.lastPushButton=@"=";
        self.pushType=0;
    }
    
    //如果输入的时候数字0～9
    for (int i=0; i<10; i++) {
        if ([text_button isEqualToString:[NSString stringWithFormat:@"%i",i]]) {
            //1.上次输入过计算符号
            //2.上次没有输入过计算符号

            if (self.lastPushButton==NULL) {
                if (![showLabel.text isEqualToString:@"0"]) {
                    text_button=[NSString stringWithFormat:@"%@%@",showLabel.text,text_button];
                }
            }
            else{
                //如果上次输入过计算符号了，但是上次输入的按钮又是数字，其实就是按了＋号又想输入一个2位数
                if (self.pushType==1) {
                    if (![showLabel.text isEqualToString:@"0"]) {
                        text_button=[NSString stringWithFormat:@"%@%@",showLabel.text,text_button];
                    }
                }
            }
            self.showLabel.text=text_button;
            self.lastPushNumber=text_button;
            self.pushType=1;
        }
    }
}

//实现判断按钮输入类型的行为
//for循环的方式做，比较复杂，但是也是可以的。还是使用简单的逻辑实现比较合理
-(int)judgeInputType
{
    //1.输入的是ac
    if ([self.text_button isEqualToString:@"AC"]) {
        NSLog(@"输入的是AC");
        judgerResult=1;
    }
    
    //2.输入的是计算符号
    for (int i=0; i<5; i++) {
        for (int j=0; j<4; j++) {
            if (j==3 || (i==0 && j>0)) {
                if ([self.text_button isEqualToString:[buttonsArray objectAtIndex:j+4*i]]) {
                    NSLog(@"输入的是计算符号");
                    judgerResult=2;
                }
            }
        }
    }
    
    //3.输入的是数字
    for (int i=1; i<4; i++) {
        for (int j=0; j<3; j++) {
            if ([self.text_button isEqualToString:[buttonsArray objectAtIndex:j+4*i]]) {
                NSLog(@"输入的是数字1～9");
                judgerResult=3;
            }
        }
    }
    return judgerResult;
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
