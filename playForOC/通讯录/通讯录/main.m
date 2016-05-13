//
//  main.m
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXContacts.h"
#import "GMXFunction.h"
#import "GMXMenu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GMXFunction *gmx_function=[[GMXFunction alloc]init];
        GMXMenu *gmx_menu=[[GMXMenu alloc]init];
        [gmx_menu showMenu];
        while (1) {
            //只要循环不结束，就切换到菜单
            [gmx_menu inputItem];
            
            if ([gmx_menu.item_number intValue]==1) {
                [gmx_function addContacts];
            }
            else if ([gmx_menu.item_number intValue]==2){
                [gmx_function delContacts];
            }
            else if ([gmx_menu.item_number intValue]==3){
                [gmx_function modifyContacts];
            }
            else if ([gmx_menu.item_number intValue]==4){
                [gmx_function findContacts];
            }
            else if ([gmx_menu.item_number intValue]==5){
                [gmx_function showContacts];
            }
            else if ([gmx_menu.item_number intValue]==6){
                NSLog(@"退出联系人成功!");
                break;
            }
            else if ([gmx_menu.item_number intValue]==7){
                [gmx_menu showMenu];
            }
            else
            {
                NSLog(@"错误的编码输入，请重新输入:");
            }
        }

    }
    return 0;
}
