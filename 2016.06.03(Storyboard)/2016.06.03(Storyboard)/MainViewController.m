//
//  MainViewController.m
//  2016.06.03(Storyboard)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "MainViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//实现协议的行为来传递数据，并吧主界面的文本显示为后一个界面传递来的数据
-(void)passValue:(NSString *)_text
{
    self.mainLabel.text=_text;
}

//准备要使用这个连接线连接到这个视图的时候就会调用这个函数

//因为那个所谓的segue对应的行为叫目标的视图控制器，所以这样应该放在main里面

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //获取到一个放送信号的那个视图的对象
    OneViewController *destinationView=[segue destinationViewController];
    
    destinationView.delegate=self;//设置代理
    
    //切记这里是一个目标的视图对象，所以这个行为一定是在发送信号的视图控制器中的
    
    //再给其中的那个分段控件上的title传递到这里
    if (self.segOutlet.selectedSegmentIndex==0) {
        //获取分段控件上的title然后传递给后面视图的属性上去，再在后面的视图中将这个属性赋值给相应的文本显示就达到了数据传递的目的
        destinationView.strr=[self.segOutlet titleForSegmentAtIndex:0];
    }
    if (self.segOutlet.selectedSegmentIndex==1) {
        destinationView.strr=[self.segOutlet titleForSegmentAtIndex:1];
    }
}

//添加分段控件的行为
- (IBAction)segAction:(UISegmentedControl *)sender {
    if (self.segOutlet.selectedSegmentIndex==0) {
        //有线槽的时候才这么做，没有的时候直接使用present久好了
        [self performSegueWithIdentifier:@"OneOne" sender:self];//两种都可以
    }
    if (self.segOutlet.selectedSegmentIndex==1) {
        [self performSegueWithIdentifier:@"TwoTwo" sender:self.view];
    }
}

@end
