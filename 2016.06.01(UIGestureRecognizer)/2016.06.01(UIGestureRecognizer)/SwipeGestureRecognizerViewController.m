//
//  SwipeGestureRecognizerViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "SwipeGestureRecognizerViewController.h"

@interface SwipeGestureRecognizerViewController ()

@end

@implementation SwipeGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor yellowColor];
    
    //设置识别的滑动方向，默认是左到右
    UISwipeGestureRecognizer *sgrLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    sgrLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:sgrLeft];
    
    UISwipeGestureRecognizer *sgrRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    sgrRight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:sgrRight];
    
    UISwipeGestureRecognizer *sgrDown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown:)];
    sgrDown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:sgrDown];
    
    UISwipeGestureRecognizer *sgrUp=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp:)];
    sgrUp.direction=UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:sgrUp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//实现滑动事件
-(void)swipeLeft:(id)sender
{
    NSLog(@"向左滑动啦");
}
-(void)swipeRight:(id)sender
{
    NSLog(@"向右滑动啦");
}
-(void)swipeDown:(id)sender
{
    NSLog(@"向下滑动啦");
}
-(void)swipeUp:(id)sender
{
    NSLog(@"向上滑动啦");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
