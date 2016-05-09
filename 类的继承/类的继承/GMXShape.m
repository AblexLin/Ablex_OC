//
//  GMXShape.m
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXShape.h"

@implementation GMXShape

-(id)init                   //重写父类的初始化函数
{
    self = [super init];
    if (self) {
        width=3;
        height=3;
    }
    return self;
}

-(id)initWithWidth:(int)_width andWithHeight:(int)_height //自定义的初始化函数
{
    self = [super init];    //调用父类的初始化函数
    if (self) {             //如果调用父类的初始化函数返回了一个对象
        width=_width;
        height=_height;
    }
    return self;            //返回对象本身
}

-(int)area
{
    return width*height;    //求面积
}

@end
