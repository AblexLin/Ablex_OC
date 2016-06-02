//
//  DetailViewController.m
//  2016.06.02(平板上的分割视图)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"详细信息";
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(350, 100, 200, 40)];
    self.label.text=@"我去者也可以吗？";
    self.label.backgroundColor=[UIColor greenColor];
    self.label.textAlignment=NSTextAlignmentCenter;
    
    [self.view addSubview:label];
}

-(void)passStr:(NSString *)_strNum
{
    self.label.text=_strNum;
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
