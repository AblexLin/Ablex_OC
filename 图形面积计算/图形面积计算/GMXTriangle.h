//
//  GMXTriangle.h
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXTriangle : NSObject
{
    int bottom;
    int height;
}
-(void)setBottom:(int)bottom;
-(void)setHeight:(int)height;
-(double)area;

@end
