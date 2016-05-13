//
//  GMXTelbook.h
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义文件名的宏
#define FILE_NAME @"contacts.plist"

@interface GMXTelbook : NSObject

//通讯录里有很多联系人
@property (strong,nonatomic)NSMutableArray *contacts;

//通讯录里的联系人编号
@property (assign,nonatomic)int contacts_num;

//添加联系人
-(void)addcontact;

//删除联系人
-(void)delcontact;

//修改联系人
-(void)modcontact;

//查找联系人
-(void)sekcontact;

//显示联系人
-(void)shwcontact;

//退出联系人
-(void)qutcontact;

//输入和转换字符串的行为
-(NSString *)inputandconvert:(int)_strlength;

@end
