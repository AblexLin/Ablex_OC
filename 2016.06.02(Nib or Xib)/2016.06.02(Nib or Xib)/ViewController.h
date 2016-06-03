//
//  ViewController.h
//  2016.06.02(Nib or Xib)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//两种实现方式
//1在nib或者storyboard上按住control拖拽到头文件中
//2在选中的对象上，在右侧有一个连接检查器，在对应的行为上去拖拽到对应的头文件中去，这个方式是不需要按住control的

//因为不知道nib哪里去了暂时 先使用这个故事版来实心，其实效果是差不多的

//实现一个输出口也就是属性
@property (weak, nonatomic) IBOutlet UILabel *label;

//实现一个操作，其实就是添加一个按钮的点击事件
- (IBAction)tap:(UIButton *)sender;
- (IBAction)tap2:(UIButton *)sender;

//实现一个计算求和的功能
@property (weak, nonatomic) IBOutlet UITextField *CalculateText;
- (IBAction)Calculate:(UIButton *)sender;

//关闭键盘事件
- (IBAction)closeKeyboard:(UITextField *)sender;

//关闭键盘事件view版
- (IBAction)closeKeyboard2:(id)sender;

@end

