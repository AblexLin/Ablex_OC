//
//  ABLEXSum.h
//  类的学习
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABLEXSum : NSObject
{
    int n;
}
-(void)sumInput:(int)_n;
-(int)sumNumber:(int)_startnumber andEnd:(int)_endnumber;

@end
