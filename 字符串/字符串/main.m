//
//  main.m
//  字符串
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //如何学习一个类
        //1.初始化(工厂行为、对象初始化) 2.行为
        //NSString 静态的字符串－－不能修改
        //NSMutableString 动态的字符串－－可以修改
        //以上2个都是类，不是结构
//        NSString *str=@"轩爷";
//        NSLog(@"\n%@",str);
//        //1.工厂行为常用的3个
//        
//        //把int 123转换为字符串
//        NSString *str1=[NSString stringWithFormat:@"%d",123];
//        NSLog(@"%@",str1);
//        
//        NSString *str2=[NSString stringWithString:@"xuanye"];//=@"xuanye"是一个意思
//        NSLog(@"%@",str2);
//        
//        NSString *str3=[NSString stringWithUTF8String:"轩爷"];//把c里面的串转换为oc里面的串
//        NSLog(@"%@",str3);
//        
//        NSString *zifuchuan1=@"456";
//        NSString *zifuchuan2=[[NSString alloc]initWithFormat:@"%d",123];
//        NSString *zifuchuan3=[NSString stringWithFormat:@"%d",789];
//        NSLog(@"%@,%@,%@",zifuchuan1,zifuchuan2,zifuchuan3);
        NSString *zimu=@"中aB.c";
        NSLog(@"%@",zimu);
        NSLog(@"%@",[zimu uppercaseString]);//转换为大写～～～～
        NSLog(@"%@",[zimu lowercaseString]);//转换为消协～～～～
        NSLog(@"%ld",[zimu length]);//字符串长度读取，输出的还是长整形～～～
        NSLog(@"%ld",[zimu lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);//中文三个字符
        
        NSRange range=[zimu rangeOfString:@"B."];//判断字符串中是不是有这个字符
        
//        NSLog(@"length=%d,location=%d",range.length,range.location);//返回length和location
        
        if (range.location==NSNotFound) {
            NSLog(@"没有");
        }
        else
        {
            NSLog(@"有");
        }
    }
    return 0;
}
