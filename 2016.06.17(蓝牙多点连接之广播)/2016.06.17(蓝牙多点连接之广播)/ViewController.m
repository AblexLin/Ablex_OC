//
//  ViewController.m
//  2016.06.17(蓝牙多点连接之广播)
//
//  Created by 顾明轩 on 16/6/17.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建表示当前蓝牙设备的对象，并设置广播显示的名称
    MCPeerID *peer=[[MCPeerID alloc]initWithDisplayName:@"xuanxuan"];
    //建立连接
    self.session=[[MCSession alloc]initWithPeer:peer];
    //设置连接代理
    self.session.delegate=self;
    
    //创建广播助手来广播蓝牙设备,，这个名称必须和发现里面的名称完全一样，且不能超过12个英文字符
    self.assistant=[[MCAdvertiserAssistant alloc]initWithServiceType:@"my-lianjie" discoveryInfo:nil session:self.session];
    //开启助手
    [self.assistant start];
}
//释放内存的时候停止广播，这个一般系统会自己做的吧
-(void)dealloc
{
    //停止广播
    [self.assistant stop];
}
#pragma mark - MCSession 多点会话代理方法
// Remote peer changed state.
- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state;
{
    //判断两台蓝牙设备之间的连接状态的变化
    switch (state) {
        case MCSessionStateConnecting:
            NSLog(@"正在连接...");
            break;
        case MCSessionStateConnected:
            NSLog(@"已经连接...");
            break;
        default:
            NSLog(@"连接失败...");
            break;
    }
}
// Received data from remote peer.
- (void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID;
{
    //接收其它蓝牙设备传递来的数据
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
#pragma mark - 选择按钮的点击事件
- (IBAction)select {
    //初始化拾取器对象
    UIImagePickerController *picker=[[UIImagePickerController alloc]init];
    //设置代理
    picker.delegate=self;
    //设置拾取源
    picker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    //显示拾取器
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerController 代理方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //获取图片对象
    UIImage *img=[info valueForKey:UIImagePickerControllerOriginalImage];
    //显示图片对象
    self.photo.image=img;
    //关闭拾取的显示
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //点击取消按钮后要关闭视图
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 发送按钮的点击事件
- (IBAction)send {
    NSLog(@"广播里开始发送图片哦！");
    //获取图片的二进制文件
    NSData *data=UIImagePNGRepresentation(self.photo.image);
    //发送数据到所有连接上的peers，MCSessionSendDataReliable是可靠协议tcp MCSessionSendDataUnReliable是不可靠协议udp
    [self.session sendData:data toPeers:self.session.connectedPeers withMode:MCSessionSendDataReliable error:nil];
}

@end
