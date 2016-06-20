//
//  ViewController.h
//  2016.06.17(蓝牙gamekit)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>

@interface ViewController : UIViewController<GKPeerPickerControllerDelegate,UIImagePickerControllerDelegate>

//这是一个xcode7之前的蓝牙使用，适合点对点之间的蓝牙设备连接
- (IBAction)sendImg;
- (IBAction)btnSelectImg:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
//ble---biuetooth low enery 蓝牙低功耗技术
//gamekit必须是同一个应用程序的两台不同设备上的操作
@property (strong,nonatomic) GKSession *session;

@end

