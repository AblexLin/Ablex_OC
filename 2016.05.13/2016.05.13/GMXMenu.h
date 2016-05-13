//
//  GMXMenu.h
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXTelbook.h"

@interface GMXMenu : NSObject

//菜单
@property (strong,nonatomic)NSArray *menu;

//菜单编号
@property (assign,nonatomic)int menu_num;

//菜单代理
@property (strong,nonatomic)GMXTelbook *tel_book;

//显示菜单
-(void)showmenu;

//菜单输入
-(void)inputnumber;

@end
