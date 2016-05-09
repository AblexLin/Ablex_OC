//
//  main.m
//  oc类之点运算
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXTrapezium.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GMXTrapezium *tixingtu=[GMXTrapezium tixing];
        [tixingtu setUpside:3 andDownside:5 andHeight:6];
        NSLog(@"\n梯形的面积是:%g",[tixingtu area]);
        
        GMXTrapezium *hah=[[GMXTrapezium alloc]init];
        hah.height=12;//oc中点操作符号，本身就是一个行为（函数，方法）的调用
        //其实就是调用setHeight,所以类内部定义的时候，这个setHeight命名必须这样做，否则无法读取
        int h=hah.height;
        NSLog(@"高度:%i",h);
    }
    return 0;
}
