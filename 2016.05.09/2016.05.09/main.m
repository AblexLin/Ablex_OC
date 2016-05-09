//
//  main.m
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXCircumference.h"
#import "GMXTriangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //使用父类NSObject的init函数初始化
        GMXCircumference *circumference1=[[GMXCircumference alloc]init];
        
        //使用GMXCircumference的init函数初始化
        GMXCircumference *circumference2=[[GMXCircumference alloc]initWithFirst_side:5 andWithSecond_side:6];
        
        //打印两种情况下输出的周长
        NSLog(@"使用父类NSObject的init函数初始化获得的周长是:%d",[circumference1 circumference]);
        NSLog(@"使用GMXCircumference的init函数初始化获得的周长是:%d",[circumference2 circumference]);
        
        //三角形
        GMXTriangle *triangle1 = [[GMXTriangle alloc]init];
        GMXTriangle *triangle2 = [[GMXTriangle alloc]initWithFirst_side:5 andWithSecond_side:3 andWithThird_side:7];
        NSLog(@"使用父类NSObject的init函数初始化获得的“三角形”周长是:%d",[triangle1 circumference]);
        NSLog(@"使用GMXCircumference的init函数初始化获得的“三角形”周长是:%d",[triangle2 circumference]);
        
        //三角形的来个多态的实现
        GMXCircumference *polymorphism=triangle2;
        NSLog(@"ploymorphism:%d",[polymorphism circumference]);//这个调用的是triangle2的circumference行为
        
        //id数据类型
        id idtype=[[GMXTriangle alloc] initWithFirst_side:7 andWithSecond_side:8 andWithThird_side:8];
        //判断是不是这个类的成员或者其子类的成员
        BOOL a=[idtype isKindOfClass:[GMXCircumference class]];     //父类
        BOOL aa=[idtype isKindOfClass:[GMXTriangle class]];         //子类
        
        BOOL b=[idtype isMemberOfClass:[GMXCircumference class]];   //父类
        BOOL bb=[idtype isKindOfClass:[GMXTriangle class]];         //子类
        
        //判断
        if (a) {
            NSLog(@"是父类的成员");
        }
        else
        {
            NSLog(@"不是父类的成员");
        }
        if (aa) {
            NSLog(@"是子类的成员");
        }
        else
        {
            NSLog(@"不是子类的成员");
        }
        if (b) {
            NSLog(@"是父类的成员");
        }
        else
        {
            NSLog(@"不是父类的成员");
        }
        if (bb) {
            NSLog(@"是子类的成员");
        }
        else
        {
            NSLog(@"不是子类的成员");
        }
        
        //动态定义的时候如何调用circumference行为
        SEL address_circumference=@selector(circumference);//把所有叫circumference的函数的地址给前面的函数
        BOOL c=[idtype respondsToSelector:address_circumference];
        if (c) {
            NSLog(@"%d",[idtype performSelector:address_circumference]);
        }
    }
    return 0;
}
