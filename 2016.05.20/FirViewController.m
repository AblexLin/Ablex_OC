//
//  FirViewController.m
//  2016.05.20
//
//  Created by 顾明轩 on 16/5/21.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "FirViewController.h"

@interface FirViewController ()

@end

@implementation FirViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tbc下面的标签标题
    self.tabBarItem.title=@"消息";
    
    //设置tbc下面的背景颜色
    self.tabBarController.tabBar.barTintColor=[UIColor whiteColor];
    
    //设置tbc下面的按钮着色
    self.tabBarController.tabBar.tintColor=[UIColor greenColor];
    
    //设置系统按钮格式
    UITabBarItem *tbi=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:0];
    self.tabBarItem=tbi;
    
    //设置标题栏标题
    self.navigationItem.title=@"主视图";
    
    //设置导航栏着色
    self.navigationController.navigationBar.barTintColor=[UIColor cyanColor];
    
    //添加分段控制按钮
    NSArray *array_str=[NSArray arrayWithObjects:@"消息",@"电话", nil];
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:array_str];
    seg.selectedSegmentIndex=0;
    seg.tintColor=[UIColor whiteColor];
    
    //设置导航栏上的中间按钮
    self.navigationItem.titleView=seg;
    
    //设置导航栏上的左边按钮
    UIBarButtonItem *right=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushTap)];
    
    //设置导航栏上的右边按钮
    UIBarButtonItem *left=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(pushTap)];
    
    //将设置好模式的左按钮添加到导航栏上面去
    self.navigationItem.rightBarButtonItem=right;
    //设置右边按钮的图案着色
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor whiteColor];
    
    //将设置好模式的右按钮添加到导航栏上面去
    self.navigationItem.leftBarButtonItem=left;
    
    //设置左边按钮的图案着色
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor whiteColor];
}
-(void)pushTap
{
    NSLog(@"点击事件");
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
