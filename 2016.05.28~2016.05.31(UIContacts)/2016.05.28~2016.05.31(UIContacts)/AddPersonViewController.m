//
//  AddPersonViewController.m
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AddPersonViewController.h"

@interface AddPersonViewController ()

@end

@implementation AddPersonViewController
@synthesize textfield_name,textfield_home,textfield_mail,textfield_telp;
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    UIBarButtonItem *newview_left=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(newview_left_Tap)];
    UIBarButtonItem *newview_right=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(newview_right_Tap)];
    self.navigationItem.leftBarButtonItem=newview_left;
    self.navigationItem.rightBarButtonItem=newview_right;
    self.navigationItem.title=@"新建联系人";
    self.navigationItem.rightBarButtonItem.enabled=NO;
    //设置头像按钮
    UIView *cover=[[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 100)];
    cover.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:cover];
    UIButton *btn_face=[UIButton buttonWithType:UIButtonTypeCustom];
    btn_face.frame=CGRectMake(120, 10, 80, 80);
    btn_face.layer.cornerRadius=40.0;
    btn_face.layer.masksToBounds=40.0;
    btn_face.backgroundColor=[UIColor lightGrayColor];
    [btn_face setTitle:@"头像" forState:UIControlStateNormal];
    [cover addSubview:btn_face];
    //设置姓名文本
    UILabel *label_name=[[UILabel alloc]initWithFrame:CGRectMake(60, 180, 70, 30)];
    UILabel *label_telp=[[UILabel alloc]initWithFrame:CGRectMake(60, 210, 70, 30)];
    UILabel *label_mail=[[UILabel alloc]initWithFrame:CGRectMake(60, 240, 70, 30)];
    UILabel *label_home=[[UILabel alloc]initWithFrame:CGRectMake(60, 270, 70, 30)];
    label_name.text=@"姓名:";
    label_telp.text=@"电话:";
    label_mail.text=@"邮件:";
    label_home.text=@"住宅:";
    label_name.textAlignment=NSTextAlignmentCenter;
    label_telp.textAlignment=NSTextAlignmentCenter;
    label_mail.textAlignment=NSTextAlignmentCenter;
    label_home.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label_name];
    [self.view addSubview:label_telp];
    [self.view addSubview:label_mail];
    [self.view addSubview:label_home];
    //设置输入框
    textfield_name=[[UITextField alloc]initWithFrame:CGRectMake(140, 180, 160, 30)];
    textfield_telp=[[UITextField alloc]initWithFrame:CGRectMake(140, 210, 160, 30)];
    textfield_mail=[[UITextField alloc]initWithFrame:CGRectMake(140, 240, 160, 30)];
    textfield_home=[[UITextField alloc]initWithFrame:CGRectMake(140, 270, 160, 30)];
    textfield_name.placeholder=@"请输入姓名...";
    textfield_telp.placeholder=@"请输入电话...";
    textfield_mail.placeholder=@"请输入邮件...";
    textfield_home.placeholder=@"请输入住宅...";
    //取消首字母自动大写
    textfield_name.autocapitalizationType=UITextAutocapitalizationTypeNone;
    textfield_telp.autocapitalizationType=UITextAutocapitalizationTypeNone;
    textfield_mail.autocapitalizationType=UITextAutocapitalizationTypeNone;
    textfield_home.autocapitalizationType=UITextAutocapitalizationTypeNone;
    //取消拼写检查
    textfield_name.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_telp.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_mail.autocorrectionType=UITextAutocorrectionTypeNo;
    textfield_home.autocorrectionType=UITextAutocorrectionTypeNo;
    [textfield_name addTarget:self action:@selector(editTextField:) forControlEvents:UIControlEventEditingChanged];
    textfield_name.clearButtonMode=UITextFieldViewModeWhileEditing;//设置输入的时候右边有圆圈的xx按钮
    [textfield_telp addTarget:self action:@selector(editTextField:) forControlEvents:UIControlEventEditingChanged];
    textfield_telp.clearButtonMode=UITextFieldViewModeWhileEditing;//设置输入的时候右边有圆圈的xx按钮
    [textfield_mail addTarget:self action:@selector(editTextField:) forControlEvents:UIControlEventEditingChanged];
    textfield_mail.clearButtonMode=UITextFieldViewModeWhileEditing;//设置输入的时候右边有圆圈的xx按钮
    [textfield_home addTarget:self action:@selector(editTextField:) forControlEvents:UIControlEventEditingChanged];
    textfield_home.clearButtonMode=UITextFieldViewModeWhileEditing;//设置输入的时候右边有圆圈的xx按钮
    [self.view addSubview:textfield_name];
    [self.view addSubview:textfield_telp];
    [self.view addSubview:textfield_mail];
    [self.view addSubview:textfield_home];
}
//点击了取消按钮
- (void)newview_left_Tap
{
    //返回主界面
    [self dismissViewControllerAnimated:YES completion:nil];
}
//点击了完成按钮
- (void)newview_right_Tap
{
    //传递数据给主界面
    [self.delegate passValueName:textfield_name.text andTelp:textfield_telp.text andMail:textfield_mail.text andHome:textfield_home.text];
    //返回主界面
    [self dismissViewControllerAnimated:YES completion:nil];
}
//表格输入的时候完成按钮就可以点击，否则灰掉
- (void)editTextField:(UITextField *)sender
{
    if ([sender.text isEqualToString:@""]) {
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
    else{
        self.navigationItem.rightBarButtonItem.enabled=YES;
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
