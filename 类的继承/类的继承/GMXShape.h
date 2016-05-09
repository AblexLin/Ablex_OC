//
//  GMXShape.h
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXShape : NSObject
{
    int width;  //图形的宽
    int height; //图形的高
}

-(id)initWithWidth:(int)_width andWithHeight:(int)_height;//初始化的时候赋值的行为

-(int)area;

@end
