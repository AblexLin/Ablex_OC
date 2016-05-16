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
@property (strong, nonatomic) UILabel *label;

//声明button
@property (strong, nonatomic) UIButton *button_showinfo;
@property (strong, nonatomic) UIButton *button_clearinfo;
@property (strong, nonatomic) UIButton *button;

//声明textfield
@property (strong, nonatomic) UITextField *textfield_user;
@property (strong, nonatomic) UITextField *textfield_code;
@property (strong, nonatomic) UITextField *textfield;

//声明textview
@property (strong, nonatomic) UITextView *textview_show;
@property (strong, nonatomic) UITextView *textview;

//声明textfield,button求和用
@property (strong, nonatomic) UITextField *textfield_sum;
@property (strong, nonatomic) UIButton *button_sum;

@end

