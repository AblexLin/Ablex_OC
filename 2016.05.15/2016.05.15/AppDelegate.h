//
//  AppDelegate.h
//  2016.05.15
//
//  Created by 顾明轩 on 16/5/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//声明一个变量保存上次按下的按钮情况
@property (assign,nonatomic) int pushType;;

//声明一个浮点型的变量，用来存储计算的结果
@property (strong,nonatomic) NSString *calResult;

//声明上次按下了的数字和按钮
@property (strong,nonatomic) NSString *lastPushButton;
@property (strong,nonatomic) NSString *lastPushNumber;

//声明按钮的数组
@property (strong,nonatomic) NSArray *buttonsArray;

//声明标签为类的数据
@property (strong,nonatomic)UILabel *showLabel;

//声明一个字符串
@property (strong,nonatomic) NSString *text_button;


//声明判断按钮输入类型的行为
@property (assign,nonatomic) int judgerResult;
-(int)judgeInputType;

@end

