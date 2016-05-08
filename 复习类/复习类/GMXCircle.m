//
//  GMXCircle.m
//  复习类
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXCircle.h"

@implementation GMXCircle

-(void)setRadius:(int)_radius
{
    radius=_radius;
}

-(double)area
{
    return 3.14*radius*radius;
}

+(id)circle2
{
    return [[[self class]alloc]init];//实现类的初始化
//    return [[GMXCircle alloc]init];
}

@end
