//
//  ViewController.h
//  2016.06.17(相机调用之拍照，录像，相册的读取和编辑)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

//UIImagePickerController功能简介
//1.可以从手机或者模拟器读取一张照片
//2.可以拍照
//3.可以录像

#import <UIKit/UIKit.h>
//播放录像时候用到播放器
#import <MediaPlayer/MediaPlayer.h>
//设置录像有没有声音需要用到
#import <MobileCoreServices/MobileCoreServices.h>
//UINavigationControllerDelegate之所以要实现这个协议是因为这个UIImagePickerController是导航视图的子类
@interface ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

//图片视图
@property (weak, nonatomic) IBOutlet UIImageView *photo;

//调用相机功能
- (IBAction)camera;

//调用录像功能
- (IBAction)video;

//读取相册功能
- (IBAction)readPhoto;

//编辑图片功能
- (IBAction)editPhoto;
@end

