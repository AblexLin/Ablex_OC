//
//  ViewController.m
//  网络数据请求(use get&post in xcode6)
//
//  Created by 顾明轩 on 16/6/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
//需要使用代理协议
@interface ViewController ()<NSURLConnectionDataDelegate>

//@"http://115.159.1.248:56666/index.html"              //Get方式的网址
//@"http://115.159.1.248:56666/xinwen/getsearchs.php"   //Post方式的网址

//解决xcode7.0不能连接网络的许可设置
/*!
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
*/

//定义Get方法同步异步按钮
- (IBAction)synRequestBtnGet:(UIButton *)sender;
- (IBAction)asyRequestBtnGet:(UIButton *)sender;

//定义Post方法同步异步按钮
- (IBAction)synRequestBtnPost:(UIButton *)sender;
- (IBAction)asyRequestBtnPost:(UIButton *)sender;

//记录异步数据使用的动态data
@property (strong, nonatomic) NSMutableData *mutableDataGet;
@property (strong, nonatomic) NSMutableData *mutableDataPost;
@end

@implementation ViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.mutableDataGet=[[NSMutableData alloc]init];//初始化记录异步数据使用的动态data
    self.mutableDataPost=[[NSMutableData alloc]init];//初始化记录异步数据使用的动态data
}
//Get方法同步按钮行为
- (IBAction)synRequestBtnGet:(UIButton *)sender
{
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html" ];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"打印静态网页源代码如下:%@",str);
}
//Get方法异步按钮行为
- (IBAction)asyRequestBtnGet:(UIButton *)sender {
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html" ];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSURLConnection *connect=[NSURLConnection connectionWithRequest:request delegate:self];//异步查看过程必须使用代理
}
#pragma mark Get Asy Action
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"开始响应数据传递了");
    [self.mutableDataGet setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"不断的开始传递数据");            //数据较大时候，这个会被调用多次
    [self.mutableDataGet appendData:data];   //必须支持多段接受数据
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str=[[NSString alloc]initWithData:self.mutableDataGet encoding:NSUTF8StringEncoding];
    NSLog(@"打印静态网页源代码如下:%@",str);
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"传递数据有错误了");
}

/*!
 Xcode6
 Post和Get最大的区别就在于Post需要定制request而Get则不需要
 同步和异步最大的区别在于同步直接获得数据，异步使用行为从数据传递的整个流程中去看事件比同步好，同步是死等，异步则可以做其他事情，所有实际使用的时候多使用异步
 Xcode7
 Post和Get最大的区别就在于Post需要定制request而Get则不需要
 Xcode7以后使用的都是异步哦
*/

//Post方法同步按钮行为
- (IBAction)synRequestBtnPost:(UIButton *)sender {
    //需要使用post提交数据的网站
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/xinwen/getsearchs.php"];
    //定义一个动态的请求，必须定义动态的，不然无法设置后面的方式
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置post的数据提交方式
    [request setHTTPMethod:@"post"];
    //设置要查找的数据的数值
    NSString *str=@"content＝12";
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    //运行连接请求
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *str1=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"打印静态网页源代码如下:%@",str1);
}
//Post方法异步按钮行为
- (IBAction)asyRequestBtnPost:(UIButton *)sender {
    //需要使用post提交数据的网站
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/xinwen/getsearchs.php"];
    //定义一个动态的请求，必须定义动态的，不然无法设置后面的方式
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置post的数据提交方式
    [request setHTTPMethod:@"post"];
    //设置要查找的数据的数值
    NSString *str=@"content＝12";
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    //运行连接请求
    [NSURLConnection connectionWithRequest:request delegate:self];//这里就必须实现代理了
}
#pragma mark Post Asy Action
//这里和上面使用的完全相同的行为写了会报错，但是放在这里更加的清晰便于理解
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//    NSLog(@"开始响应数据传递了");
//    [self.mutableDataPost setLength:0];
//}
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//    NSLog(@"不断的开始传递数据");            //数据较大时候，这个会被调用多次
//    [self.mutableDataPost appendData:data];   //必须支持多段接受数据
//}
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection
//{
//    NSString *str=[[NSString alloc]initWithData:self.mutableDataPost encoding:NSUTF8StringEncoding];
//    NSLog(@"打印静态网页源代码如下:%@",str);
//}
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
//{
//    NSLog(@"传递数据有错误了");
//}


















@end
