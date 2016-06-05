//
//  MainView.m
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "MainView.h"
#import "Bullets.h"
#import "Enemys.h"
#import "BombS.h"
@implementation MainView

@synthesize bullets,enemys,bombImage1,bombs,myPlaneImage,bombImage2,bombImage3,bombImage4,myPlaneImage1,myPlanePoint,myPlaneNum;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //获取背景图片
        NSString *backGroundpath=[[NSBundle mainBundle]pathForResource:@"background" ofType:@"png"];
        self.backGroundImage=[UIImage imageWithContentsOfFile:backGroundpath];
        //获取子弹图片
        NSString *bulletPath=[[NSBundle mainBundle]pathForResource:@"bullet1" ofType:@"png"];
        self.bulletImage=[UIImage imageWithContentsOfFile:bulletPath];
        //获取敌人图片
        NSString *enemyPath=[[NSBundle mainBundle]pathForResource:@"enemy1" ofType:@"png"];
        self.enemyImage=[UIImage imageWithContentsOfFile:enemyPath];
        //获取爆炸图片1
        NSString *bombPath1=[[NSBundle mainBundle]pathForResource:@"enemy1_down1" ofType:@"png"];
        self.bombImage1=[UIImage imageWithContentsOfFile:bombPath1];
        //获取爆炸图片2
        NSString *bombPath2=[[NSBundle mainBundle]pathForResource:@"enemy1_down2" ofType:@"png"];
        self.bombImage2=[UIImage imageWithContentsOfFile:bombPath2];
        //获取爆炸图片3
        NSString *bombPath3=[[NSBundle mainBundle]pathForResource:@"enemy1_down3" ofType:@"png"];
        self.bombImage3=[UIImage imageWithContentsOfFile:bombPath3];
        //获取爆炸图片4
        NSString *bombPath4=[[NSBundle mainBundle]pathForResource:@"enemy1_down4" ofType:@"png"];
        self.bombImage4=[UIImage imageWithContentsOfFile:bombPath4];
        //获取飞机图片
        NSString *planePath=[[NSBundle mainBundle]pathForResource:@"hero1" ofType:@"png"];
        self.myPlaneImage=[UIImage imageWithContentsOfFile:planePath];
        //获取飞机图片
        NSString *planePath1=[[NSBundle mainBundle]pathForResource:@"hero2" ofType:@"png"];
        self.myPlaneImage1=[UIImage imageWithContentsOfFile:planePath1];
        
    }
    return self;
}

//所有的画图都是在这里去画的
- (void)drawRect:(CGRect)rect {
    //先画背景图片
    [self.backGroundImage drawInRect:[UIScreen mainScreen].bounds];
    //画一个分割线
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 400);
    CGContextAddLineToPoint(context,[UIScreen mainScreen].bounds.size.height-80, 400);
    CGContextStrokePath(context);
    //画出我的飞机
    if (myPlanePoint.x==0) {
        [self.myPlaneImage drawInRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2-30, [UIScreen mainScreen].bounds.size.height-70, 60, 60)];
    }
    else{
        if (myPlaneNum>=5) {
            [self.myPlaneImage drawInRect:CGRectMake(self.myPlanePoint.x-30, [UIScreen mainScreen].bounds.size.height-70, 60, 60)];
            myPlaneNum=0;
        }
        else{
            [self.myPlaneImage1 drawInRect:CGRectMake(self.myPlanePoint.x-30, [UIScreen mainScreen].bounds.size.height-70, 60, 60)];
        }
        
    }
    //画出子弹
    for (Bullets *bullet in bullets) {
        //根据子弹图片的实际大小来画子弹更加的真实
        [self.bulletImage drawInRect:CGRectMake(bullet.bulletPointX, bullet.bulletPointY, 5, 11)];
    }
    //画出敌人
    for (Enemys *enemy in enemys) {
        //根据子弹图片的实际大小来画子弹更加的真实
        [self.enemyImage drawInRect:CGRectMake(enemy.enemyPointX, enemy.enemyPointY, 57, 43)];
    }
    //画出爆炸
    NSMutableArray *arr=[bombs copy];

    for (BombS *bomb in arr) {
        //这里要注意和在mac上使用有些区别，这里必须使用cgpointvalue来，不然就报错了
        if (bomb.bombImgNum==1) {
            [self.bombImage1 drawInRect:CGRectMake(bomb.bombPointX, bomb.bombPointY, 57, 51)];
        }
        if (bomb.bombImgNum==2) {
            [self.bombImage2 drawInRect:CGRectMake(bomb.bombPointX, bomb.bombPointY, 57, 51)];
        }
        if (bomb.bombImgNum==3) {
            [self.bombImage3 drawInRect:CGRectMake(bomb.bombPointX, bomb.bombPointY, 57, 51)];
        }
        if (bomb.bombImgNum==4) {
            [self.bombImage4 drawInRect:CGRectMake(bomb.bombPointX, bomb.bombPointY, 57, 51)];
            bomb.bombImgNum=0;
            [bombs removeObject:bomb];
        }

    }

}


@end
