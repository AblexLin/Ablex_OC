//
//  ViewController.h
//  2016.06.17(蓝牙多点连接搜寻和广播)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

//多点连接之搜寻，或者叫发现
@interface ViewController : UIViewController<MCSessionDelegate,MCBrowserViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//创建一个图片视图
@property (weak, nonatomic) IBOutlet UIImageView *photo;

//创建选择图片按钮
- (IBAction)select;

//创建发送图片按钮
- (IBAction)send;

//创建一个多点连接对象
@property (strong, nonatomic) MCSession *session;

//创建一个浏览器的对象
@property (strong, nonatomic) MCBrowserViewController *browser;

@end

