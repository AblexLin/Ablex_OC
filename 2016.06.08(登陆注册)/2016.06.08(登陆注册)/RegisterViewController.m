//
//  RegisterViewController.m
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/8.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "RegisterViewController.h"
#import <sqlite3.h>
#import "AblexAction.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName.clearButtonMode=UITextFieldViewModeWhileEditing;            //设置用户名输入框有输入时的叉叉按钮
    self.userPassword.clearButtonMode=UITextFieldViewModeWhileEditing;        //设置密码的输入框有输入时的叉叉按钮
    self.userSimpleName.clearButtonMode=UITextFieldViewModeWhileEditing;      //设置昵称的输入框有输入时的叉叉按钮
}

//定制注册功能
- (IBAction)registerBtn:(UIButton *)sender {
    
//    有效性检查
    NSString *simple=self.userSimpleName.text;
    NSString *name=self.userName.text;
    NSString *password=self.userPassword.text;
    BOOL simpeResult=[AblexAction invalidCheckForString:simple];
    BOOL nameResult=[AblexAction invalidCheckForString:name];
    BOOL passwordResult=[AblexAction invalidCheckForString:password];
    
    if (!simpeResult||!nameResult||!passwordResult) {
        [AblexAction alertForTitle:@"输入不能为空" ForID:self];
    }
    else{
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
        
        //创建表格
        NSString *sqlite=@"create table if not exists t_userinfo (simple text not null,name text not null,password text not null)";
        char *error;
        result=sqlite3_exec(db, [sqlite UTF8String], NULL, NULL, &error);
        if (result!=SQLITE_OK) {
            [AblexAction alertForTitle:[NSString stringWithUTF8String:error] ForID:self];
        }
        
        //查找表格看看是否是存在的账号
        sqlite=@"select * from t_userinfo where name=?";
        sqlite3_stmt *stmt;
        result=sqlite3_prepare_v2(db, [sqlite UTF8String], -1, &stmt, NULL);
        if (result!=SQLITE_OK) {
            [AblexAction alertForTitle:@"查找预处理失败" ForID:self];
        }
        else{
            result=sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);
            if (result!=SQLITE_OK) {
                self.isNotBinding=YES;//设置没有绑定标志为yes
                [AblexAction alertForTitle:@"绑定账号失败!" ForID:self];
            }
            if (self.isNotBinding!=YES) {
                if (sqlite3_step(stmt)==SQLITE_ROW) {
                    [AblexAction alertForTitle:@"已经存在的账号名，请更换账号名重试！" ForID:self];
                }
                else{
                    sqlite=@"insert into t_userinfo (simple,name,password) values(?,?,?)";
                    result=sqlite3_prepare_v2(db, [sqlite UTF8String], -1, &stmt, NULL);
                    if (result!=SQLITE_OK) {
                        [AblexAction alertForTitle:@"新增预处理失败" ForID:self];
                    }
                    else{
                        result=sqlite3_bind_text(stmt, 1, [simple UTF8String], -1, NULL);
                        if (result!=SQLITE_OK) {
                            self.isNotBinding=YES;//设置没有绑定标志为yes
                            [AblexAction alertForTitle:@"绑定昵称失败!" ForID:self];
                        }
                        result=sqlite3_bind_text(stmt, 2, [name UTF8String], -1, NULL);
                        if (result!=SQLITE_OK) {
                            self.isNotBinding=YES;//设置没有绑定标志为yes
                            [AblexAction alertForTitle:@"绑定账号失败!" ForID:self];
                        }
                        result=sqlite3_bind_text(stmt, 3, [password UTF8String], -1, NULL);
                        if (result!=SQLITE_OK) {
                            self.isNotBinding=YES;//设置没有绑定标志为yes
                            [AblexAction alertForTitle:@"绑定密码失败!" ForID:self];
                        }
                        if (self.isNotBinding!=YES) {
                            result=sqlite3_step(stmt);
                            if (result!=SQLITE_DONE) {
                                [AblexAction alertForTitle:@"新增陈述运行失败！" ForID:self];
                            }
                            else{
                                [AblexAction alertForTitle:@"注册成功！" ForID:self];
                            }
                        }
                    }
                }
            }
        }
        sqlite3_finalize(stmt);//关闭陈述很重要
        sqlite3_close(db);//关闭数据库

    }
    
}

//关闭键盘
- (IBAction)closeKeyBoard:(id)sender {
    [self.userName resignFirstResponder];
    [self.userPassword resignFirstResponder];
    [self.userSimpleName resignFirstResponder];
}

//返回按钮
- (IBAction)returnToMainView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//定制密码上的小眼睛
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

@end
