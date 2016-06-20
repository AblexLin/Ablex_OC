//
//  ViewController.m
//  短信和语音验证
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
//#import "SMS_HYZBadgeView.h"
//#import <AddressBook/AddressBook.h>
//#import <SMS_SDK/SMSSDK.h>
//#import <SMS_SDK/Extend/SMSSDK+AddressBookMethods.h>
//#import <SMS_SDK/Extend/SMSSDK+DeprecatedMethods.h>
//#import <SMS_SDK/Extend/SMSSDK+ExtexdMethods.h>
#import "SMSSDKUI.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize regBtn,btn;
- (void)viewDidLoad {
    [super viewDidLoad];

    
    //短信验证码注册
    [regBtn addTarget:self action:@selector(smsVerify:) forControlEvents:UIControlEventTouchUpInside];

    //语音验证码注册
    [btn addTarget:self action:@selector(callVerify:) forControlEvents:UIControlEventTouchUpInside];


}

- (IBAction)smsVerify:(UIButton *)sender {
    //展示获取验证码界面，SMSGetCodeMethodSMS:表示通过文本短信方式获取验证码
    [SMSSDKUI showVerificationCodeViewWithMetohd:SMSGetCodeMethodSMS result:^(enum SMSUIResponseState state,NSString *phoneNumber,NSString *zone, NSError *error) {
        
    }];
}

- (IBAction)callVerify:(UIButton *)sender {
    //展示获取验证码界面，SMSGetCodeMethodVoice:表示通过语音短信方式获取验证
    [SMSSDKUI showVerificationCodeViewWithMetohd:SMSGetCodeMethodVoice result:^(enum SMSUIResponseState state,NSString *phoneNumber,NSString *zone, NSError *error) {
        
    }];
}
@end
