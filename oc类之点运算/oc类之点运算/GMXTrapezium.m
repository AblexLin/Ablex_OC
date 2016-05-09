//
//  GMXTrapezium.m
//  oc类之点运算
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXTrapezium.h"

@implementation GMXTrapezium

-(void)setUpside:(int)_upside
{
    upside=_upside;
}

-(void)setDownside:(int)_downside
{
    downside=_downside;
}

-(void)setHeight:(int)_height
{
    height=_height;
}

-(void)setUpside:(int)_upside2 andDownside:(int)_downside2 andHeight:(int)_height2
{
    upside=_upside2;
    downside=_downside2;
    height=_height2;
}

-(double)area
{
    return (upside+downside)*height/2.0;
}

+(id)tixing
{
    return [[[self class]alloc]init];
}

@end
