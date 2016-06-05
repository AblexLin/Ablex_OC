//
//  Enemys.h
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Enemys : NSObject

//敌人的数据
@property (assign, nonatomic) int enemyPointX;
@property (assign, nonatomic) int enemyPointY;
@property (assign, nonatomic) BOOL isEnemyValid;

@end
