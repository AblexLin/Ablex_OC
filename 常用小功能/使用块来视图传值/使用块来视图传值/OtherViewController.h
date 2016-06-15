//
//  OtherViewController.h
//  使用块来视图传值
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherViewController : UIViewController
@property (strong, nonatomic) UIButton *btn;

//在第二个视图里声明一个块
@property (strong, nonatomic) void (^passValue)(NSString *);

@property (strong, nonatomic) NSString *namea;
@end
