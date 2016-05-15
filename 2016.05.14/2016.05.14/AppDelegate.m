//
//  AppDelegate.m
//  2016.05.14
//
//  Created by 顾明轩 on 16/5/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序初始化
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建一个自己定制的继承uiviewcontroller的类的对象的创建
    RootViewController *gmx_rootviewcontroller=[[RootViewController alloc]init];

    //创建一个窗口对象，就是我们这个程序在手机上能看到的界面，界面大小和手机屏幕一样。
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //frame指的是本控件相对于父控件的位置(相对的)
    //bounds指的是本身，也就是控件本身的位置和大小，所以bounds的起点一直是0，0，长宽就是自己的大小(绝对的，其实就是)
    //手机状态栏的高度永远是20
    
    //打印看看窗口的大小和起始坐标,打印结果x=0,y=0,width=320,height=480
    //NSLog(@"x=%g,y=%g,width=%g,height=%g",self.window.frame.origin.x,self.window.frame.origin.y,self.window.frame.size.width,self.window.frame.size.height);
    
    //把自己定制类的对象赋值给窗口的rootViewController
    self.window.rootViewController=gmx_rootviewcontroller;
    
    //设置窗口的背景颜色
    self.window.backgroundColor=[UIColor blackColor];
    
    //设置窗口为关键，并可视化
    [self.window makeKeyAndVisible];//这个必须放在上面，先让窗口可视化，然后添加的按钮，才能够点击
    
    //label和button的学习
    /*
    //显示窗口(一个蓝色的块)
    //UIView *v=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 130)];
    //UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    //vv.backgroundColor=[UIColor redColor];
    //v.backgroundColor=[UIColor greenColor];
    //    
    //把vv加到v上面
    //[v addSubview:vv];
    //把v加到window上
    //[self.window addSubview:v];
    
    //创建一个标签label
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 140, 20)];
    //设置属性的两种做法，都可以。
    [label setText:@"你麻痹"];
    [label setBackgroundColor:[UIColor whiteColor]];
    [label setTextColor:[UIColor redColor]];

    label.text=@"添加一个联系人:";
    label.backgroundColor=[UIColor whiteColor];
    label.textColor=[UIColor redColor];
    
    //创建一个按钮button
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeContactAdd];//这个模式点时候显示的确定就读不到了
    btn.frame=CGRectMake(140, 30, 20, 20);
    btn.backgroundColor=[UIColor whiteColor];
    
    //设置按钮的图像，必须使用UIButtonTypeCustom这个定制点模式
//    [btn setImage:[UIImage imageNamed:@"aaa.png"] forState:UIControlStateNormal];
    
//    [btn setTitle:@"确定" forState:UIControlStateNormal];
    
    //按钮的事件//添加一个目标
    [btn addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchDown];//按下的时候响应
    [btn addTarget:self action:@selector(buttonOut:) forControlEvents:UIControlEventTouchUpInside];//抬起的时候响应
    //添加到窗口
    [self.window addSubview:label];
    [self.window addSubview:btn];
    */
    
    //计算器的设计
    //1.设置deployment info里的status bar style为light
    //2.在info.plist文件里面右击新增一行，选择最后的View controller-based status bar appearance 默认数值no
    //1.2设置后，状态栏显示的数字将变成白色，所以黑色对背景也能看到时间
    //320*480计算下界面的按钮，一排四个按钮，横向320，每个按钮80，列5个，400.480-400-20状态栏＝60
    
    //第一步创建显示label
    [self addCalLabel];
    
    //第二步添加按钮
    [self addCalButtons];
    
    //添加全部按钮(自己写的)
    /*
    [self addCalButton:CGRectMake(0, 130, 80, 70) andCalTitle:@"AC"];
    [self addCalButton:CGRectMake(80, 130, 80, 70) andCalTitle:@"+/-"];
    [self addCalButton:CGRectMake(160, 130, 80, 70) andCalTitle:@"%"];
    [self addCalButton:CGRectMake(240, 130, 80, 70) andCalTitle:@"÷"];
    
    [self addCalButton:CGRectMake(0, 200, 80, 70) andCalTitle:@"7"];
    [self addCalButton:CGRectMake(80, 200, 80, 70) andCalTitle:@"8"];
    [self addCalButton:CGRectMake(160, 200, 80, 70) andCalTitle:@"9"];
    [self addCalButton:CGRectMake(240, 200, 80, 70) andCalTitle:@"x"];

    [self addCalButton:CGRectMake(0, 270, 80, 70) andCalTitle:@"4"];
    [self addCalButton:CGRectMake(80, 270, 80, 70) andCalTitle:@"5"];
    [self addCalButton:CGRectMake(160, 270, 80, 70) andCalTitle:@"6"];
    [self addCalButton:CGRectMake(240, 270, 80, 70) andCalTitle:@"－"];

    [self addCalButton:CGRectMake(0, 340, 80, 70) andCalTitle:@"1"];
    [self addCalButton:CGRectMake(80, 340, 80, 70) andCalTitle:@"2"];
    [self addCalButton:CGRectMake(160, 340, 80, 70) andCalTitle:@"3"];
    [self addCalButton:CGRectMake(240, 340, 80, 70) andCalTitle:@"＋"];
    
    [self addCalButton:CGRectMake(0, 410, 160, 70) andCalTitle:@"0"];
    [self addCalButton:CGRectMake(160, 410, 80, 70) andCalTitle:@"."];
    [self addCalButton:CGRectMake(240, 410, 80, 70) andCalTitle:@"="];
    */
    
    return YES;
}

//添加显示部分
-(void)addCalLabel
{
    UILabel *show_label=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 320, 110)];
    //标签内容
    show_label.text=@"0";
    //标签文字颜色
    show_label.textColor=[UIColor whiteColor];
    
    //对其方式0左，1中，2右
    //show_label.textAlignment=2;直接赋值的方法，一般不这么用
    show_label.textAlignment=NSTextAlignmentRight;
    
    //设置标签文字大小
    show_label.font=[UIFont systemFontOfSize:80];
    //show_label.font=[UIFont fontWithName:@"黑体" size:72];
    
    //把标签添加到window上
    [self.window addSubview:show_label];
}

//添加按钮到界面上
-(void)addCalButtons
{
    //列举出按钮的title
    NSArray *buttonsArray=[NSArray arrayWithObjects:@"AC",@"+/-",@"%",@"÷",@"7",@"8",@"9",@"×",@"4",@"5",@"6",@"−",@"1",@"2",@"3",@"+",@"0",@" ",@".",@"=", nil];
    
    //循环创建按钮
    for (int i=0; i<5; i++) {
        for (int j=0; j<4; j++) {
            
            //创建按钮对象
            UIButton *buttons=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            
            //根据循环设置按钮的坐标
            if (i==4 && j==0) {
                buttons.frame=CGRectMake(0+80*0, 130+70*4, 79*2+1, 69);
            }
            else if (i==4 && j==1){
                continue;
            }
            else{
                buttons.frame=CGRectMake(0+80*j, 130+70*i, 79, 69);
            }
            
            //设置标题，从数组中读取
            [buttons setTitle:[buttonsArray objectAtIndex:j+4*i] forState:UIControlStateNormal];
            
            //设置标题字体颜色
            [buttons setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            //设置标题字体大小
            buttons.titleLabel.font=[UIFont systemFontOfSize:20];
            
            //不同的地方显示不同的颜色
            if (j==3) {
                buttons.backgroundColor=[UIColor orangeColor];
            }
            else if(i==0 && j!=3){
                buttons.backgroundColor=[UIColor grayColor];
            }
            else{
                buttons.backgroundColor=[UIColor lightGrayColor];
            }
            
            //将按钮显示在界面上
            [self.window addSubview:buttons];
        }
    }
    
    
    
}

//添加按钮的通用行为(自己写的)
-(void)addCalButton:(CGRect)_size andCalTitle:(NSString *)_title
{
    //初始化一个按钮，参数由传递来的参数决定
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(_size.origin.x, _size.origin.y, _size.size.width, _size.size.height);

    //设定按钮显示
    [button setTitle:_title forState:UIControlStateNormal];
    
    //设定按钮显示的字体颜色和大小
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:35];
    
    //如果是加减乘除的话就橘色显示
    if ([_title isEqualToString:@"＋"] || [_title isEqualToString:@"－"] || [_title isEqualToString:@"x"] || [_title isEqualToString:@"÷"] || [_title isEqualToString:@"="]) {
        button.backgroundColor=[UIColor orangeColor];
    }
    else if([_title isEqualToString:@"AC"]||[_title isEqualToString:@"+/-"]||[_title isEqualToString:@"%"]){
        button.backgroundColor=[UIColor lightGrayColor];
    }
    else{
        button.backgroundColor=[UIColor whiteColor];
    }
    
    //设置按钮的边框，必要条件就是先设置边框的宽度，有了宽度才能设置颜色
    button.layer.borderWidth=0.5;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref=CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 1 });
    [button.layer setBorderColor:colorref];
    
    //添加按钮到window上面去
    [self.window addSubview:button];
}

-(NSString *)buttonClick:(UIButton *)sender
{
    
    //按钮被按下
    NSLog(@"SASASAS");
    
    return [sender titleLabel].text;
}



//按钮的UIControlEventTouchDown也就是按下事件的实现
-(void)buttonTap:(UIButton *)sender
{
//    UIButton *btn=sender; //不赋值也可以，就是没有自动索引啦这样记不得行为就不能打印了
    NSLog(@"按钮终于被按下了!!!%@",[sender titleLabel].text);
}

//按钮的UIControlEventTouchUpInside也就是抬起事件的实现
-(void)buttonOut:(UIButton *)sender
{
//    UIButton *btn=sender; //不赋值也可以，就是没有自动索引啦这样记不得行为就不能打印了
    NSLog(@"按钮终于被松开了!!!%@",sender.titleLabel.text);
}

//应用程序即将进入后台
- (void)applicationWillResignActive:(UIApplication *)application {

}

//应用程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
}

//应用程序即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {

}

//应用程序已经进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
}

//应用程序退出
- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
