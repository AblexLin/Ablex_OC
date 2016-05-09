//
//  GMXSquare.h
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXShape.h"

@interface GMXSquare : GMXShape

-(id)initWithSide:(int)_side;//自定义类初始化函数

-(int)area;//计算面积的方法

@end
