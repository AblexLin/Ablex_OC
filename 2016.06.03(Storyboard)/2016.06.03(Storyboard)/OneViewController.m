//
//  OneViewController.m
//  2016.06.03(Storyboard)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "OneViewController.h"
#import "MainViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//视图将要出现
- (void)viewWillAppear:(BOOL)animated
{
    //视图即将出现的时候把保存的数据传递给标签的文本显示
    self.label.text=self.strr;
}

//这个行为很有趣哦，如果在这里设置数据的话，那么久能够看到数据变化的一瞬间哦
- (void)viewDidAppear:(BOOL)animated
{
    //self.label.text=self.strr;

}

//内存不足快要报警的时候会执行这里的事件
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//返回上一个视图的按钮
- (IBAction)backToLastView:(id)sender {
    MainViewController *main=[[MainViewController alloc]init];
    [self.delegate passValue:self.label.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
