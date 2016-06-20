//
//  ViewController.h
//  短信和语音验证
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//短信验证
- (IBAction)smsVerify:(UIButton *)sender;
//电话验证
- (IBAction)callVerify:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIButton *regBtn;
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

