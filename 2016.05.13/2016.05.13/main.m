//
//  main.m
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXMenu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //实例化一个菜单
        GMXMenu *menu=[[GMXMenu alloc]init];
        
        //实例化一个通讯录
        GMXTelbook *tel_book=[[GMXTelbook alloc]init];
        menu.tel_book=tel_book;//必须赋值，才能代理，李秘书要赋值给boss才可以
        
        //显示菜单
        [menu showmenu];

        while (1) {
            
            //获取键盘输入的菜单编号
            [menu inputnumber];
            
            //判断输入的编号来执行相应的行为
            if (menu.menu_num==1) {
                [menu.tel_book addcontact];
            }
            else if (menu.menu_num==2){
                [menu.tel_book delcontact];
            }
            else if (menu.menu_num==3){
                [menu.tel_book modcontact];
            }
            else if (menu.menu_num==4){
                [menu.tel_book sekcontact];
            }
            else if (menu.menu_num==5){
                [menu.tel_book shwcontact];
            }
            else if (menu.menu_num==6){
                [menu.tel_book qutcontact];
                break;
            }
            else if (menu.menu_num==7){
                [menu showmenu];
            }
            else{
                NSLog(@"错误的编号输入，请重新输入:");
            }
            
        }
    }
    return 0;
}
