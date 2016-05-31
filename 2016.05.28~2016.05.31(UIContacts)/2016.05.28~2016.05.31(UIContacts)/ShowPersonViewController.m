//
//  ShowPersonViewController.m
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ShowPersonViewController.h"

@interface ShowPersonViewController ()

@end

@implementation ShowPersonViewController

@synthesize textfield_name,textfield_home,textfield_mail,textfield_telp;
@synthesize text_home,text_mail,text_name,text_telp;
@synthesize indexPathForMainToShow;
@synthesize btnDelete;

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    UIBarButtonItem *newview_right=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(newview_right_Tap:)];
    self.navigationItem.rightBarButtonItem=newview_right;
    
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
    
    //赋值
    textfield_name.text=text_name;
    textfield_telp.text=text_telp;
    textfield_mail.text=text_mail;
    textfield_home.text=text_home;
    
    textfield_name.enabled=NO;
    textfield_telp.enabled=NO;
    textfield_mail.enabled=NO;
    textfield_home.enabled=NO;

    [self.view addSubview:textfield_name];
    [self.view addSubview:textfield_telp];
    [self.view addSubview:textfield_mail];
    [self.view addSubview:textfield_home];
    
    //添加删除联系人的按钮
    btnDelete=[UIButton buttonWithType:UIButtonTypeSystem];
    btnDelete.frame=CGRectMake(77, 300, 160, 30);
    btnDelete.backgroundColor=[UIColor redColor];
    btnDelete.layer.cornerRadius=15.0;
    [btnDelete setTitle:@"删除联系人" forState:UIControlStateNormal];
    [btnDelete addTarget:self action:@selector(DeleContact:) forControlEvents:UIControlEventTouchUpInside];
    btnDelete.hidden=YES;
    [self.view addSubview:btnDelete];
    
    self.title=textfield_name.text;
    
}

//点击删除联系人的按钮
-(void)DeleContact:(UIButton *)sender
{
    [self.delegate deleteContact:indexPathForMainToShow];
    [self.navigationController popViewControllerAnimated:YES];
}

//点击了编辑按钮
- (void)newview_right_Tap:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"编辑"]) {
        sender.title=@"完成";
        textfield_name.enabled=YES;
        textfield_telp.enabled=YES;
        textfield_mail.enabled=YES;
        textfield_home.enabled=YES;
        btnDelete.hidden=NO;
        self.title=@"";
    }
    else{
        //如果是完成按钮，说明点击了编辑，那么久把数据传递回去主界面
        [self.delegate passValueName:textfield_name.text andTelp:textfield_telp.text andMail:textfield_mail.text andHome:textfield_home.text andIndexPath:self.indexPathForMainToShow];
        //返回主界面
        [self.navigationController popViewControllerAnimated:YES];
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
