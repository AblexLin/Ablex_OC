//
//  PinChGestureRecognizerViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "PinChGestureRecognizerViewController.h"

@interface PinChGestureRecognizerViewController ()

@end

@implementation PinChGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor purpleColor];
    //手势捏合
    UIPinchGestureRecognizer *pinch=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinch:)];
    [self.view addGestureRecognizer:pinch];
    
    //手势旋转
    UIRotationGestureRecognizer *rotation=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotat:)];
    [self.view addGestureRecognizer:rotation];
}
-(void)pinch:(UIPinchGestureRecognizer *)sender
{
    CGFloat folat=sender.scale;//这里是获得捏合的测量数据，越靠近越等于0
    NSLog(@"捏合操作%g",folat);
          
}
-(void)rotat:(UIRotationGestureRecognizer *)sender
{
    CGFloat folat=sender.rotation;//这里获得是弧度，弧度＝角度*pi/180
    NSLog(@"捏合旋转%g",folat*180/M_PI);
    
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
