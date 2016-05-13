//
//  GMXContacts.m
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXContacts.h"

@implementation GMXContacts

//实现联系人信息
@synthesize name,tel;

-(instancetype)init
{
    self=[super init];
    name=@"苹果公司热线";
    tel=@"8008208820";
    return self;
}

//联系人对象的描述
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@的电话号码是:%@",name,tel];
}

//完成复制协议
- (instancetype)copyWithZone:(nullable NSZone *)zone
{
    GMXContacts *contacts=[[GMXContacts alloc]init];
    contacts.name=name;
    contacts.tel=tel;
    return contacts;
}

//编码
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeObject:self.tel forKey:@"TEL"];
}

//解码
- (id)initWithCoder:(NSCoder *)aDecoder
{
//    GMXContacts *contacts=[[GMXContacts alloc]init];
    self=[super init];
    self.name=[aDecoder decodeObjectForKey:@"NAME"];
    self.tel=[aDecoder decodeObjectForKey:@"TEL"];
    return self;
}

@end
