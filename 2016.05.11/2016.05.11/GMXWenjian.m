//
//  GMXWenjian.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXWenjian.h"

@implementation GMXWenjian

//@synthesize name,age;

-(void)say
{
    NSLog(@"我叫%@,今年%d",self.name,self.age);
}

//协议里的行为，归档专用
-(void)encodeWithCoder:(NSCoder *)aCoder            //编码
{
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeInt:self.age forKey:@"AGE"];
}
-(id)initWithCoder:(NSCoder *)aDecoder              //解码
{
    self =[super init];
    self.name=[aDecoder decodeObjectForKey:@"NAME"];
    self.age=[aDecoder decodeIntForKey:@"AGE"];
    return self;
}



@end
