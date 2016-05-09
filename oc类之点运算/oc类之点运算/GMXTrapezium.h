//
//  GMXTrapezium.h
//  oc类之点运算
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXTrapezium : NSObject
{
    int upside;
    int downside;
    int height;
}

-(void)setUpside:(int)_upside;
-(void)setDownside:(int)_downside;
-(void)setHeight:(int)_height;

-(void)setUpside:(int)_upside2 andDownside:(int)_downside2 andHeight:(int)_height2;

-(int)upside;
-(int)downside;
-(int)height;

-(double)area;

+(id)tixing;//在内部实例化一个实例

@end
