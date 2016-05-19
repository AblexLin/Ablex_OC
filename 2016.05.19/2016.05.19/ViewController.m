//
//  ViewController.m
//  2016.05.19
//
//  Created by 顾明轩 on 16/5/19.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor redColor];
    self.tabBarItem.title=@"one";
//    self.tabBarItem.image=[UIImage imageNamed:@"11.png"];
    self.tabBarItem.imageInsets=UIEdgeInsetsZero;
    self.navigationController.navigationBar.backgroundColor=[UIColor orangeColor];

    NSArray *arr=[NSArray arrayWithObjects:@"轩爷",@"老人头", nil];
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:arr];
    seg.selectedSegmentIndex=0;

    UIBarButtonItem *barbuttonitem=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pushTap)];
    
    self.navigationItem.titleView=seg;
    self.navigationItem.leftBarButtonItem=barbuttonitem;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor orangeColor];
    self.navigationItem.rightBarButtonItem=barbuttonitem;
}

-(void)pushTap
{
    NSLog(@"aaaaa");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
