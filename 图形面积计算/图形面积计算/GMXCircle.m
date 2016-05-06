//
//  GMXCircle.m
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
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

@end
