//
//  SecondViewController.m
//  2016.05.19
//
//  Created by 顾明轩 on 16/5/19.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
    self.tabBarItem.title=@"two";
//    self.tabBarItem.image=[UIImage imageNamed:@"2.png"];
    self.navigationController.navigationBar.backgroundColor=[UIColor redColor];
    
    NSArray *arr=[NSArray arrayWithObjects:@"轩爷2",@"老人头2", nil];
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:arr];
    seg.selectedSegmentIndex=0;
    
    UIBarButtonItem *barbuttonitem=[[UIBarButtonItem alloc]initWithTitle:@"返回2" style:UIBarButtonItemStylePlain target:self action:@selector(pushTap)];
    
    self.navigationItem.titleView=seg;
    self.navigationItem.leftBarButtonItem=barbuttonitem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor orangeColor];
    self.navigationItem.rightBarButtonItem=barbuttonitem;
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
