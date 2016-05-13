//
//  main.m
//  2016.05.12
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXStudent.h"
#import "GMXUiapplication.h"
#import "GMXDelegate.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //谓词，设计一个条件～～
        /*
//        //提取字符串
//        NSMutableArray *gmx_mutablearray=[NSMutableArray arrayWithCapacity:100];
//        for (int i=0; i<100; i++) {
//            
//            //产生一个大写的字母
//            int a=arc4random()%26+65;
//            int b=arc4random()%26+65;
//            int c=arc4random()%26+65;
//            int d=arc4random()%26+65;
//            int e=arc4random()%26+65;
//            [gmx_mutablearray addObject:[NSString stringWithFormat:@"%c%c%c%c%c",a,b,c,d,e]];
//            
//        }
//        for (NSString *str in gmx_mutablearray) {
//            if ([str hasPrefix:@"A"]) {
////                NSLog(@"%@",str);
//            }
//            
//        }
//
//        //谓词，创建条件,定制一个条件
////        NSPredicate *gmx_predicate=[NSPredicate predicateWithFormat:@"self='aaa'"];//固定格式，不可修改
////        NSPredicate *gmx_predicate=[NSPredicate predicateWithFormat:@"self like '*A*'"];//灵活的格式
//        NSPredicate *gmx_predicate=[NSPredicate predicateWithFormat:@"self like 'aa?'"];//?占一个字符
//        [gmx_mutablearray addObject:@"aaa"];//示范用新增一个字符串
//        for (NSString *str in gmx_mutablearray) {
//            if ([gmx_predicate evaluateWithObject:str]) {
//                NSLog(@"%@",str);
//            }
//        }
//        //如何查找自己定制的类里面的数据
//        GMXStudent *gmx_std=[[GMXStudent alloc]init];
//        gmx_std.std_name=@"轩爷";
//        gmx_std.std_age=22;
//        NSMutableArray *std_muarr=[NSMutableArray arrayWithCapacity:100];
//        GMXStudent *gmx_std1=[[GMXStudent alloc]init];
//        gmx_std1.std_name=@"aja";
//        gmx_std1.std_age=12;
//
//        [std_muarr addObject:gmx_std];
//        [std_muarr addObject:gmx_std1];
//        NSPredicate *pre=[NSPredicate predicateWithFormat:@"std_name like 'a??'"];//这里的std_name必须是变量名称
//        //predicateWithFormat:std_age>100都行。。随便写。。。
//        //predicateWithFormat:std_age<100
//        //predicateWithFormat:std_age=100
//        for (GMXStudent *ss in std_muarr) {
//            if ([pre evaluateWithObject:ss]) {
//                NSLog(@"%@",ss);//这里ss是一个对象，那么直接nslog对象的时候，到底打印出什么来，是根据description来决定的
//            }
//        }
    */
        //设计模式之单例，单例就是永远得到的都是同一个对象
        /*
        GMXStudent *a=[[GMXStudent alloc]init];
        GMXStudent *b=[[GMXStudent alloc]init];
        if (a==b) {
            NSLog(@"是同一个对象");
        }
        else
        {
            NSLog(@"不是同一个对象");
        }
        //创建一个单例的类
        //share default standard单例一般都用这个开头
        GMXUiapplication *app=[GMXUiapplication shareApplication];
        GMXUiapplication *app2=[GMXUiapplication shareApplication];
        if (app==app2) {
            NSLog(@"是同一个对象");
        }
        else
        {
            NSLog(@"不是同一个对象");
        }
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        NSUserDefaults *ud1=[NSUserDefaults standardUserDefaults];
        if (ud==ud1) {
            NSLog(@"是同一个对象");
        }
        else
        {
            NSLog(@"不是同一个对象");
        }
        //还可以重写init来实现，但是不提倡～～
         */
        //设计模式之代理
        //设计模式，就是解决问题的一个方针
        GMXDelegate *liuboss=[[GMXDelegate alloc]init];
        liuboss.name=@"刘老板";
        [liuboss talk];
        GMXSec *sec=[[GMXSec alloc]init];
        sec.name=@"张秘书";
        liuboss.dele=sec;
        [liuboss.dele phone];//刘老板的代理去打电话了～～
        [liuboss.dele payoff];
        
    }
    return 0;
}
