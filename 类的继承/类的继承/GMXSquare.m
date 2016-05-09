//
//  GMXSquare.m
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXSquare.h"

@implementation GMXSquare

-(id)initWithSide:(int)_side
{
    self=[super initWithWidth:_side andWithHeight:_side];
    return self;
}

-(int)area
{
    NSLog(@"这可是正方形子类的函数哦!");
    return [super area]/2;
}

@end
