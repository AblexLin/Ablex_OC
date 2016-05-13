//
//  GMXTelebook.m
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXTelebook.h"

@implementation GMXTelebook

@synthesize contacts_name,contacts_tele,contacts_sex;

//重写父类的初始化行为
-(id)init
{
    self=[super init];
    contacts_name=@"苹果公司热线";
    contacts_tele=@"8008208820";
    contacts_sex=@"robot";
    return self;
}

//重写父类的description行为，能够让对象名称直接打印出类的数据
-(NSString *)description
{
    return [NSString stringWithFormat:@"联系人:%@ 性别:%@ 电话:%@",contacts_name,contacts_sex,self.contacts_tele];
}

//对象的行为
-(void)addMan
{

}

//对象的行为
-(void)findMan
{

}

//协议里必须实现的协议行为
-(void)deleMan
{

}

//协议里选择实现的协议行为
-(void)changeMan
{

}

//协议NSCoping里面的行为,实现它，完成复制的功能
- (id)copyWithZone:(nullable NSZone *)zone
{
    GMXTelebook *telebook=[[[self class]alloc]init];
    telebook.contacts_name=contacts_name;
    telebook.contacts_tele=contacts_tele;
    telebook.contacts_sex=self.contacts_sex;
    return telebook;
}

@end
