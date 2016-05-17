//
//  AppDelegate.h
//  2016.05.17
//
//  Created by 顾明轩 on 16/5/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UIImageView *imageview;//声明一个类的对象，只能在类里面使用@property声明的可以在类外面调用
}
//UIPickerViewDataSource,UIPickerViewDelegate
//自定义试图导入这两个协议很有用，第一个显示内容用，第二个选择后执行行为用

@property (strong, nonatomic) UIWindow *window;

//声明一个进度条
@property (strong, nonatomic) UIProgressView *progressview_first;

//声明一个按钮
@property (strong, nonatomic) UIButton *button_first;

//声明一个菊花
@property (strong, nonatomic) UIActivityIndicatorView *aiv;

//声明一个按钮标志
@property (assign, nonatomic) int button_use_tag;

//声明一个数组
@property (strong, nonatomic) NSArray *arr;

//声明一个自定义选择器视图
@property (strong, nonatomic) UIPickerView *pickerview;

@end

