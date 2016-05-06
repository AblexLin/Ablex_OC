//
//  GMXSquare.h
//  图形面积计算
//
//  Created by 顾明轩 on 16/5/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXSquare : NSObject
{
    int side;
}

-(void)setSide:(int)_side;
-(int)area;

@end
