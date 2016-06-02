//
//  TransFormViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "TransFormViewController.h"

@interface TransFormViewController ()

@end

@implementation TransFormViewController
@synthesize label,flag;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    label=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 50)];
    label.backgroundColor=[UIColor cyanColor];
    label.text=@"我是可以动的";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    UIButton *move=[UIButton buttonWithType:UIButtonTypeSystem];
    move.frame=CGRectMake(100, 160, 40, 30);
    move.backgroundColor=[UIColor greenColor];
    move.layer.cornerRadius=5.0;
    [move setTitle:@"移动" forState:UIControlStateNormal];
    [move addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:move];
    
    UIButton *suofang=[UIButton buttonWithType:UIButtonTypeSystem];
    suofang.frame=CGRectMake(150, 160, 40, 30);
    suofang.backgroundColor=[UIColor greenColor];
    suofang.layer.cornerRadius=5.0;
    [suofang setTitle:@"缩放" forState:UIControlStateNormal];
    [suofang addTarget:self action:@selector(suofang:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:suofang];
    
    UIButton *rotation=[UIButton buttonWithType:UIButtonTypeSystem];
    rotation.frame=CGRectMake(200, 160, 40, 30);
    rotation.backgroundColor=[UIColor greenColor];
    rotation.layer.cornerRadius=5.0;
    [rotation setTitle:@"旋转" forState:UIControlStateNormal];
    [rotation addTarget:self action:@selector(rotation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rotation];
    
    flag=0;
}
-(void)move:(UIButton *)sender
{
    NSLog(@"点击了移动");
    if (flag==0) {
        label.transform=CGAffineTransformMakeTranslation(50, 50);
        flag=1;
    }
    else{
        label.transform=CGAffineTransformMakeTranslation(0, 0);
        flag=0;
    }
    
}
-(void)suofang:(UIButton *)sender
{
    NSLog(@"点击了缩放");
    if (flag==0) {
        label.transform=CGAffineTransformMakeScale(0.2, 0.2);
        flag=1;
    }
    else{
        label.transform=CGAffineTransformMakeScale(1, 1);
        flag=0;
    }
    
}
-(void)rotation:(UIButton *)sender
{
    NSLog(@"点击了旋转");
    if (flag==0) {
        label.transform=CGAffineTransformMakeRotation(90*M_PI/180);//角度转弧度，这里只接收弧度
        flag=1;
    }
    else{
        label.transform=CGAffineTransformMakeRotation(0);//角度转弧度，这里只接收弧度
        flag=0;
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
