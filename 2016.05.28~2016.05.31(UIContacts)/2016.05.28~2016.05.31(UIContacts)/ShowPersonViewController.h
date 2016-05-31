//
//  ShowPersonViewController.h
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueForNewToMain.h"

@interface ShowPersonViewController : UIViewController

//定义文本框显示联系人信息
@property (strong, nonatomic) UITextField *textfield_name;
@property (strong, nonatomic) UITextField *textfield_telp;
@property (strong, nonatomic) UITextField *textfield_mail;
@property (strong, nonatomic) UITextField *textfield_home;

//定义主界面传递来的数据
@property (strong, nonatomic) NSString *text_name;
@property (strong, nonatomic) NSString *text_telp;
@property (strong, nonatomic) NSString *text_mail;
@property (strong, nonatomic) NSString *text_home;

//主界面传递来的行列信息
@property (strong, nonatomic) NSIndexPath *indexPathForMainToShow;

//代理
@property (strong, nonatomic) id<PassValueForNewToMain> delegate;

//删除联系人按钮
@property (strong, nonatomic) UIButton *btnDelete;

@end
