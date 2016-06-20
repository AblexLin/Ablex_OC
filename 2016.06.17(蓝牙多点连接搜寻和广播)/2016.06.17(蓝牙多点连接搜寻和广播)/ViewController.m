//
//  ViewController.m
//  2016.06.17(蓝牙多点连接搜寻和广播)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建设备对象和显示的名字，代表当前蓝牙设备对象
    MCPeerID *peer=[[MCPeerID alloc]initWithDisplayName:@"xuanxuan"];
    //创建连接
    self.session=[[MCSession alloc]initWithPeer:peer];
    //设置代理
    self.session.delegate=self;
    
    //创建发现的控制器，这里的服务的类型必须和广播的服务类型完全一致，不然无法建立连接，其实这就是和广播相对应的一个控制器
    self.browser=[[MCBrowserViewController alloc]initWithServiceType:@"my-lianjie" session:self.session];
    //设置代理
    self.browser.delegate=self;
    //显示控制器,所有发现的蓝牙设备会显示在这个控制器的视图上
    [self presentViewController:self.browser animated:YES completion:nil];
}
#pragma mark - MCBrowserViewController 代理事件
//关闭发现广播的控制器
-(void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}
//取消的时候也关闭
-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - select按钮点击事件
- (IBAction)select {
    //初始化一个picker
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    //设置代理
    picker.delegate=self;
    //设置拾取源，默认是相册
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    //显示picker拾取器
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark - UIImagePickerController 代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img=info[UIImagePickerControllerOriginalImage];
    self.photo.image=img;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MCSession 代理方法
// Remote peer changed state.
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state;
{
    switch (state) {
        case MCSessionStateConnecting:
            NSLog(@"正在建立连接....");
            break;
        case MCSessionStateConnected:
            NSLog(@"已经建立连接....");
            break;
        default:
            NSLog(@"连接建立失败....");
            break;
    }
}
// Received data from remote peer.
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID;
{
    NSLog(@"开始接受图片哦");
    //显示对象发送来的图片并显示在界面上
    UIImage *img=[UIImage imageWithData:data];
    self.photo.image=img;
}
// Received a byte stream from remote peer.
- (void)    session:(MCSession *)session
   didReceiveStream:(NSInputStream *)stream
           withName:(NSString *)streamName
           fromPeer:(MCPeerID *)peerID;
{
    NSLog(@"一般用不到的行为，但是是required的行为，所以必须实现");
}
// Start receiving a resource from remote peer.
- (void)                    session:(MCSession *)session
  didStartReceivingResourceWithName:(NSString *)resourceName
                           fromPeer:(MCPeerID *)peerID
                       withProgress:(NSProgress *)progress;
{
    NSLog(@"一般用不到的行为，但是是required的行为，所以必须实现");
}
// Finished receiving a resource from remote peer and saved the content
// in a temporary location - the app is responsible for moving the file
// to a permanent location within its sandbox.
- (void)                    session:(MCSession *)session
 didFinishReceivingResourceWithName:(NSString *)resourceName
                           fromPeer:(MCPeerID *)peerID
                              atURL:(NSURL *)localURL
                          withError:(nullable NSError *)error;
{
    NSLog(@"一般用不到的行为，但是是required的行为，所以必须实现");
}
#pragma mark - send按钮点击事件
- (IBAction)send {
    //获取图片视图中的照片并转化为二进制数据
    NSData *data=UIImagePNGRepresentation(self.photo.image);
    //发送数据到所有连接的设备上去，这其实是向广播去发送数据
    [self.session sendData:data toPeers:self.session.connectedPeers withMode:MCSessionSendDataUnreliable error:nil];
}

@end
