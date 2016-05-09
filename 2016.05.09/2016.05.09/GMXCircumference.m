//
//  GMXCircumference.m
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXCircumference.h"

@implementation GMXCircumference
- (id)init
{
    self = [super init];    //调用父类的初始化函数，用来重写
    if (self) {
        first_side=12;      //重写父类的初始化函数，这样如果调用init就不会初始化为0了，而是这里重写的数据了
        second_side=11;
    }
    return self;
}

-(id)initWithFirst_side:(int)_first_side andWithSecond_side:(int)_second_side   //自定义初始化函数
{
    self=[super init];      //调用父类的初始化函数，用来重写
    if (self) {
        first_side=_first_side;     //用户输入的数据
        second_side=_second_side;
    }
    return self;
}

-(int)circumference      //行为或者叫函数，实现计算周长
{
    return first_side*2+second_side*2;
}

@end
