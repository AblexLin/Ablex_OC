//
//  BombS.h
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BombS : NSObject

//爆炸的数据
@property (assign, nonatomic) int bombPointX;
@property (assign, nonatomic) int bombPointY;

//爆炸图片号
@property (assign, nonatomic) int bombImgNum;

//声明是否爆炸
@property (assign, nonatomic) BOOL isBomb;

@end
