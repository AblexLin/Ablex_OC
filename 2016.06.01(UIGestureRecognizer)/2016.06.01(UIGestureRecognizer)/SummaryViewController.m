//
//  SummaryViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor cyanColor];
    
    UITapGestureRecognizer *tgr1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianji)];
    tgr1.numberOfTapsRequired=1;
    [self.view addGestureRecognizer:tgr1];
    
    UITapGestureRecognizer *tgr2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dianji2)];
    tgr2.numberOfTapsRequired=2;
    [self.view addGestureRecognizer:tgr2];
    
    [tgr1 requireGestureRecognizerToFail:tgr2];
    
    UISwipeGestureRecognizer *sgr=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(huadong)];
    [sgr setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.view addGestureRecognizer:sgr];
    
    
}
-(void)dianji2
{
    NSLog(@"双击了界面");
}
-(void)dianji
{
    NSLog(@"单击了界面");
}
//触摸的四种类型
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始触摸");
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸取消");
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸移动");
}

@end
