//
//  ViewController.h
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bullets.h"
#import "Enemys.h"
#import "BombS.h"
@interface ViewController : UIViewController

//创建对象
@property (strong, nonatomic) Bullets *bullet;
@property (strong, nonatomic) Enemys *enemy;
@property (strong, nonatomic) BombS *bomb;

@end

