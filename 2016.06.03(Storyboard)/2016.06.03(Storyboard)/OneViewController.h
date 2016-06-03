//
//  OneViewController.h
//  2016.06.03(Storyboard)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValue.h"

@interface OneViewController : UIViewController

//返回上一个界面
- (IBAction)backToLastView:(id)sender;

//设置一个标签的属性
@property (weak, nonatomic) IBOutlet UILabel *label;

//设置一个属性，用来接收上个视图传递来的数据
@property (strong ,nonatomic) NSString *strr;

//设置一个代理的属性来传递数据
@property (strong, nonatomic) id<PassValue> delegate;

@end
