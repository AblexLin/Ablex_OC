//
//  ViewController.m
//  2016.06.02(Nib or Xib)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//按钮一的点击事件
- (IBAction)tap:(UIButton *)sender {
    self.label.text=@"按钮1的点击事件";
}

//按钮二的点击事件
- (IBAction)tap2:(UIButton *)sender {
    self.label.text=@"按钮2的点击事件";
}
//计算求和,如果输入的是英文字母，那么计算的结果就是0；因为字母转换过来后就是0
- (IBAction)Calculate:(UIButton *)sender {
    int a=[self.CalculateText.text intValue];
    int sun=0;
    for (int i=0; i<=a; i++) {
        sun+=i;
    }
    self.CalculateText.text=[NSString stringWithFormat:@"%d",sun];
}
//关闭键盘事件
//这是第一种关闭键盘的方式，第二种方式就是点击后面的view关闭键盘
- (IBAction)closeKeyboard:(UITextField *)sender {
//    [self.CalculateText resignFirstResponder];
}
//uiview里面的实现的关闭键盘，前提是必须选择背后的这视图，然后把父类设置为uicontrol这样在后面的检查器里面菜会有相应的事件能够选择。那么这歌实现方式是必须要执行这个设置第一焦点的
- (IBAction)closeKeyboard2:(id)sender {
    [self.CalculateText resignFirstResponder];
}

@end
