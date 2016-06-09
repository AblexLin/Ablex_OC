//
//  RegisterViewController.h
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/8.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

//声明返回主界面按钮
- (IBAction)returnToMainView:(id)sender;

//定制密码上的小眼睛
- (IBAction)eyeBtn:(UIButton *)sender;
@property (assign, nonatomic) BOOL isEyed;

//声明昵称、用户名、密码三个文本输入框
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;
@property (weak, nonatomic) IBOutlet UITextField *userSimpleName;

//声明注册按钮
- (IBAction)registerBtn:(UIButton *)sender;

//关闭键盘
- (IBAction)closeKeyBoard:(id)sender;

//绑定标记
@property (assign, nonatomic) BOOL isNotBinding;

@end
