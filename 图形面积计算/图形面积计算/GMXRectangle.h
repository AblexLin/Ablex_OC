//
//  GMXRectangle.h
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXRectangle : NSObject
{
    int width;
    int height;
}

-(void)setWidth:(int)_width;     //获取宽度
-(void)setHeight:(int)_height;   //获取长度
-(int)area;                     //计算面积

@end
