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
    }
    return 0;
}
