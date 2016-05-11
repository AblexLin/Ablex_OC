//
//  GMXAction.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXAction.h"

@implementation GMXAction
@synthesize name;
-(void)say
{
    NSLog(@"%@在说话",name);
}
-(void)song
{
    NSLog(@"%@在唱歌",name);
}
-(void)chuiniu
{
    NSLog(@"%@在吹牛",name);
}
@end
