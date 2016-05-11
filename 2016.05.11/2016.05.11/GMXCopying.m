//
//  GMXCopying.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXCopying.h"

@implementation GMXCopying

//@synthesize name,age;

-(void)say
{
    NSLog(@"name=%@,age=%d",_name,_age);//不实现的话就使用下划线，也可以
}

-(id)copyWithZone:(NSZone *)zone//继承了nscopy协议，需要重新实现
{
    GMXCopying *s=[[[self class]alloc]init];
    s.name=_name;//实现复制的功能
    s.age=_age;
    return s;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"desname=%@,desage=%d",self.name,self.age];
}
@end
