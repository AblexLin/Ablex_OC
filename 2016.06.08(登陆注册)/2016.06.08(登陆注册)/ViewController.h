//
//  ViewController.h
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/8.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AblexAction.h"

@interface ViewController : UIViewController//<UITableViewDelegate,UITableViewDataSource>

//声明登录的活动指示器
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorForLogin;

//声明头像视图
@property (weak, nonatomic) IBOutlet UIImageView *portrait;

//声明账号和密码文本框
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

//声明小眼睛按钮和是否点击属性
- (IBAction)eyeBtn:(UIButton *)sender;
@property (assign, nonatomic) BOOL isEyed;

//声明记住密码按钮和是否记住属性
- (IBAction)remember:(UIButton *)sender;
@property (assign, nonatomic) BOOL isRemember;

//这个记住密码旁边的按钮是通过两个图片切换的，总是有阴影，其实是因为有个HightLightAdjustImage被勾选了，取消它，点击按钮就变的没有阴影了
@property (weak, nonatomic) IBOutlet UIButton *rememberBtn;

//声明登录按钮事件和属性
- (IBAction)login:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

//声明注册按钮属性
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;

//声明关闭键盘事件
- (IBAction)closeKeyBoard:(id)sender;

//记住密码标志对象型
@property (strong, nonatomic) NSNumber *number;

//绑定标记
@property (assign, nonatomic) BOOL isNotBinding;

@end

