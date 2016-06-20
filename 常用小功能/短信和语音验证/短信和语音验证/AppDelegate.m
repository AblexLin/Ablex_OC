//
//  AppDelegate.m
//  短信和语音验证
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AppDelegate.h"

#import <SMS_SDK/SMSSDK.h>
//SMSSDK官网公共key
#define appkey @"f3fc6baa9ac4"
#define app_secrect @"7f3dedcb36d92deebcb373af921d635a"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //SMSSDK官网公共key注册
    [SMSSDK registerApp:appkey withSecret:app_secrect];
    
    return YES;
}

@end
