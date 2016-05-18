//
//  StudyViewController.m
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "StudyViewController.h"
#import "ViewController.h"

@interface StudyViewController ()

@end

@implementation StudyViewController
@synthesize btnForReturn;
@synthesize textfield_secondview,button_secondview;
@synthesize save_the_firstview_data;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor magentaColor];
    //这里还可以添加很多按钮，换句话说也就是新的界面新的功能
    btnForReturn=[UIButton buttonWithType:UIButtonTypeSystem];
    btnForReturn.frame=CGRectMake(70, 180, 180, 40);
    btnForReturn.backgroundColor=[UIColor purpleColor];
    btnForReturn.layer.cornerRadius=8.2;
    [btnForReturn setTitle:@"返回上一个视图" forState:UIControlStateNormal];
    [btnForReturn addTarget:self action:@selector(pushTapForReturn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnForReturn];
    
    //创建一个输入框和按钮，并在新的视图中显示，来回传递数据
    textfield_secondview=[[UITextField alloc]initWithFrame:CGRectMake(70, 230, 180, 40)];
    textfield_secondview.backgroundColor=[UIColor greenColor];
    //textfield_firstview.layer.cornerRadius=10;//这样设置圆角也可以
    textfield_secondview.borderStyle=UITextBorderStyleRoundedRect;
    
    //将数据传递过来，使用一个变量
    textfield_secondview.text=save_the_firstview_data;
    
    button_secondview=[UIButton buttonWithType:UIButtonTypeSystem];
    [button_secondview setFrame:CGRectMake(70, 280, 180, 40)];
    [button_secondview setTitle:@"第二个视图的按钮" forState:UIControlStateNormal];
    [button_secondview setBackgroundColor:[UIColor greenColor]];
    button_secondview.layer.cornerRadius=10.0;
    [button_secondview addTarget:self action:@selector(button_firstview:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button_secondview];
    [self.view addSubview:textfield_secondview];
    
}

//第二个视图的按钮点击事件
-(void)button_firstview:(id)sender
{
    [self.selfPass passstr:self.textfield_secondview.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//返回上一个视图
-(void)pushTapForReturn:(id)sender
{
    //ViewController *jiude=[[ViewController alloc]init];
    //[self presentViewController:jiude animated:YES completion:nil];
    //这样的方法是无限新建一个视图，而不是返回上一个视图，使用下面的行为
    [self dismissViewControllerAnimated:YES completion:nil];//销毁当前的视图
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
