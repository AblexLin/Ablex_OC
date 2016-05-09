//
//  GMXTriangle.m
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXTriangle.h"

@implementation GMXTriangle

-(id)initWithFirst_side:(int)_first_side andWithSecond_side:(int)_second_side andWithThird_side:(int)_thrid_side
{
    self=[super initWithFirst_side:_first_side andWithSecond_side:_second_side];
    if (self) {
        thrid_side=_thrid_side;
    }
    return self;
}

-(int)circumference
{
    return first_side+second_side+thrid_side;
}

@end
