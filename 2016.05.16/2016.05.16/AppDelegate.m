//
//  AppDelegate.m
//  2016.05.16
//
//  Created by 顾明轩 on 16/5/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//实现label
@synthesize label_user,label_code;

//实现button
@synthesize button_showinfo,button_clearinfo;

//实现textfield
@synthesize textfield_user,textfield_code;

//实现textview
@synthesize textview_show;

//实现textfield求和用
@synthesize textfield_sum;
//实现button求和用
@synthesize button_sum;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //创建一个新的纯文本工程
    ViewController *root=[[ViewController alloc]init];
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController=root;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //视频学习的部分
    /*
    //UITextField文本输入框的学习
    //文本框只接收单行文本
    _textField=[[UITextField alloc]initWithFrame:CGRectMake(10, 40, 200, 50)];
    _textField.backgroundColor=[UIColor lightGrayColor];//设定背景颜色
    _textField.textColor=[UIColor blueColor];//设定文本颜色
//    textField.text=@"我擦!你看到我了";//设定文字颜色

    _textField.textAlignment=NSTextAlignmentCenter;//居中对齐
    _textField.keyboardAppearance=UIKeyboardAppearanceDefault;
//    _textField.keyboardType=UIKeyboardTypeNumberPad;//设定为数字键盘
    _textField.returnKeyType=UIReturnKeyGo;//设定return显示的内容是什么
    _textField.placeholder=@"请输入用户名";//设置显示的阴影，只有在文本框内没有内容的时候才显示，对齐方式取决于文本框的对齐方式
    _textField.secureTextEntry=YES;//安全加密输入的数字会变成点
    
    //多行文本框
    UITextView *tv=[[UITextView alloc]initWithFrame:CGRectMake(10, 100, 200, 50)];
    tv.backgroundColor=[UIColor lightGrayColor];
    tv.secureTextEntry=YES;//无效，也没有placeholder的属性
    tv.text=@"nima\nwca";//可以这样换行
    [self.window addSubview:tv];
    
    //实现获取输入的内容，添加一个按钮
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(220, 40, 50, 50)];
    button.backgroundColor=[UIColor greenColor];
    [button setTitle:@"取值" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    //放到窗口上
    [self.window addSubview:_textField];
    */
    //diy part
    
    //创建用户名的label
    label_user=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 60, 30)];
    label_user.text=@"用户名:";
    label_user.textAlignment=NSTextAlignmentCenter;
    label_user.font=[UIFont systemFontOfSize:13];
    label_user.textColor=[UIColor lightGrayColor];
    //创建密码的label
    label_code=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, 60, 30)];
    label_code.text=@"密码:";
    label_code.textAlignment=NSTextAlignmentCenter;
    label_code.font=[UIFont systemFontOfSize:13];
    label_code.textColor=[UIColor lightGrayColor];
    
    //创建输入用户名数据多输入框textfield
    textfield_user=[[UITextField alloc]initWithFrame:CGRectMake(80, 30, 180, 30)];
    textfield_user.backgroundColor=[UIColor lightGrayColor];
    textfield_user.textAlignment=NSTextAlignmentCenter;
    textfield_user.font=[UIFont systemFontOfSize:13];
    textfield_user.placeholder=@"请输入您的用户名...";
    //创建输入密码数据多输入框textfield
    textfield_code=[[UITextField alloc]initWithFrame:CGRectMake(80, 70, 180, 30)];
    textfield_code.backgroundColor=[UIColor lightGrayColor];
    textfield_code.textAlignment=NSTextAlignmentCenter;
    textfield_code.font=[UIFont systemFontOfSize:13];
    textfield_code.placeholder=@"请输入您的密码...";
    textfield_code.secureTextEntry=YES;
    
    //创建读取label和textfield数据的按钮
    button_showinfo=[[UIButton alloc]init];
    button_showinfo.frame=CGRectMake(90, 110, 50, 30);
    button_showinfo.backgroundColor=[UIColor lightGrayColor];
    [button_showinfo setTitle:@"显示" forState:UIControlStateNormal];
    button_showinfo.titleLabel.font=[UIFont systemFontOfSize:13];
    [button_showinfo addTarget:self action:@selector(showinfo:) forControlEvents:UIControlEventTouchUpInside];
    //创建清除label和textfield数据的按钮
    button_clearinfo=[[UIButton alloc]init];
    button_clearinfo.frame=CGRectMake(180, 110, 50, 30);
    button_clearinfo.backgroundColor=[UIColor lightGrayColor];
    [button_clearinfo setTitle:@"清除" forState:UIControlStateNormal];
    button_clearinfo.titleLabel.font=[UIFont systemFontOfSize:13];
    [button_clearinfo addTarget:self action:@selector(clearinfo:) forControlEvents:UIControlEventTouchUpInside];
    
    //新建一个多行输入框，用来显示信息
    textview_show=[[UITextView alloc]initWithFrame:CGRectMake(60, 150, 220, 45)];
    textview_show.backgroundColor=[UIColor lightGrayColor];
    textview_show.textAlignment=NSTextAlignmentCenter;
    textview_show.font=[UIFont systemFontOfSize:13];
    
    
    //求和用的textfield
    textfield_sum=[[UITextField alloc]initWithFrame:CGRectMake(80, 205, 180, 30)];
    textfield_sum.backgroundColor=[UIColor lightGrayColor];
    textfield_sum.font=[UIFont systemFontOfSize:13];
    textfield_sum.keyboardType=UIKeyboardTypeNumberPad;
    //求和用的button
    button_sum=[[UIButton alloc]initWithFrame:CGRectMake(10, 205, 50, 30)];
    [button_sum setTitle:@"求和" forState:UIControlStateNormal];
    button_sum.titleLabel.textAlignment=NSTextAlignmentCenter;
    button_sum.backgroundColor=[UIColor lightGrayColor];
    button_sum.titleLabel.textColor=[UIColor lightGrayColor];
    button_sum.titleLabel.font=[UIFont systemFontOfSize:13];
    [button_sum addTarget:self action:@selector(sum:) forControlEvents:UIControlEventTouchUpInside];
    
    //将控件添加到桌面上去
    [self.window addSubview:label_user];
    [self.window addSubview:label_code];
    [self.window addSubview:textfield_user];
    [self.window addSubview:textfield_code];
    [self.window addSubview:button_showinfo];
    [self.window addSubview:button_clearinfo];
    [self.window addSubview:textview_show];
    
    [self.window addSubview:textfield_sum];
    [self.window addSubview:button_sum];
    
    return YES;
}
//实现点击显示后的行为
-(void)showinfo:(UIButton *)infoSender
{
    textview_show.text=[NSString stringWithFormat:@"%@%@\n%@%@",label_user.text,textfield_user.text,label_code.text,textfield_code.text];
}

//实现点击显示后的行为
-(void)clearinfo:(UIButton *)infoSender
{
    textfield_user.text=@"";
    textfield_code.text=@"";
    textview_show.text=@"";
}

-(void)sum:(UIButton *)sumSender
{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"请注意" message:@"输入的为空!" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    if ([textfield_sum.text isEqualToString:@""]) {
        [alert show];
    }
    int sum=0;
    for (int i=0; i<=[textfield_sum.text intValue]; i++) {
        sum+=i;
    }
    textfield_sum.text=[NSString stringWithFormat:@"%d",sum];
    

    
}

//视频学习的部分
-(void)pushTap:(UIButton *)sender
{
//    NSLog(@"%@",_textField.text);//可以读取到
    //警报 说白了就是弹框
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"报警" message:@"读到了" delegate:self cancelButtonTitle:@"取消吧" otherButtonTitles:@"heihei",@"haha", nil];
//    [alert show];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
