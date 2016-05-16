//
//  AppDelegate.h
//  2016.05.16
//
//  Created by 顾明轩 on 16/5/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//声明label
@property (strong, nonatomic) UILabel *label_user;
@property (strong, nonatomic) UILabel *label_code;

//声明button
@property (strong, nonatomic) UIButton *button_showinfo;
@property (strong, nonatomic) UIButton *button_clearinfo;

//声明textfield
@property (strong, nonatomic) UITextField *textfield_user;
@property (strong, nonatomic) UITextField *textfield_code;

//声明textview
@property (strong, nonatomic) UITextView *textview_show;


//声明textfield求和用
@property (strong, nonatomic) UITextField *textfield_sum;
//声明button求和用
@property (strong, nonatomic) UIButton *button_sum;

@end

