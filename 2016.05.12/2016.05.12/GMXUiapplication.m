//
//  GMXUiapplication.m
//  2016.05.12
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXUiapplication.h"
//单线程静态对象
static GMXUiapplication *application=nil;

@implementation GMXUiapplication
+(GMXUiapplication *)shareApplication
{
    //了解下～～～后期会学
    //单线程时候ok，多线程的时候需要同步下
    @synchronized(self) {//多线程的时候，如果上一个线程没有做完，会在这等待
        //单线程时候ok
        if (application==nil) {
            application=[[[self class]alloc]init];
            return application;
        }
    }
    //上面这么写以后，多线程的时候，同一时候只能是一个线程去运行它
    return application;
}

@end
