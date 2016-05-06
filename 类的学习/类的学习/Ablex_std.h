//
//  Ablex_std.h
//  类的学习
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ablex_std : NSObject
{
    NSString *name;//受保护的，类里面的参数
    NSString *sex;
    int age;
}

-(void)say;//公开的，类里面的行为（函数）除非特殊指定
-(void)setName:(NSString *)_name;
-(void)setAge:(int)_age;
-(void)setSex:(NSString *)_sex;
-(void)setStdinfo:(NSString *)_name andAge:(int)_age andSex:(NSString*)_sex;
@end
