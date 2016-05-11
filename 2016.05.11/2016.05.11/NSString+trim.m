//
//  NSString+trim.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "NSString+trim.h"

@implementation NSString (trim)

-(NSString *)trim
{
    NSLog(@"trim");
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
