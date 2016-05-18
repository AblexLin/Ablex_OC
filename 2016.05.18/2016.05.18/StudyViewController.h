//
//  StudyViewController.h
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassString <NSObject>

-(void)passstr:(NSString *)_str;

@end

@interface StudyViewController : UIViewController

@property (strong, nonatomic) UIButton *btnForReturn;
@property (strong, nonatomic) UITextField *textfield_secondview;
@property (strong, nonatomic) UIButton *button_secondview;
@property (strong, nonatomic) NSString *save_the_firstview_data;
@property (strong, nonatomic) id<PassString> selfPass;
@end
