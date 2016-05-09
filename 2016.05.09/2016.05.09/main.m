//
//  main.m
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXCircumference.h"
#import "GMXTriangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //类的点对象，init函数重写，多态，id数据类型合集
        /*
        //使用父类NSObject的init函数初始化
        GMXCircumference *circumference1=[[GMXCircumference alloc]init];
        
        //使用GMXCircumference的init函数初始化
        GMXCircumference *circumference2=[[GMXCircumference alloc]initWithFirst_side:5 andWithSecond_side:6];
        
        //打印两种情况下输出的周长
        NSLog(@"使用父类NSObject的init函数初始化获得的周长是:%d",[circumference1 circumference]);
        NSLog(@"使用GMXCircumference的init函数初始化获得的周长是:%d",[circumference2 circumference]);
        
        //三角形
        GMXTriangle *triangle1 = [[GMXTriangle alloc]init];
        GMXTriangle *triangle2 = [[GMXTriangle alloc]initWithFirst_side:5 andWithSecond_side:3 andWithThird_side:7];
        NSLog(@"使用父类NSObject的init函数初始化获得的“三角形”周长是:%d",[triangle1 circumference]);
        NSLog(@"使用GMXCircumference的init函数初始化获得的“三角形”周长是:%d",[triangle2 circumference]);
        
        //三角形的来个多态的实现
        GMXCircumference *polymorphism=triangle2;
        NSLog(@"ploymorphism:%d",[polymorphism circumference]);//这个调用的是triangle2的circumference行为
        
        //id数据类型
        id idtype=[[GMXTriangle alloc] initWithFirst_side:7 andWithSecond_side:8 andWithThird_side:8];
        //判断是不是这个类的成员或者其子类的成员
        BOOL a=[idtype isKindOfClass:[GMXCircumference class]];     //父类
        BOOL aa=[idtype isKindOfClass:[GMXTriangle class]];         //子类
        
        BOOL b=[idtype isMemberOfClass:[GMXCircumference class]];   //父类
        BOOL bb=[idtype isKindOfClass:[GMXTriangle class]];         //子类
        
        //判断
        if (a) {
            NSLog(@"是父类的成员");
        }
        else
        {
            NSLog(@"不是父类的成员");
        }
        if (aa) {
            NSLog(@"是子类的成员");
        }
        else
        {
            NSLog(@"不是子类的成员");
        }
        if (b) {
            NSLog(@"是父类的成员");
        }
        else
        {
            NSLog(@"不是父类的成员");
        }
        if (bb) {
            NSLog(@"是子类的成员");
        }
        else
        {
            NSLog(@"不是子类的成员");
        }
        
        //动态定义的时候如何调用circumference行为
        SEL address_circumference=@selector(circumference);//把所有叫circumference的函数的地址给前面的函数
        BOOL c=[idtype respondsToSelector:address_circumference];
        if (c) {
            NSLog(@"%d",[idtype performSelector:address_circumference]);
        }
         */
        
        //CGPoint,CGSize,CGRect,NSRange
        /*
        CGPoint point=CGPointMake(3.5, 4.6);
        NSLog(@"坐标X:%g,坐标Y:%g",point.x,point.y);
        
        CGSize size;
        size.width=12.3;
        size.height=15.8;
        NSLog(@"宽度:%g,高度:%g",size.width,size.height);
        
        CGRect rectrangle=CGRectMake(5.1, 6.2, 7.3, 8.4);
        NSLog(@"坐标X:%g,坐标Y:%g,宽度:%g,高度:%g",rectrangle.origin.x,rectrangle.origin.y,rectrangle.size.width,rectrangle.size.height);
        
        NSRange range;
        range.location=3;   //起点
        range.length=4;     //长度
        */
        
        //字符串赋值，数字与字符串相互转换，c字符串转换为oc字符串
        /*
        //字符串赋值2种形式
        NSString *str1=@"xuan123ye";
        NSString *str2=[NSString stringWithString:@"xuanye"];

        //数字转换为字符串两种形式
        NSString *str3=[[NSString alloc]initWithFormat:@"%d",123];  //类的动态申请内存和调用初始化函数的方式实现
        NSString *str4=[NSString stringWithFormat:@"%d",456];       //固定格式实现
        
        //字符串转换为数字的方法
        NSString *str=@"123";
        NSLog(@"%d",[str intValue]);
        
        //把c的字符串转换为oc的
        NSString *str5=[NSString stringWithUTF8String:"xuanye"];
        NSLog(@"%@,%@,%@,%@,%@",str1,str2,str3,str4,str5);
        */
        
        //字符串大小写转换，长度读取
        /*
        NSString *zimu=@"中aB.c";
        NSLog(@"%@",zimu);

        //大小写转换
        NSLog(@"%@",[zimu uppercaseString]);
        NSLog(@"%@",[zimu lowercaseString]);
        
        //字符串长度读取，中文显示一个字符
        NSLog(@"length下的长度:%ld",[zimu length]);
        //字符串长度读取，中文显示三个字符
        NSLog(@"lengthOfBytesUsingEncoding下的长度:%ld",[zimu lengthOfBytesUsingEncoding:NSUTF8StringEncoding]);
        */
        
        //判断字符串中是不是有某个字符，字符串比较，判断字符串以什么开头和结尾，提取字符串中的子串，剔除字符串两端的空格
        /*
        //判断字符串中是不是有这个字符
        NSString *zimu=@"abcdefg";
        NSRange range=[zimu rangeOfString:@"ab"];
        
        //返回length和location
        NSLog(@"length=%ld,location=%ld",range.length,range.location);
        
        //判断里面有没有这个字符
        if (range.location==NSNotFound)
        {
            NSLog(@"字符串中没有这个字符");
        }
        else
        {
            NSLog(@"字符串中有这个字符");
        }
        
        //判断两个字符串是不是相同，和c里面的strcmp差不多，因为这里的字符串是指针变量，所以如果比较地址多话，那没有意义
        if ([zimu isEqualToString:@"abcdef"]) {
            NSLog(@"是同一个字符串");
        }
        else
        {
            NSLog(@"不是同一个字符串");
        }
        
        //判断字符串是以什么字符串开头的
        if ([zimu hasPrefix:@"b"]) {
            NSLog(@"是以这个开头的");
        }
        else
        {
            NSLog(@"不是以这个开头的");
        }
        //判断字符串是以什么字符串结尾的
        if ([zimu hasSuffix:@"f"]) {
            NSLog(@"是以这个结尾的");
        }
        else
        {
            NSLog(@"不是以这个结尾的");
        }
        
        //提取字符串中的子串
        NSLog(@"%@",[zimu substringFromIndex:2]);       //这里的二表示第三个，从第三个开始一直提取到结束
        NSLog(@"%@",[zimu substringToIndex:5]);         //截取到第五个
        NSRange zimurang={1,4};//1是起点，4是长度
        NSLog(@"%@",[zimu substringWithRange:zimurang]);//从哪里到哪里
        
        //剔除字符串中的空格
        NSString *str1=@"123";
        NSString *str2=@" 456 ";
        NSString *str3=@"789";
        NSLog(@"%@%@%@",str1,[str2 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]],str3);
        */
    }
    return 0;
}










