//
//  OtherViewController.m
//  使用块来视图传值
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController
@synthesize passValue,namea;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn=[UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame=CGRectMake(0, 20, 320, 40);
    [self.btn setTitle:@"发送数据" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
    namea=@"很无奈";
    [self.view addSubview:self.btn];
}
-(void)tap{

    if (passValue) {
        passValue(namea);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
