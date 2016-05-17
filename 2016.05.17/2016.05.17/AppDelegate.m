//
//  AppDelegate.m
//  2016.05.17
//
//  Created by 顾明轩 on 16/5/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//声明里相关控件的实现
@synthesize button_first,progressview_first;
@synthesize button_use_tag;
@synthesize aiv,arr;
@synthesize pickerview;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化一个纯文本窗口
    ViewController *root=[[ViewController alloc]init];
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController=root;
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //先初始化一个按钮留待后用
    button_first=[UIButton buttonWithType:UIButtonTypeRoundedRect];   //初始化一个按钮对象
    [button_first setFrame:CGRectMake(220, 30, 50, 30)];              //设置按钮位置和大小
    [button_first setBackgroundColor:[UIColor orangeColor]];          //设置按钮的背景颜色
    [button_first setTitle:@"滑动" forState:UIControlStateNormal];     //设置按钮的文本名称
    [button_first setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//设置按钮的文本颜色
    button_first.layer.cornerRadius=5;                                //设置圆角的按钮,这里的layer是uiview的属性
    [button_first addTarget:self action:@selector(butttonPushTap:) forControlEvents:UIControlEventTouchUpInside];//定制按钮的行为，每次点击按钮后，将进度条前进%10
    
    //进度条(UIProgressView)
    //从0～1无法修改最大最小值,slider的默认最大最小值也是0～1,但可以修改
    progressview_first=[[UIProgressView alloc]initWithFrame:CGRectMake(10, 45, 200, 30)];//初始化一个进度条对象
    progressview_first.progress=0;                                    //设置进度条当前位置
    progressview_first.trackTintColor=[UIColor lightGrayColor];       //设置前半段背景颜色
    progressview_first.progressTintColor=[UIColor greenColor];        //设置后半段背景颜色
    [progressview_first setProgress:0.5 animated:YES];                //设置动画滑倒到0.5
    progressview_first.progressViewStyle=UIProgressViewStyleBar;      //设置进度条样式不带圆角
    progressview_first.progressViewStyle=UIProgressViewStyleDefault;  //设置进度条样式带圆角

    //活动指示器(UIActivityIndicatorView)菊花符号
    aiv=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];//初始化一个菊花对象
    aiv.frame=CGRectMake(280, 35, 20, 20);                             //设置菊花所占位置的大小，菊花本身大小不能修改，除非设置大白的样式
    aiv.tintColor=[UIColor greenColor];                                //设置菊花的前景颜色
    aiv.hidesWhenStopped=NO;                                           //设置菊花停止时不隐藏，默认停止时隐藏不显示
    //[aiv startAnimating];                                            //设置菊花开始旋转
    //[aiv startAnimating];                                            //设置菊花停止旋转
    
    //图片(UIImage)
    //UIImage *image=[UIImage imageNamed:@"lufei.png"];                //用到了缓存，不好
    NSString *path=[[NSBundle mainBundle] pathForResource:@"lufei" ofType:@"png"];
    UIImage *image=[UIImage imageWithContentsOfFile:path];             //读取路径下的文件，不占用内存

    //图片视图(UIImageView)
    imageview=[[UIImageView alloc]initWithFrame:CGRectMake(10, 70, 200, 174)];//初始化一个图片视图对象
    imageview.backgroundColor=[UIColor greenColor];                    //设置图片视图的背景颜色
    imageview.image=image;                                             //把上面在路径里读取来的图片添加到视图上显示
    
    //日期选择器(UIDatePicker)
    //就是时钟里面的滑动显示时间日期的控件
    UIDatePicker *datepiker=[[UIDatePicker alloc]initWithFrame:CGRectMake(10, 274, 320, 200)];//初始化一个日期选择器对象
    datepiker.locale=[NSLocale localeWithLocaleIdentifier:@"zh-Hans"];  //修改为中文显示
    datepiker.datePickerMode=UIDatePickerModeTime;                      //只显示时间
    datepiker.tintColor=[UIColor greenColor];                           //着色修改无效
    datepiker.backgroundColor=[UIColor lightGrayColor];                 //设置背景颜色
    NSLog(@"ca%@",datepiker.date);                                      //读取时间
    NSDate *date=datepiker.date;                                        //上面读取到的时间是2016-05-17 04:52:32 +0000 //这样的格式的，需要修改，防止时区不对
    NSDateFormatter *format=[[NSDateFormatter alloc]init];              //初始化一个NSDateFormatter对象
    [format setDateFormat:@"yyyy-MM-dd hh:mm:ss"];                      //固定格式,mm表示分钟,MM表示月,HH表示24小时制
    NSLog(@"%@",[format stringFromDate:date]);                          //重新格式化date并打印出来显示
    
    //自定义日期选择器(UIPickerView)
    pickerview=[[UIPickerView alloc]initWithFrame:CGRectMake(10, 400, 320, 200)];//初始化一个自定义的选择器的对象
    pickerview.delegate=self;                                           //使用代理
    arr=[NSArray arrayWithObjects:@"轩爷1",@"轩爷2",@"轩爷3",@"轩爷4",@"轩爷5",@"轩爷6",@"轩爷7",@"轩爷8",@"轩爷9", nil];//初始化一个数组，用放在自定义选择器上面显示
    [pickerview selectRow:1 inComponent:1 animated:YES];                //设置默认在哪一行哪一列
    
    //把控件添加到窗口上去
    [self.window addSubview:pickerview];
    [self.window addSubview:datepiker];
    [self.window addSubview:imageview];
    [self.window addSubview:aiv];
    [self.window addSubview:button_first];
    [self.window addSubview:progressview_first];
    
    return YES;
}

//实现自定义选择器视图滑动动作后的行为
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //分析:第一个参数是一个自定义选择器视图对象，第二个参数是一个行，didSelectRow表明这个行为的作用，第三个参数是一个列
    NSLog(@"%ld,%ld",row,component);//可以直接读到行和列在滑动的时候
}

//实现自定义选择器视图上各个地方显示的内容，返回的是一个字符串
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //分析:第一个参数是一个自定义选择器视图对象，第二个参数是一个行，titleForRow表明这个行为的作用，第三个参数是一个列
    NSString *str;
    for (int i=0; i<=row; i++) {
        for (int j=0; j<=component; j++) {
            str=[arr objectAtIndex:j+3*i];
        }
    }
    //可以定义一个数组通过这个行和列来显示数组里的内容
    
    return str;
}

//这个功能更强大，根据行和列，直接显示视图,所有的控件都可以返回到这个上面～～～尼玛，给力啊
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //分析:第一个参数是一个自定义选择器视图对象，第二个参数是一个行，viewForRow表明这个行为的作用，第三个参数是一个列
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 30, 30)];
    //UILabel *label=[[UILabel alloc]init];//两个都可以和上面
    label.text=@"轩";
    label.textColor=[UIColor greenColor];
    
    //返回一个开关？，实验证明也可以～～
    UISwitch *siwtch1=[[UISwitch alloc]init];
    siwtch1.on=YES;
    return label;
}

//返回自定义选择器视图的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;//本选择器只显示一列
}

//返回自定义选择器视图的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{

    return 3;//本选择器只显示四行
}

//修改行高～～也可以修改其他的，去UIPickerView的.h文件里面去找。都有
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    //分析:第一个参数是一个自定义选择器视图对象，第二个参数 rowHeightForComponent表明这个行为的作用
    return 25;
}

//按钮点击事件的实现部分
-(void)butttonPushTap:(UIButton *)sender
{

    //实现点击按钮进度条来回走
    if (button_use_tag==1 && progressview_first.progress==0) {
        progressview_first.progress+=0.1;
        button_use_tag=0;
    }
    if (progressview_first.progress<1 && button_use_tag==0) {
        progressview_first.progress+=0.1;
        button_use_tag=0;
    }
    else{
        progressview_first.progress-=0.1;
        button_use_tag=1;
    }
    
    //实现点击按钮时菊花动画和不动画
    if ([aiv isAnimating]) {
        [aiv stopAnimating];
    }
    else{
        [aiv startAnimating];
    }
    
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
