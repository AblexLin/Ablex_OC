//
//  main.m
//  结构
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //点 大小 矩形 范围
        //这几个都是结构～～～不是类，所以实例化的时候不需要*有指针的时候就是不一样了，需要用->调用了
        CGPoint point; //CG是CoreGraphics单词缩写就是核心图形的意思，所以CGPoint就是核心图形中的点
        point.x=12.3;
        point.y=14.5;
        //CGFloat 其实就是float，是定义的一个宏
        NSLog(@"%g,%g",point.x,point.y);
        
        //大小
        CGSize size=CGSizeMake(15.2, 16.3);//这个就是直接给结构里面赋值的函数～～～
        NSLog(@"%g,%g",size.width,size.height);
        
        //矩形
        CGRect rectangle=CGRectMake(0, 0, 10, 15);
        NSLog(@"%g,%g,%g,%g",rectangle.origin.x,rectangle.origin.y,rectangle.size.width,rectangle.size.height);
        
        //范围
        NSRange range;//不在cg里面
        range.location=10;  //比如字符串的起点
        range.length=15;    //长度为15，也就是10～25的东西
    }
    return 0;
}
