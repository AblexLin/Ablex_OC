//
//  AddPersonViewController.h
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueForNewToMain.h"

@interface AddPersonViewController : UIViewController

//定义文本框
@property (strong, nonatomic) UITextField *textfield_name;
@property (strong, nonatomic) UITextField *textfield_telp;
@property (strong, nonatomic) UITextField *textfield_mail;
@property (strong, nonatomic) UITextField *textfield_home;

//定义协议的代理
@property (strong, nonatomic) id<PassValueForNewToMain> delegate;
@end
