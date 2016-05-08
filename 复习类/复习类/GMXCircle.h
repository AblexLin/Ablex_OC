//
//  GMXCircle.h
//  复习类
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXCircle : NSObject
{
    int radius;
}

-(void)setRadius:(int)_radius;
-(double)area;
+(id)circle2;    //工厂的行为，创建类的对象(大部分)，或者用来共享

@end
