//
//  GMXTriangle.h
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXCircumference.h"

@interface GMXTriangle : GMXCircumference
{
    int thrid_side;
}
-(id)initWithFirst_side:(int)_first_side andWithSecond_side:(int)_second_side andWithThird_side:(int)_thrid_side;//重写自定义的函数

-(int)circumference;//重写周长函数

@end
