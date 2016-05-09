//
//  GMXCircumference.h
//  2016.05.09
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXCircumference : NSObject
{
    int first_side;     //定义类的数据
    int second_side;
}

-(id)initWithFirst_side:(int)_first_side andWithSecond_side:(int)_second_side;  //自定义初始化函数

-(int)circumference;//计算周长的函数

@end
