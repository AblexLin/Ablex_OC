//
//  Myannotation.m
//  2016.06.16(获取我的位置)
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Myannotation.h"


@implementation Myannotation
@synthesize coordinate,title,subtitle;

-(instancetype)initWithCoordinate:(CLLocationCoordinate2D)_coord
{
    self=[super init];
    if (self) {
        coordinate=_coord;
    }
    return self;
}
@end
