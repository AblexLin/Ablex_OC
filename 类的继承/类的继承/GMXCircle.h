//
//  GMXCircle.h
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXShape.h"

@interface GMXCircle : GMXShape
//{
//    int radius;
//}

-(id)initWithRadius:(int)_radius;

-(double)area;

@end
