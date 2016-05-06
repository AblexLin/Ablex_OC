//
//  GMXSquare.m
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXSquare.h"

@implementation GMXSquare

-(void)setSide:(int)_side
{
    side=_side;
}

-(int)area{
    return side*side;
}

@end
