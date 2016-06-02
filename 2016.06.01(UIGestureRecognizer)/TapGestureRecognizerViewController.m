//
//  TapGestureRecognizerViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "TapGestureRecognizerViewController.h"

@interface TapGestureRecognizerViewController ()

@end

@implementation TapGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    UITapGestureRecognizer *tgr1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap:)];
    tgr1.numberOfTapsRequired=1;//单击有效
    [self.view addGestureRecognizer:tgr1];
    
    UITapGestureRecognizer *tgr2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Tap2:)];
    tgr2.numberOfTapsRequired=2;//双击有效
    [self.view addGestureRecognizer:tgr2];
    
    
    //如何实现双击的时候不走单击的事件？
    [tgr1 requireGestureRecognizerToFail:tgr2];//双击需求失败的时候，才执行单击
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//单击事件
-(void)Tap:(id)sender
{
    NSLog(@"单击事件");
}

//双击事件
-(void)Tap2:(id)sender
{
    NSLog(@"双击事件");
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
