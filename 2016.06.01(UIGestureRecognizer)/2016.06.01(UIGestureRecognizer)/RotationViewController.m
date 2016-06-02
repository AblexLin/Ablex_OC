//
//  RotationViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "RotationViewController.h"
#define HEIGHTWIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHTHEIGHT [UIScreen mainScreen].bounds.size.height

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 40, 320,40)];
    label.backgroundColor=[UIColor redColor];
    label.text=@"轩爷你好";
    label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label];
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHTHEIGHT-40*2, 320, 40)];
    label2.text=@"卧槽尼玛累死我了";
    label2.textAlignment=NSTextAlignmentCenter;
    label2.backgroundColor=[UIColor redColor];
    [self.view addSubview:label2];
    NSLog(@"%g",HEIGHTWIDTH);
    NSLog(@"%g",HEIGHTHEIGHT);
    //这样的方式叫做注册通知的方式来实现屏幕旋转行为的获取
    //这里的name要注意是一个特殊的uideviceorientionchangenotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(xx:) name:UIDeviceOrientationDidChangeNotification object:nil];
}
//转屏了没是不是发生了转屏事件，如果发生了，那么久会执行这里的代码了
-(void)xx:(id)sender
{
    NSLog(@"来了");
    
    if ([[UIDevice currentDevice]orientation]==UIDeviceOrientationPortrait) {
        NSLog(@"这个是默认的home在下面的时候的那个屏幕");
    }
    if ([[UIDevice currentDevice]orientation]==UIDeviceOrientationPortraitUpsideDown) {
        NSLog(@"这个是home在上面的时候的那个旋转方向");
    }
    if ([[UIDevice currentDevice]orientation]==UIDeviceOrientationLandscapeLeft) {
        NSLog(@"这个是home在左边显示的那个界面显示的那个");
    }
    if ([[UIDevice currentDevice]orientation]==UIDeviceOrientationLandscapeRight) {
        NSLog(@"这个是home在右边的时候显示的那个界面");
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
