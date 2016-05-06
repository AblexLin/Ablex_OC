//
//  main.m
//  类的学习
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ablex_std.h"
#import "ABLEXSum.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Ablex_std *student=[[Ablex_std alloc]init];//使用指针来实例化，然后动态申请内存并初始化
        [student setName:(@"zhangsan")];
        [student setSex:@"nan"];
        [student setAge:12];
        [student setStdinfo:@"haha" andAge:12 andSex:@"nan"];
        [student say];// ]是发消息的意思表示调用student的行为say
        
        ABLEXSum *sum=[[ABLEXSum alloc]init];
        NSLog(@"%d",[sum sumNumber:1 andEnd:100]);
    }
    return 0;
}
