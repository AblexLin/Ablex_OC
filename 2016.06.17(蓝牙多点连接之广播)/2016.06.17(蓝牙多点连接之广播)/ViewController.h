//
//  ViewController.h
//  2016.06.17(蓝牙多点连接之广播)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

//第一个是多点会话的代理，第二个是导航视图的代理，必要的，暂时还不知道为什么，第三个是图片拾取器的代理
//追加，这里是因为UIImagePickerController的父类就是导航视图，所以这里需要实现导航视图的代理
@interface ViewController : UIViewController<MCSessionDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//多点连接之广播，这个很好，不但可以使用在蓝牙上，还可以使用在无线局域网的连接上
@property (weak, nonatomic) IBOutlet UIImageView *photo;

//选择图片按钮，点击后会访问系统的相册，那么访问的是相册还是相机，是自己设置的在拾取源的那个属性里设置
- (IBAction)select;

//发送图片，发送的是上面的图片视图里显示的图片，没有选择的时候，这里没有做处理哦
- (IBAction)send;

//创建一个多点会话
@property (strong, nonatomic) MCSession *session;

//创建一个广播用的助手
@property (strong, nonatomic) MCAdvertiserAssistant *assistant;
@end

