//
//  GMXStd.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXStd.h"

@implementation GMXStd
-(id)init
{
    self=[super init];
    if (self) {
        NSLog(@"%@初始化",name);
    }
    return self;
}

-(void)dealloc
{
//    [super dealloc];//关闭引用计数以后，就不能执行这里了，还需要手动去销毁
    NSLog(@"%@被销毁了",name);
}

//-(void)setName:(NSString *)_name
//{
//    name=_name;
//}
//-(NSString *)name
//{
//    return name;
//}
//和上面注释掉的是一样的功能
@synthesize name;//相当于注释里的实现行为

@end
