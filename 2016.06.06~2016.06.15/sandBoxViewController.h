//
//  sandBoxViewController.h
//  2016.06.06~2016.06.15
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sandBoxViewController : UIViewController

//点击可保存用户数据
- (IBAction)saveUserInfoBtn:(UIButton *)sender;

//用户数据输入框
@property (weak, nonatomic) IBOutlet UITextField *userInfoText;

@end
