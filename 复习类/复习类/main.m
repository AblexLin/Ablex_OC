//
//  main.m
//  复习类
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXCircle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GMXCircle *circle=[[GMXCircle alloc]init];
        GMXCircle *circle2=[GMXCircle circle2];
        [circle setRadius:5];
        [circle2 setRadius:6];
        NSLog(@"\n这个圆的面积是:%g",[circle area]);
        NSLog(@"\n这个圆2的面积是:%g",[circle2 area]);
    }
    return 0;
}
