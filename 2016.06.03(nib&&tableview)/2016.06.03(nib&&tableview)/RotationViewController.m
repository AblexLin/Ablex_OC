//
//  RotationViewController.m
//  2016.06.03(nib&&tableview)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //想要知道现在是在横屏上还是竖屏上，那么就要给系统注册一个通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change) name:UIDeviceOrientationDidChangeNotification object:nil];
    
}
-(void)change
{
    if ([UIDevice currentDevice].orientation==UIDeviceOrientationPortrait) {
        NSLog(@"现在是竖屏的样子哦");
        self.view=self.shuiping;
    }
    if ([UIDevice currentDevice].orientation==UIDeviceOrientationLandscapeLeft) {
        NSLog(@"现在是横左屏的样子哦");
        self.view=self.chuizhi;
    }
    if ([UIDevice currentDevice].orientation==UIDeviceOrientationLandscapeRight) {
        NSLog(@"现在是横右屏的样子哦");
        self.view=self.chuizhi;
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
