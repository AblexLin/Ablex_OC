//
//  ViewController.m
//  2016.06.15(异步套接字客户端之基于java服务器)
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//这里使用的服务器是java的服务器，在我的用户文件夹下面编译后，需要开启java SocketServer才有效，下面的全部操作
//1.导入ios下的AsyncSocket异步套接字类的头文件和实现文件,这个是从网络上下载的类
//2.导入CFNetwork框架
//3.创建一个异步套接字的对象
//4.链接服务器使用套接字
//5.使用代理实现异步的行为
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    socket=[[AsyncSocket alloc]initWithDelegate:self];//使用代理创建套接字对象
    NSError *error;
    BOOL result=[socket connectToHost:@"127.0.0.1" onPort:22222 error:&error];//链接服务器
    if (!result) {
        NSLog(@"链接到服务器失败,错误原因:%@",error);
    }
    
}

//发送数据
- (IBAction)sendBtn:(UIButton *)sender {
    NSString *str=self.sendText.text;           //获取界面的文本输入框的信息
    str=[str stringByAppendingString:@"\r\n"];  //java识别字符串的时候需要以回车和换行结尾所以要连接下字符串方便java识别
    NSData *data=[str dataUsingEncoding:NSUTF8StringEncoding];//获取数据data,套接字永远使用二进制来发送和接收数据的
    [socket writeData:data withTimeout:-1 tag:0];//发送数据
}

//链接到服务器成功
-(void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
    NSLog(@"已经链接到服务器了");
    //准备接受数据，必须执行下面的行为，断开服务器的时候，才会响应断开服务器的连接
    [socket readDataWithTimeout:-1 tag:0];
}
//从服务器端有信息来了
-(void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    NSLog(@"从服务器端有信息来了");
    self.recText.text=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [socket readDataWithTimeout:-1 tag:0];//接受完必须继续准备接受下一次，不然这个行为不会被调用了。
}
/*!
必须实现前面两个行为，关闭java服务器的时候，才能响应后面的两个行为
*/
//将要断开服务器，会显示所有的错误
-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err
{
    NSLog(@"将要断开服务器连接了!错误原因:%@",err);
    saveError=err;
}
//已经断开断开连接
-(void)onSocketDidDisconnect:(AsyncSocket *)sock
{
    if (saveError) {
        NSLog(@"没有连接成功就断开了");
    }
    else{
        NSLog(@"服务器真的断开了");
    }
    saveError=nil;
    NSLog(@"已经断开服务器连接了!");
    [socket disconnect];//正常断开，用处不大～～写不写价值不大
}

@end
