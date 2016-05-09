//
//  GMXCircle.m
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXCircle.h"

@implementation GMXCircle

-(id)initWithRadius:(int)_radius
{
    self=[super initWithWidth:_radius andWithHeight:_radius];
//    if (self) {
//        radius=_radius;
//    }
    return self;
}

-(double)area
{
//    return 3.14*radius*radius;
    return 3.14*[super area];//把_radius保存在父类的宽和高里面的，所以直接使用父类的面积＊3.14
}
@end
