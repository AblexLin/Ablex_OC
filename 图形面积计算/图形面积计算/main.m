//
//  main.m
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXRectangle.h"
#import "GMXSquare.h"
#import "GMXCircle.h"
#import "GMXTriangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GMXRectangle *rectangle=[[GMXRectangle alloc]init];
        [rectangle setWidth:20];
        [rectangle setHeight:30];
        NSLog(@"\n长方形的面积是:%i",[rectangle area]);//%i表示的是int的i，和%d的意义相同
        
        GMXSquare *square=[[GMXSquare alloc]init];
        [square setSide:22];
        NSLog(@"\n正方形的面积是:%d",[square area]);
        
        GMXCircle *circle=[[GMXCircle alloc]init];
        [circle setRadius:5];
        NSLog(@"\n这个圆的面积是:%g",[circle area]);
        
        GMXTriangle *triangle=[[GMXTriangle alloc]init];
        [triangle setBottom:10];
        [triangle setHeight:5];
        NSLog(@"\n三角形的面积是:%g",[triangle area]);
    }
    return 0;
}

