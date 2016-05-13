//
//  GMXMenu.m
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXMenu.h"

@implementation GMXMenu

//菜单和菜单编号的实现
@synthesize menu,menu_num;

//重写初始化函数
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menu=[NSArray arrayWithObjects:@"1、添加一个联系人",@"2、删除已有联系人",@"3、修改已有联系人",@"4、查找已有联系人",@"5、显示已有联系人",@"6、退出我的通讯录",@"7、显示通讯录菜单", nil];
        //要把代理的类赋值给boss,这样的方法是主程序的while循环放在menu里面做的时候，需要如此实现，不是在类里面实现的话，就要在主程序里面赋值了
        //self.tel_book=[[GMXTelbook alloc]init];
    }
    return self;
}

//实现显示菜单的行为
-(void)showmenu
{
    NSLog(@"****************");
    for (NSArray *temp in menu) {

        NSLog(@"*%@",temp);
    }
    NSLog(@"****************");
}

//实现输入编号的行为
-(void)inputnumber
{
    NSLog(@"请输入您选择使用的编号:");
    
    //从键盘获取一个数字并转换为oc的字符串
    char c_menu_num[2];             //定义一个获取键盘输入的临时c变量
    c_menu_num[1]='\0';             //确保输入的是1而不是16这样的两位数
    scanf("%s",c_menu_num);
    menu_num=[[NSString stringWithUTF8String:c_menu_num] intValue];
}

@end
