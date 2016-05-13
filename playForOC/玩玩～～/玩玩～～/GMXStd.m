//
//  GMXStd.m
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXStd.h"

@implementation GMXStd

//@synthesize std_age,std_name;

+(id)stdIntroduction//类自己的行为，需要声明
{
    GMXStd *std =[[[self class]alloc]init];
    return std;
}

//学生类实例化后对象的行为，需要声明
-(void)stdIntroduction
{
    NSLog(@"stdIntroduction:%@的年龄是:%d",self.std_name,self.std_age);
}

//完成拷贝的目的，其实就是另外新申请一个内存，把原本已经有的数据存进去，这样就可以执行copy了
- (id)copyWithZone:(nullable NSZone *)zone //继承协议的行为，不需要声明
{
    GMXStd *std_copy=[[[self class]alloc]init];
    std_copy.std_name=self.std_name;
    std_copy.std_age=self.std_age;
    return std_copy;
}

//添加描述，添加后再打印实例化的对象的时候，显示的就不是一个地址了，而是这里return的东西了
-(NSString *)description//父类继承来的行为，不需要声明
{
    return [NSString stringWithFormat:@"description:%@今年%d岁了!",self.std_name,self.std_age];
}

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder;//继承协议的行为，不需要声明
{
    [aCoder encodeObject:_std_name forKey:@"NAME"];
    [aCoder encodeInt:_std_age forKey:@"AGE"];
}

//解码
- (id)initWithCoder:(NSCoder *)aDecoder;//继承协议的行为，不需要声明
{
    GMXStd *std_decoder =[[[self class]alloc]init];
    std_decoder.std_name=[aDecoder decodeObjectForKey:@"NAME"];
    std_decoder.std_age=[aDecoder decodeIntForKey:@"AGE"];
    return std_decoder;
}


@end
