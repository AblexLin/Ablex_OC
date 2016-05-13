//
//  GMXFunction.h
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXContacts.h"
#define FILE_NAME @"contacts.plist"

@interface GMXFunction : GMXContacts

@property (strong,nonatomic)NSMutableArray *gmx_mutablearray;

//增加和显示联系人
-(void)addContacts;
-(void)showContacts;

//删除联系人
-(void)delContacts;

//修改联系人
-(void)modifyContacts;

//查找联系人
-(void)findContacts;

@end
