//
//  ViewController.m
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/8.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize number;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.portrait.layer.cornerRadius=2.5;                               //设置头像视图圆角
    self.rememberBtn.layer.borderWidth=0.8;                             //设置记住密码按钮边框宽度
    self.signInBtn.layer.borderWidth=0.5;                               //设置注册按钮边框宽度
    self.signInBtn.layer.cornerRadius=2.5;                              //设置注册视图圆角
    self.signInBtn.layer.borderColor=[UIColor lightGrayColor].CGColor;  //设置注册按钮的边框颜色
    self.loginBtn.layer.cornerRadius=2.5;                               //设置登录按钮圆角
    
    self.userName.clearButtonMode=UITextFieldViewModeWhileEditing;      //设置用户名输入框有输入时的叉叉按钮
    self.userPassword.clearButtonMode=UITextFieldViewModeWhileEditing;  //设置密码的输入框有输入时的叉叉按钮
    
    //设置单例的对象
    self.userName.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"NAME"];
    self.userPassword.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"PASSWORD"];
    number=[[NSUserDefaults standardUserDefaults]objectForKey:@"ISREMEMBER"];
    
    //设置勾选按钮
    if ([number intValue]==YES) {
        [self.rememberBtn setImage:[UIImage imageNamed:@"勾选.png"] forState:UIControlStateNormal];
    }
    else{
        [self.rememberBtn setImage:[UIImage imageNamed:@"勾选空.png"] forState:UIControlStateNormal];
        self.userPassword.text=@"";
    }

}

- (IBAction)login:(UIButton *)sender {
    
    //检查数据有效
    NSString *name=self.userName.text;
    NSString *password=self.userPassword.text;
    BOOL nameResult=[AblexAction invalidCheckForString:name];
    BOOL passwordResult=[AblexAction invalidCheckForString:password];
    if (!nameResult||!passwordResult) {
        [AblexAction alertForTitle:@"输入不能为空" ForID:self];
    }
    else{
        [sender setTitle:@"" forState:UIControlStateNormal]; //设置标题为空
        [self.activityIndicatorForLogin startAnimating];     //菊花开始旋转
        self.view.userInteractionEnabled=NO;                 //屏幕停止活动
        
        //创建数据库结构的对象
        sqlite3 *db;
        NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"userInformation.sqlite"];
        NSLog(@"%@",path);
        int result;
        
        //打开数据库
        result=sqlite3_open([path UTF8String], &db);
        if (result!=SQLITE_OK) {
            [AblexAction alertForTitle:@"文件打开失败!" ForID:self];
        }

        //查找数据库数据库
        NSString *sqlite=@"select * from t_userinfo where name=? and password=?";
        sqlite3_stmt *stmt;
        result=sqlite3_prepare_v2(db, [sqlite UTF8String], -1, &stmt, NULL);
        if (result!=SQLITE_OK) {
            [AblexAction alertForTitle:@"查找文件预处理失败!" ForID:self];
        }
        else{
            result=sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
            if (result!=SQLITE_OK) {
                self.isNotBinding=YES;//设置没有绑定标志为yes
                [AblexAction alertForTitle:@"绑定账号失败!" ForID:self];
            }
            result=sqlite3_bind_text(stmt, 2, [password UTF8String], -1, NULL);
            if (result!=SQLITE_OK) {
                self.isNotBinding=YES;//设置没有绑定标志为yes
                [AblexAction alertForTitle:@"绑定密码失败!" ForID:self];
            }
            if (self.isNotBinding!=YES) {
                if (sqlite3_step(stmt)==SQLITE_ROW) {
                    [AblexAction alertForTitle:@"登录成功" ForID:self];
                    if (self.isRemember) {
                        //为单例的对象赋值
                        [[NSUserDefaults standardUserDefaults] setObject:self.userName.text forKey:@"NAME"];
                        [[NSUserDefaults standardUserDefaults] setObject:self.userPassword.text forKey:@"PASSWORD"];
                    }
                    else{
                        [[NSUserDefaults standardUserDefaults] setObject:self.userName.text forKey:@"NAME"];
                    }
                    number=[NSNumber numberWithBool:self.isRemember];
                    [[NSUserDefaults standardUserDefaults] setObject:self.number forKey:@"ISREMEMBER"];
                }
                else{
                    [AblexAction alertForTitle:@"登录失败!请重新输入" ForID:self];
                }
            }
        }
        //恢复窗口
        [self.activityIndicatorForLogin stopAnimating];
        [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        self.view.userInteractionEnabled=YES;
        
        sqlite3_finalize(stmt);//关闭陈述
        sqlite3_close(db);//关闭数据库
    }
}

//关闭键盘
- (IBAction)closeKeyBoard:(id)sender {
    [self.userName resignFirstResponder];
    [self.userPassword resignFirstResponder];
}

//眼睛按钮
- (IBAction)eyeBtn:(UIButton *)sender {
    
    if (self.isEyed==NO) {
        [sender setImage:[UIImage imageNamed:@"眼睛选中.png"] forState:UIControlStateNormal];
        self.userPassword.secureTextEntry=NO;
        self.isEyed=YES;
    }
    else{
        [sender setImage:[UIImage imageNamed:@"眼睛.png"] forState:UIControlStateNormal];
        self.userPassword.secureTextEntry=YES;
        self.isEyed=NO;
    }
}

//记住密码
- (IBAction)remember:(UIButton *)sender {
    
    if (self.isRemember==NO) {
        [sender setImage:[UIImage imageNamed:@"勾选.png"] forState:UIControlStateNormal];
        self.isRemember=YES;
    }
    else{
        [sender setImage:[UIImage imageNamed:@"勾选空.png"] forState:UIControlStateNormal];
        self.isRemember=NO;
    }
}

@end
