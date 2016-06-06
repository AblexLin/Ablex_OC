//
//  MyClass.m
//  2016.06.06(沙盒数据)
//
//  Created by 顾明轩 on 16/6/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "MyClass.h"

@interface MyClass ()

@end

@implementation MyClass

- (instancetype)init
{
    self = [super init];
    if (self) {
        _str=@"xuanye";
        _array=[NSArray arrayWithObjects:@"xuanye",@"laopo",@"shouzhang", nil];
        _dictionary=[NSDictionary dictionaryWithObjectsAndKeys:@"xuanxuan",@1,@"xiaolin",@2,@"shouzhanglaopo",@3, nil];
    }
    return self;
}
//实现支持拷贝的协议
- (id)copyWithZone:(nullable NSZone *)zone
{
    MyClass *myclass=[[MyClass alloc]init];
    
    myclass.str=self.str;
    myclass.array=self.array;
    myclass.dictionary=self.dictionary;
    
    return myclass;
}
//实现支持编码的协议
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_str forKey:@"STR"];
    [aCoder encodeObject:_array forKey:@"ARRAY"];
    [aCoder encodeObject:_dictionary forKey:@"DICTIONARY"];
}
//实现支持解码的协议
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    
    if (self) {
        self.str=[aDecoder decodeObjectForKey:@"STR"];
        self.array=[aDecoder decodeObjectForKey:@"ARRAY"];
        self.dictionary=[aDecoder decodeObjectForKey:@"DICTIONARY"];
    }
    
    return self;
}

@end
