//
//  SecViewController.m
//  2016.05.20
//
//  Created by 顾明轩 on 16/5/21.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tbc下面的标签标题
    self.tabBarItem.title=@"联系人";

    //设置tbc下面的背景颜色
    self.tabBarController.tabBar.barTintColor=[UIColor whiteColor];
    
    //设置tbc下面的按钮着色
    self.tabBarController.tabBar.tintColor=[UIColor greenColor];

    //设置系统按钮格式
    UITabBarItem *tbi=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    self.tabBarItem=tbi;
    
    //设置标题栏标题
    self.navigationItem.title=@"联系人";
    
    //设置标题颜色
    self.navigationController.navigationBar.barTintColor=[UIColor cyanColor];
    
    UIBarButtonItem *bti=[[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(pushTap)];
    self.navigationItem.rightBarButtonItem=bti;

}
-(void)pushTap
{
    NSLog(@"点击事件2");
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
