//
//  GMXRectangle.m
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXRectangle.h"

@implementation GMXRectangle

-(void)setWidth:(int)_width
{
    width=_width;
}

-(void)setHeight:(int)_height
{
    height=_height;
}

-(int)area
{
    return width*height;
}

@end
