//
//  ViewController.m
//  2016.06.17(蓝牙gamekit)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个GKPeerPickerController的对象，这个控制器的view可以用来显示连接设备时，附近的蓝牙设备
    GKPeerPickerController *peerController=[[GKPeerPickerController alloc]init];
    //设置代理
    peerController.delegate=self;
    [peerController show];
}
#pragma mark - GKPeerPickerController 代理方法
-(void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    //其实就是保存两个设备之间的连接
    self.session=session;//获取会话，其实就是建立好和其他蓝牙设备连接的时候会触发这个行为
    //设置对方传递过来数据接收的回调方法
    [session setDataReceiveHandler:self withContext:nil];
    //隐藏显示其他设备的对话框
    [picker dismiss];
    
}
-(void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context
{
    NSLog(@"手打这个方法我也是醉了，没有选的，主要用来接收对方传递来的数据");
    UIImage *img=[UIImage imageWithData:data];
    self.photo.image=img;
    //保存到图片库
    UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil);
}

//发送图片
- (IBAction)sendImg {
    //判断两个设备是否建立好了连接
    if (self.session==nil) {
        return;
    }
    NSData *data=UIImagePNGRepresentation(self.photo.image);
    //传送数据，GKSendDataReliable其实就是可靠传输tcp GKSendDataUnreliable其实就是不可靠传输udp
    [self.session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
    
}

//选择图片按钮
- (IBAction)btnSelectImg:(id)sender {
    //判断当前的照片库是否可以使用
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]) {
        //创建UIImagePickerController对象
        UIImagePickerController *picker=[[UIImagePickerController alloc]init];
        //设置他的代理
        picker.delegate=self;
        //显示照片
        [self presentViewController:picker animated:YES completion:nil];
    }
}
#pragma mark - UIImagePickerController 代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img=info[UIImagePickerControllerOriginalImage];//获取在picker控制器view中选择图片
    self.photo.image=img;
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
