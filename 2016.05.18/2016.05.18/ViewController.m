//
//  ViewController.m
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "StudyViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize btn_ios8,btn_ios9;
@synthesize btnForNewVieController;
@synthesize button_firstview,textfield_firstview;
@synthesize save_the_secondview_data;

//加载视图到内存
-(void)loadView
{
    //轻易不写这个，会完蛋的，实在想调用，就先调用父类的
    [super loadView];
}
//加载视图到内存完成
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建一个ios8用来显示警报和操作表的按钮
    btn_ios8=[UIButton buttonWithType:UIButtonTypeSystem];
    btn_ios8.frame=CGRectMake(70, 80, 180, 40);
    btn_ios8.backgroundColor=[UIColor orangeColor];
    btn_ios8.layer.cornerRadius=10.0;
    [btn_ios8 setTitle:@"IOS8－UIAlertController" forState:UIControlStateNormal];
    [btn_ios8 addTarget:self action:@selector(pushTapIos8:) forControlEvents:UIControlEventTouchUpInside];

    //创建一个ios9用来显示警报和操作表的按钮
    btn_ios9=[UIButton buttonWithType:UIButtonTypeSystem];
    btn_ios9.frame=CGRectMake(70, 130, self.view.frame.size.width-70-70, 40);//获取屏幕大小来决定按钮位置，这样的做法非常好，不管屏幕是不是变化了，位置不变
    btn_ios9.backgroundColor=[UIColor orangeColor];
    btn_ios9.layer.cornerRadius=10.0;
    [btn_ios9 setTitle:@"IOS9－UIAlertController" forState:UIControlStateNormal];
    [btn_ios9 addTarget:self action:@selector(pushTapIos9:) forControlEvents:UIControlEventTouchUpInside];
    //UIStackView叠加视图，能够自动布局
    UIStackView *stackview=[[UIStackView alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    stackview.backgroundColor=[UIColor redColor];//无效
    [stackview setBackgroundColor:[UIColor redColor]];//无效，因为叠加视图不能设置背景颜色
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    view.backgroundColor=[UIColor lightGrayColor];
    UISwitch *switch1=[[UISwitch alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    //[stackview addSubview:switch1];//这样的添加没有意义
    [stackview addArrangedSubview:switch1];
    UISwitch *switch2=[[UISwitch alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    //[stackview addSubview:switch2];
    [stackview addArrangedSubview:switch2];
    UISwitch *switch3=[[UISwitch alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    [stackview addArrangedSubview:switch3];
    UISwitch *switch4=[[UISwitch alloc]initWithFrame:CGRectMake(0, 30, 320, 200)];
    [stackview addArrangedSubview:switch4];
    stackview.alignment=UIStackViewAlignmentCenter;//对齐方式--左中右
    stackview.axis=UILayoutConstraintAxisHorizontal;//布局方式--水平垂直
    stackview.distribution=UIStackViewDistributionEqualCentering;//分布方式--等中心分布
    stackview.distribution=UIStackViewDistributionFill;//这个是默认方式,自动装填
    stackview.distribution=UIStackViewDistributionFillEqually;//挨个往后装填
    stackview.distribution=UIStackViewDistributionFillProportionally;//合适的向后挨个装填
    //装填按钮，图标，图片什么都一样～～都可以，自动布局器也就是
    
    btnForNewVieController=[UIButton buttonWithType:UIButtonTypeSystem];
    btnForNewVieController.frame=CGRectMake(70, 180, 180, 40);
    btnForNewVieController.backgroundColor=[UIColor purpleColor];
    btnForNewVieController.layer.cornerRadius=8.2;
    [btnForNewVieController setTitle:@"点击出现新的视图控制器" forState:UIControlStateNormal];
    [btnForNewVieController addTarget:self action:@selector(pushTapNewVieController:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnForNewVieController];
    //[self.view addSubview:view];
    //[self.view addSubview:stackview];
    //将按钮添加到视图上面去
    [self.view addSubview:btn_ios8];
    [self.view addSubview:btn_ios9];
    
    
    //创建一个输入框和按钮，并在新的视图中显示，来回传递数据
    textfield_firstview=[[UITextField alloc]initWithFrame:CGRectMake(70, 230, 180, 40)];
    textfield_firstview.backgroundColor=[UIColor greenColor];
    //textfield_firstview.layer.cornerRadius=10;//这样设置圆角也可以
    textfield_firstview.borderStyle=UITextBorderStyleRoundedRect;
    
    //把第二个视图保存的数据赋值给第一个视图
    textfield_firstview.text=self.save_the_secondview_data;//反过来就不行了，为什么？
    //因为第二个视图是被dismiss的也就是摧毁了，所有再次来的时候，不会走这里了。
    //所以返回的时候需要使用协议，也就是代理的特殊的方法来实现
    
    button_firstview=[UIButton buttonWithType:UIButtonTypeSystem];
    [button_firstview setFrame:CGRectMake(70, 280, 180, 40)];
    [button_firstview setTitle:@"第一个视图的按钮" forState:UIControlStateNormal];
    [button_firstview setBackgroundColor:[UIColor greenColor]];
    button_firstview.layer.cornerRadius=10.0;
    [button_firstview addTarget:self action:@selector(button_firstview:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button_firstview];
    [self.view addSubview:textfield_firstview];
    
}
//第一个视图的按钮点击事件
-(void)button_firstview:(id)sender
{
    StudyViewController * secondview=[[StudyViewController alloc]init];
    secondview.save_the_firstview_data=self.textfield_firstview.text;
    
    //必须在这里赋值，下面第二个视图的数据才能传递过来
    secondview.selfPass=self;
    
    [self presentViewController:secondview animated:YES completion:nil];

}

//实现第二个视图里定制的协议，用来传递数据
-(void)passstr:(NSString *)_str
{
    self.textfield_firstview.text=_str;
}

//按钮按下显示一个新的视图
-(void)pushTapNewVieController:(id)sender
{
    //切换到另外一个视图，模态切换，呈现～～～
    StudyViewController *newviewcontroller=[[StudyViewController alloc]init];
    //[self.view addSubview:newviewcontroller];//这么添加就错了，要用present呈现
    
    //设定视图切换动画
    [newviewcontroller setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];//翻转
    [newviewcontroller setModalTransitionStyle:UIModalTransitionStyleCoverVertical];//默认的从下往上
    [newviewcontroller setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];//一隐一下的模式(溶解)
    [newviewcontroller setModalTransitionStyle:UIModalTransitionStylePartialCurl];//卷纸一样的翻转
    //最后一个，点击屏幕还能返回
    
    //将新的视图显示出来
    [self presentViewController:newviewcontroller animated:YES completion:nil];

    //按钮点击后，在ViewController中的按钮btn_ios8，btn_ios9都被新打这个StudyViewController给覆盖了，但是之前在self.window addsub..的按钮并没有消失.
    

}

/************************************************** 总结 *******************************************************/
/* 添加一个按钮，然后按钮点击后弹框显示一个警报，选择警报的是的，会生成一个操作表，点关闭没有反应。生成的操作表也可以执行相关的行为 */
/**************************************************************************************************************/

//IOS8如何使用警报和操作表
-(void)pushTapIos8:(UIButton *)sender_ios8
{
    //初始化一个警告控制器，设定标题，设定显示内容，设定形式，形式有两种，一种是警告，一种是操作表
    UIAlertController *alertcontroller=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"未成年不许玩!" preferredStyle:UIAlertControllerStyleAlert];

    //初始化一个alertaction，设置标题，设置按钮形式，设置句柄，句柄也就是按钮点击后的行为
    UIAlertAction *alertaction_close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action1){NSLog(@"关闭按钮呗点击了");}];

    //这个实现方式就不需要使用代理了。因为这个action是自己定义的，比如再定义一个ok的按钮
    UIAlertAction *alertaction_ok=[UIAlertAction actionWithTitle:@"是的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action2){
        //创建一个操作表的视图对象
        UIAlertController *alertcontroller_actionsheet=[UIAlertController alertControllerWithTitle:@"操作表!" message:@"操作表控制器!" preferredStyle:UIAlertControllerStyleActionSheet];
        
        //添加一个alertaction动作删除联系人
        UIAlertAction *alertaction_delete=[UIAlertAction actionWithTitle:@"删除联系人" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action3){
            NSLog(@"删除联系人！可以在这里直接写函数，就表示按钮按下了去做什么事情");
        }];
        
        //添加一个alertaction动作取消按钮
        UIAlertAction *alertaction_cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action4){
            NSLog(@"取消！可以在这里直接写函数，就表示按钮按下了去做什么事情");
        }];
        
        //UIAlertActionStyleDestructive这是一个摧毁的风格，也就是会显示红色的汉字
        UIAlertAction *alertaction_redtext=[UIAlertAction actionWithTitle:@"红色字" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action5){
            NSLog(@"红色字！可以在这里直接写函数，就表示按钮按下了去做什么事情");
        }];

        //添加action到控制器上
        [alertcontroller_actionsheet addAction:alertaction_delete];
        [alertcontroller_actionsheet addAction:alertaction_cancel];
        [alertcontroller_actionsheet addAction:alertaction_redtext];
        
        //添加控制器到view上
        [self presentViewController:alertcontroller_actionsheet animated:YES completion:nil];//直接添加也是没有按钮的
        
    }];
    
    //把这个action先添加到UIAlertController上面去，再使用下面的添加到viewcontroller显示
    [alertcontroller addAction:alertaction_ok];
    [alertcontroller addAction:alertaction_close];
    
    //在viewcontroller上显示，这个也只能在viewcontroller上面显示，不能再self.window上显示
    [self presentViewController:alertcontroller animated:YES completion:nil];//这个时候显示的是没有取消按钮的，取消按钮需要自己新增
    
}

//IOS9如何使用警报和操作表
-(void)pushTapIos9:(UIButton *)sender_ios9
{
    //UIAlertController初始化
    UIAlertController *alertController_ios9=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"IOS9警告控制器学习!!!!" preferredStyle:UIAlertControllerStyleAlert];
    
    //UIAlertAction初始化
    UIAlertAction *alertAction_iknow=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *xxx){
        NSLog(@"我知道了，不就是一个句柄么！");
    }];
    //UIAlertAction初始化
    UIAlertAction *alertAction_showActionSheet=[UIAlertAction actionWithTitle:@"操作表" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *xxx){
        //显示一个操作表，方式就是复制警报的，只要在初始化控制器的时候修改下样式就ok了
        //UIAlertController初始化
        UIAlertController *alertController_ios9=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"IOS9警告控制器学习!!!!" preferredStyle:UIAlertControllerStyleActionSheet];
        
        //UIAlertAction初始化
        UIAlertAction *alertAction_iknow=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *xxx){
            NSLog(@"我知道了，不就是一个句柄么！");
        }];
        //UIAlertAction初始化
        UIAlertAction *alertAction_showActionSheet=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *xxx){
            NSLog(@"我知道了，准备显示操作表!");
        }];
        
        //给控制器添加动作action
        [alertController_ios9 addAction:alertAction_iknow];
        [alertController_ios9 addAction:alertAction_showActionSheet];
        
        //显示到界面上
        [self presentViewController:alertController_ios9 animated:YES completion:nil];

    }];
    
    //给控制器添加动作action
    [alertController_ios9 addAction:alertAction_iknow];
    [alertController_ios9 addAction:alertAction_showActionSheet];
    
    //显示到界面上
    [self presentViewController:alertController_ios9 animated:YES completion:nil];
}

//视图将要显示
-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"视图将要显示");
}
//视图已经显示
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"视图已经显示");
}
//视图将要消失
-(void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"视图将要消失");
}
//视图已经消失
-(void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"视图已经消失");
}

//内存报警
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"内存报警");
}

@end
