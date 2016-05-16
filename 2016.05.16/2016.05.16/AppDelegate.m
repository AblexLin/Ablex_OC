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
    
    //文本输入框(UITextField)
    //文本框只接收单行文本
    self.textfield=[[UITextField alloc]initWithFrame:CGRectMake(10, 40, 200, 50)];      //初始化个对象
    self.textfield.backgroundColor=[UIColor lightGrayColor];                            //设定背景颜色
    self.textfield.textColor=[UIColor blueColor];                                       //设定文本颜色
    self.textfield.text=@"我擦!你看到我le";                                               //设定文字颜色
    self.textfield.textAlignment=NSTextAlignmentCenter;                                 //设定居中对齐
    self.textfield.keyboardAppearance=UIKeyboardAppearanceDefault;                      //设定显示模式
    self.textfield.keyboardType=UIKeyboardTypeNumberPad;                                //设定数字键盘
    self.textfield.returnKeyType=UIReturnKeyGo;                                         //设定返回模式
    self.textfield.placeholder=@"请输入用户名";                                           //设定显示的阴影，只有在文本框内没有内容的时候才显示，对齐方式取决于文本框的对齐方式
    self.textfield.secureTextEntry=YES;                                                 //设定安全加密输入的数字会变成点
    
    //多行文本框(UITextView)
    self.textview=[[UITextView alloc]initWithFrame:CGRectMake(10, 100, 200, 50)];       //初始化个对象
    self.textview.backgroundColor=[UIColor lightGrayColor];                             //设定背景颜色
    self.textview.secureTextEntry=YES;                                                  //设定无效，也没有placeholder的属性
    self.textview.text=@"nima\nwca";                                                    //可以这样换行
    
    //实现获取输入的内容，添加一个按钮
    self.button=[[UIButton alloc]initWithFrame:CGRectMake(220, 40, 50, 50)];            //初始化个按钮
    self.button.backgroundColor=[UIColor greenColor];                                   //设定背景颜色
    [self.button setTitle:@"取值le" forState:UIControlStateNormal];                      //设定按钮显示
    [self.button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];//添加按钮点击事件

    //放到窗口上
    //[self.window addSubview:self.textfield];
    //[self.window addSubview:self.textview];
    //[self.window addSubview:self.button];
    
    //diy part
    //创建用户名的label
    label_user=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 60, 30)];                //初始化个对象
    label_user.text=@"用户名:";                                                           //设定显示文本
    label_user.textAlignment=NSTextAlignmentCenter;                                      //设定对齐方式
    label_user.font=[UIFont systemFontOfSize:13];                                        //设定字体大小
    label_user.textColor=[UIColor lightGrayColor];                                       //设定字体颜色
    //创建密码的label
    label_code=[[UILabel alloc]initWithFrame:CGRectMake(10, 70, 60, 30)];                //同上
    label_code.text=@"密码:";
    label_code.textAlignment=NSTextAlignmentCenter;
    label_code.font=[UIFont systemFontOfSize:13];
    label_code.textColor=[UIColor lightGrayColor];
    
    //创建输入用户名数据多输入框textfield
    textfield_user=[[UITextField alloc]initWithFrame:CGRectMake(80, 30, 180, 30)];       //初始化个对象
    textfield_user.backgroundColor=[UIColor lightGrayColor];                             //设定背景颜色
    textfield_user.textAlignment=NSTextAlignmentCenter;                                  //设定对齐方式
    textfield_user.font=[UIFont systemFontOfSize:13];                                    //设定字体大小
    textfield_user.placeholder=@"请输入您的用户名...";                                      //设定阴影效果
    //创建输入密码数据多输入框textfield
    textfield_code=[[UITextField alloc]initWithFrame:CGRectMake(80, 70, 180, 30)];       //同上
    textfield_code.backgroundColor=[UIColor lightGrayColor];
    textfield_code.textAlignment=NSTextAlignmentCenter;
    textfield_code.font=[UIFont systemFontOfSize:13];
    textfield_code.placeholder=@"请输入您的密码...";
    textfield_code.secureTextEntry=YES;                                                  //设定隐藏密码
    textfield_code.borderStyle=UITextBorderStyleRoundedRect;                             //设定圆角边框
    textfield_code.clearsOnBeginEditing=YES;                                             //一输入就清空
    
    //创建读取label和textfield数据的按钮
    button_showinfo=[[UIButton alloc]init];                                              //初始化个按钮
    button_showinfo.frame=CGRectMake(90, 110, 50, 30);                                   //设置按钮大小
    button_showinfo.backgroundColor=[UIColor lightGrayColor];                            //设置按钮背景
    [button_showinfo setTitle:@"显示" forState:UIControlStateNormal];                     //设置按钮文字
    button_showinfo.titleLabel.font=[UIFont systemFontOfSize:13];                        //设置文字大小
    [button_showinfo addTarget:self action:@selector(showinfoTap:) forControlEvents:UIControlEventTouchUpInside];//设置按钮行为
    //创建清除label和textfield数据的按钮
    button_clearinfo=[[UIButton alloc]init];                                             //同上
    button_clearinfo.frame=CGRectMake(180, 110, 50, 30);
    button_clearinfo.backgroundColor=[UIColor lightGrayColor];
    [button_clearinfo setTitle:@"清除" forState:UIControlStateNormal];
    button_clearinfo.titleLabel.font=[UIFont systemFontOfSize:13];
    [button_clearinfo addTarget:self action:@selector(clearinfoTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //新建一个多行输入框，用来显示信息
    textview_show=[[UITextView alloc]initWithFrame:CGRectMake(60, 150, 220, 45)];        //初始化个对象
    textview_show.backgroundColor=[UIColor lightGrayColor];                              //设置背景颜色
    textview_show.textAlignment=NSTextAlignmentCenter;                                   //设置对齐方式
    textview_show.font=[UIFont systemFontOfSize:13];                                     //设置字体大小
    
    
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
    [button_sum addTarget:self action:@selector(sumTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //将控件添加到桌面上去
    //[self.window addSubview:label_user];
    //[self.window addSubview:label_code];
    //[self.window addSubview:textfield_user];
    //[self.window addSubview:textfield_code];
    //[self.window addSubview:button_showinfo];
    //[self.window addSubview:button_clearinfo];
    //[self.window addSubview:textview_show];
    //将求和的控件添加到桌面
    //[self.window addSubview:textfield_sum];
    //[self.window addSubview:button_sum];
    
    //switch控件
    UISwitch *switch1=[[UISwitch alloc]initWithFrame:CGRectMake(10, 30, 50, 50)];
    [switch1 addTarget:self action:@selector(switchTap:) forControlEvents:UIControlEventValueChanged];
    switch1.tag=15;
    
    switch1.onTintColor=[UIColor grayColor];        //打开时候按钮的颜色
    switch1.tintColor=[UIColor yellowColor];        //关闭时候按钮的颜色
    switch1.thumbTintColor=[UIColor orangeColor];   //开关圆点的按钮颜色
    
    UISwitch *switch2=[[UISwitch alloc]initWithFrame:CGRectMake(80, 30, 50, 50)];
    [switch2 addTarget:self action:@selector(switchTap:) forControlEvents:UIControlEventValueChanged];
    switch2.tag=30;
    //上面两个开关都调用了swch这个行为，那么，在行为里面如何区别到底是哪一个按钮呢？
    //一般情况下我们把这个两个开关在h文件里面声明为类的数据
    //今天使用新的办法，tag～～～
    //[self.window addSubview:switch1];
    //[self.window addSubview:switch2];
    
    if ([switch1 isOn]) {
        NSLog(@"如果窗口打开了");
        switch1.backgroundColor=[UIColor grayColor];
    }
    else{
        NSLog(@"如果窗口关闭了");
        switch1.backgroundColor=[UIColor blackColor];
    }
    
    //分段控件UISegmentedControl
    NSArray *array=[NSArray arrayWithObjects:@"轩爷",@"首长",@"老人头", nil];                      //定制一个数组用来作为分段的显示名称
    UISegmentedControl *seg=[[UISegmentedControl alloc]initWithItems:array];                    //初始化一个分段控件
    seg.frame=CGRectMake(10, 30, 200, 30);                                                      //设定控件大小
    seg.selectedSegmentIndex=0;                                                                 //默认选择第0个
    seg.tintColor=[UIColor purpleColor];                                                        //分段的颜色
    [seg addTarget:self action:@selector(segTap:) forControlEvents:UIControlEventValueChanged]; //设置切换行为
    
    label_user=[[UILabel alloc]initWithFrame:CGRectMake(220, 30, 70, 30)];
    label_user.textColor=[UIColor blueColor];
    label_user.text=[seg titleForSegmentAtIndex:0];
    
    //添加到窗口
    //[self.window addSubview:label_user];
    //[self.window addSubview:seg];
    
    //slider
    UISlider *slider=[[UISlider alloc]initWithFrame:CGRectMake(10, 30, 200, 10)];
    slider.minimumValue=0;                                                                              //设置最小值
    slider.maximumValue=10;                                                                             //设置最大值
    slider.value=5;                                                                                     //设置当前值
    slider.minimumTrackTintColor=[UIColor redColor];                                                    //前半段进度条颜色
    slider.maximumTrackTintColor=[UIColor greenColor];                                                  //后半段进度条颜色
    slider.thumbTintColor=[UIColor blackColor];                                                         //滑块圆点的颜色
    [slider addTarget:self action:@selector(sliderTap:) forControlEvents:UIControlEventValueChanged];   //设置行为
    
    textfield_user=[[UITextField alloc]initWithFrame:CGRectMake(220, 30, 50, 20)];
    textfield_user.enabled=NO;                                                                          //文本框不能输入了
    
    //[self.window addSubview:textfield_user];
    //[self.window addSubview:slider];
    
    //UIAlertController的使用，比较复杂，了解下
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"这算什么" message:@"我错了" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:cancel];
    [alert addAction:ok];
    [root presentViewController:alert animated:YES completion:nil];

    return YES;
}
//实现按钮点击的行为
-(void)buttonTap:(UIButton *)sender
{
    NSLog(@"%@",self.textfield.text);//可以读取到
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"报警" message:@"读到了" delegate:self cancelButtonTitle:@"取消吧" otherButtonTitles:@"heihei",@"haha", nil];
    [alert show];
}

//实现点击显示后的行为
-(void)showinfoTap:(UIButton *)infoSender
{
    textview_show.text=[NSString stringWithFormat:@"%@%@\n%@%@",label_user.text,textfield_user.text,label_code.text,textfield_code.text];
}
//实现点击清除后的行为
-(void)clearinfoTap:(UIButton *)infoSender
{
    textfield_user.text=@"";
    textfield_code.text=@"";
    textview_show.text=@"";
}
//实现点击求和后的行为
-(void)sumTap:(UIButton *)sumSender
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

//实现switch切换的行为
-(void)switchTap:(UISwitch *)sender
{
    if (sender.tag==15) {
        UISwitch *swch=(UISwitch *)[self.window viewWithTag:30];//返回的是uiview所以强制转换
        if (sender.on==YES) {
            NSLog(@"开关1打开了!");
            swch.on=YES;
        }
        else{
            NSLog(@"开关1关闭了!");
            swch.on=NO;
        }
    }
    else if(sender.tag==30)
    {
        UISwitch *swch=(UISwitch *)[self.window viewWithTag:15];
        if (sender.on==YES) {
            NSLog(@"开关2打开了!");
            swch.on=YES;
        }
        else{
            NSLog(@"开关2关闭了!");
            swch.on=NO;
        }
    }
    
}
//实现分段控件切换的行为
-(void)segTap:(UISegmentedControl *)sender
{
    label_user.text=[sender titleForSegmentAtIndex:sender.selectedSegmentIndex];
}
//实现滑块滑动的行为
-(void)sliderTap:(UISlider *)sender
{
    textfield_user.text=[NSString stringWithFormat:@"%g",sender.value];
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
