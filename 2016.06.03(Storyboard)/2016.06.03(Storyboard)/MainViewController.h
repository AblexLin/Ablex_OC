//
//  MainViewController.h
//  2016.06.03(Storyboard)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValue.h"
@interface MainViewController : UIViewController<PassValue>

//添加分段控件的行为
- (IBAction)segAction:(UISegmentedControl *)sender;

//添加分段控件的属性
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOutlet;

//添加主视图中的标签的属性或者叫输出口
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end
