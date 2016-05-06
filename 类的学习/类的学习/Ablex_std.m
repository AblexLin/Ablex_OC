//
//  Ablex_std.m
//  类的学习
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Ablex_std.h"

@implementation Ablex_std
-(void)say
{
    NSLog(@"\n这是一个类!name=%@,sex=%@,age=%d",name,sex,age);
}
-(void)setName:(NSString *)_name
{
    name=_name;
}
-(void)setAge:(int)_age
{
    age=_age;
}
-(void)setSex:(NSString *)_sex
{
    sex=_sex;
}
-(void)setStdinfo:(NSString *)_name andAge:(int)_age andSex:(NSString *)_sex
{
    name=_name;
    sex=_sex;
    age=_age;
}
@end
