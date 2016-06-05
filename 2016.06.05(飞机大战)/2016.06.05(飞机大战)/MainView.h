//
//  MainView.h
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainView : UIView
//声明图片
@property (strong, nonatomic) UIImage *backGroundImage;
@property (strong, nonatomic) UIImage *bulletImage;
@property (strong, nonatomic) UIImage *enemyImage;
@property (strong, nonatomic) UIImage *myPlaneImage;
@property (strong, nonatomic) UIImage *myPlaneImage1;

//声明爆炸图片
@property (strong, nonatomic) UIImage *bombImage1;
@property (strong, nonatomic) UIImage *bombImage2;
@property (strong, nonatomic) UIImage *bombImage3;
@property (strong, nonatomic) UIImage *bombImage4;

//声明数组
@property (strong, nonatomic) NSMutableArray *bullets;
@property (strong, nonatomic) NSMutableArray *enemys;
@property (strong, nonatomic) NSMutableArray *bombs;

//声明英雄点
@property (assign, nonatomic) CGPoint myPlanePoint;
@property (assign, nonatomic) int myPlaneNum;

@end
