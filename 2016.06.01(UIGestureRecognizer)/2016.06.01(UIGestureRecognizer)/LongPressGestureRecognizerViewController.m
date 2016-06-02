//
//  LongPressGestureRecognizerViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "LongPressGestureRecognizerViewController.h"

@interface LongPressGestureRecognizerViewController ()

@end

@implementation LongPressGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the
    self.view.backgroundColor=[UIColor grayColor];
    
    
    UILongPressGestureRecognizer *lpgr=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(lpgr:)];
    lpgr.minimumPressDuration=4;//最少按下四秒才响应
    
    [self.view addGestureRecognizer:lpgr];
}

-(void)lpgr:(UILongPressGestureRecognizer *)sender
{
//    NSLog(@"长按");
    
    if (sender.state==UIGestureRecognizerStateBegan) {
        NSLog(@"长按开始");
    }
    if (sender.state==UIGestureRecognizerStateEnded) {
//        NSLog(@"长按结束");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
