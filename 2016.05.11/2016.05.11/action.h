//
//  action.h
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol action <NSObject>
//协议，只有声明部分，没有.m文件，继承至<NSObject>
//协议本身也是一个特殊的类，只是只有声明，没有实现

@required //下面列出的是必须要实现的协议
-(void)say;

@optional //下面列出的是选择要实现的协议
-(void)song;

@end
