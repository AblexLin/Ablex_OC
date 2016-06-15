//
//  ViewController.m
//  使用块来视图传值
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "OtherViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame=CGRectMake(0, 20, 320, 40);
    [self.btn setTitle:@"下个视图" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.btn];
}

-(void)tap{
    OtherViewController *other=[[OtherViewController alloc]init];
    other.passValue=^(NSString *str){
        self.str=str;
    };
    NSLog(@"%@",self.str);//确实能保持下来数据
    [self presentViewController:other animated:YES completion:nil];
}
@end
