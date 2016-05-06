//
//  ABLEXSum.m
//  类的学习
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ABLEXSum.h"

@implementation ABLEXSum
-(void)sumInput:(int)_n
{
    n=_n;
}
-(int)sumNumber:(int)_startnumber andEnd:(int)_endnumber
{
    for (int i=_startnumber; i<_endnumber; i++) {
        n+=i;
    }
    return n;
}
@end
