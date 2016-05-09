//
//  main.m
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXShape.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //因为重写了父类的初始化函数，所以输出的应该是9
        GMXShape *shape=[[GMXShape alloc]init];
        NSLog(@"\n这个图形1面积是:%d",[shape area]); //调用shape的area行为

        //因为自定义的gmxshape类的初始化函数，所以输出的应该是25
        GMXShape *shape2=[[GMXShape alloc]initWithWidth:5 andWithHeight:5];//调用自定义init
        NSLog(@"\n这个图形2面积是:%d",[shape2 area]);
        
    }
    return 0;
}
