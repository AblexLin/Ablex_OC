//
//  GMXTriangle.m
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXTriangle.h"

@implementation GMXTriangle

-(void)setBottom:(int)bottom
{
    self->bottom=bottom;//这样也可以，但是不好容易混淆～
}

-(void)setHeight:(int)height
{
    self->height=height;
}

-(double)area
{
    return bottom*height/2.0;
}
@end
