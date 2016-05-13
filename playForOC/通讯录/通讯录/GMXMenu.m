//
//  GMXMenu.m
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXMenu.h"

@implementation GMXMenu

@synthesize item_number;

-(void)showMenu
{
    NSLog(@"\n");
    NSLog(@"**欢迎来到通讯录菜单*");
    NSLog(@"**              **\n");
    NSLog(@"** 1、添加联系人! **");
    NSLog(@"** 2、删除联系人! **");
    NSLog(@"** 3、修改联系人! **");
    NSLog(@"** 4、查找联系人! **");
    NSLog(@"** 5、显示联系人! **");
    NSLog(@"** 6、退出联系人! **");
    NSLog(@"** 7、联系人菜单! **");
    NSLog(@"**              **\n");
    NSLog(@"**欢迎来到通讯录菜单*");
    NSLog(@"\n");

}

-(NSString *)inputItem
{
    char number[2];
    NSLog(@"请输入菜单编号来执行相应功能:");
    scanf("%s",number);
    item_number=[NSString stringWithUTF8String:number];
    
    return item_number;
}

@end
