//
//  main.m
//  helloworld
//
//  Created by 顾明轩 on 16/4/29.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import 有包含重复包含的作用比include好
//NS开头的，都是foundation里面的
int main(int argc, const char * argv[]) {
    
    //自动释放池
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //@表示这个是oc的字符串，用来区分和其他语言
        //nslog可以自动换行
        BOOL b=YES;
        b=NO;
        NSString *xxx=@"avc";
        NSLog(@"%s","sa");
        NSLog(@"%@",xxx);//特殊占位符
    }
    
    
    return 0;
}
