//
//  GMXCircle.h
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXCircle : NSObject
{
    int radius;
}

-(void)setRadius:(int)_radius;
-(double)area;

@end
