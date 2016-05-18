//
//  AppDelegate.h
//  2016.05.18
//
//  Created by 顾明轩 on 16/5/18.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate,UIActionSheetDelegate>
{
    UIButton *buttonForAlarm;
    UIButton *buttonForSheet;
}

@property (strong, nonatomic) UIWindow *window;


@end

