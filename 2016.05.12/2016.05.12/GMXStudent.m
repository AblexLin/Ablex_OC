//
//  GMXStudent.m
//  2016.05.12
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXStudent.h"

@implementation GMXStudent
@synthesize std_age,std_name;

-(NSString *)description
{
    return [NSString stringWithFormat:@"名字:%@ 年龄:%d",std_name,std_age];
}

@end
