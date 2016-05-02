//
//  main.m
//  类的声明和学习
//
//  Created by 顾明轩 on 16/5/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXStd.h"

//类的声明
@interface Std:NSObject{
    NSString *name;
    int age;
}
-(void)say;
@end

//类的实现
@implementation Std

-(void)say{
    NSLog(@"%@,%d",name,age);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Std *ablex = [[Std alloc]init];//申请内存并且初始化
        [ablex say];//调用方法～～～
        GMXStd *gmx=[[GMXStd alloc]init];
        [gmx say];
    }
    return 0;
}
