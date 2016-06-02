//
//  ViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//触摸的四个事件，视图控制器自带的，其他的都需要自己新建一个类的对象来实现
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    (NSSet<UITouch *> *)touches集合里是手指的个数
    //mUITouch *touch=[touches anyObject];
    
   // NSLog(@"触摸开始,触摸手指个数%d,触摸点击次数%d",[touches count],touch.tapCount);
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint point=[touch locationInView:self.view];
    NSLog(@"触摸移动,x=%g,y=%g",point.x,point.y);
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸取消");//比如来电话的时候，会执行这里哦
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"触摸结束");
}

@end
