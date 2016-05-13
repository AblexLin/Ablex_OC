//
//  GMXContact.m
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXContact.h"

@implementation GMXContact

//实现联系人的资料
@synthesize name,sex,tel,company;

//初始化联系人为苹果公司电话号码
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name=@"苹果Apple";
        self.sex=@"robot";
        self.tel=@"400-666-8800";
        self.company=@"美国苹果公司";
    }
    return self;
}

//支持NSCopying协议
- (id)copyWithZone:(nullable NSZone *)zone
{
    //初始化一个对象申请内存
    GMXContact *temp=[[GMXContact alloc]init];
    if (temp) {
        temp.name=self.name;
        temp.sex=self.sex;
        temp.tel=self.tel;
        temp.company=self.company;
    }
    return temp;
}

//支持NSCodeing协议
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    //把联系人信息编码
    [aCoder encodeObject:self.name forKey:@"NAME"];
    [aCoder encodeObject:self.sex forKey:@"SEX"];
    [aCoder encodeObject:self.tel forKey:@"TEL"];
    [aCoder encodeObject:self.company forKey:@"COMPANY"];
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    //把联系人信息解码
    self=[super init];
    if (self) {
        self.name=[aDecoder decodeObjectForKey:@"NAME"];
        self.sex=[aDecoder decodeObjectForKey:@"SEX"];
        self.tel=[aDecoder decodeObjectForKey:@"TEL"];
        self.company=[aDecoder decodeObjectForKey:@"COMPANY"];
    }
    return self;
}

@end
