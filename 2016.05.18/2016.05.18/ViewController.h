//
//  ViewController.h
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudyViewController.h"

@interface ViewController : UIViewController<PassString>

@property (strong, nonatomic) UIButton *btn_ios8;
@property (strong, nonatomic) UIButton *btn_ios9;
@property (strong, nonatomic) UIButton *btnForNewVieController;
@property (strong, nonatomic) UITextField *textfield_firstview;
@property (strong, nonatomic) UIButton *button_firstview;

@property (strong, nonatomic) NSString *save_the_secondview_data;

@end

