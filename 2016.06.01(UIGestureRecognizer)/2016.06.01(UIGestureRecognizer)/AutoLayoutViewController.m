//
//  AutoLayoutViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AutoLayoutViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, WIDTH-10*2, 50)];
    label.text=@"xuanyenihao";
    label.textAlignment=NSTextAlignmentCenter;
    label.backgroundColor=[UIColor greenColor];
    label.autoresizingMask=UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:label];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT-50-20, WIDTH-10*2, 50)];
    
    label2.autoresizingMask=UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth |UIViewAutoresizingFlexibleTopMargin;
    label2.text=@"xuanyebuhao";
    label2.textAlignment=NSTextAlignmentCenter;
    label2.backgroundColor=[UIColor greenColor];
    [self.view addSubview:label2];
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
