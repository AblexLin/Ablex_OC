//
//  PanGestureRecognizerViewController.m
//  2016.06.01(UIGestureRecognizer)
//
//  Created by 顾明轩 on 16/6/1.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "PanGestureRecognizerViewController.h"

@interface PanGestureRecognizerViewController ()

@end

@implementation PanGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor cyanColor];
    UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)sender
{
    //获取移动了点点相对坐标
    CGPoint point=[sender translationInView:self.view];
    //把坐标给视图的中心点
    self.view.center=CGPointMake(point.x+sender.view.center.x, point.y+sender.view.center.y);
    NSLog(@"拖动视图x=%g,y=%g",point.x,point.y);
    //复位视图到0点
    [sender setTranslation:CGPointZero inView:sender.view];
    //上面使用sender.view和self.view是一样的，针对这个拖动手势，它的view就是主视图的那个view，但是如果添加的地方不同，这里还是用发送者比较好
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
