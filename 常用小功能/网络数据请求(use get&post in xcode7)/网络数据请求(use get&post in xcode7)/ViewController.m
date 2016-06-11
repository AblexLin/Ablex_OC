//
//  ViewController.m
//  网络数据请求(use get&post in xcode7)
//
//  Created by 顾明轩 on 16/6/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
//实现代理来完成数据传递行为的监视
@interface ViewController ()<NSURLSessionDataDelegate>

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mutableDataGet=[[NSMutableData alloc]init];//初始化记录异步数据使用的动态data
    self.mutableDataPost=[[NSMutableData alloc]init];//初始化记录异步数据使用的动态data
}
//Get同步行为
-(void)synRequestBtnGet:(UIButton *)sender
{
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html"];
    //先创建个会话
    NSURLSession *session=[NSURLSession sharedSession];
    //使用会话来创建任务
    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"数据接收完成%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //运行创建好的任务
    [task resume];
}
//Get异步行为
-(void)asyRequestBtnGet:(UIButton *)sender
{
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html"];
    //异步的时候就需要创建实现代理的会话了
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //使用会话来创建任务
    NSURLSessionDataTask *task=[session dataTaskWithURL:url];
    //运行创建好的任务
    [task resume];
}
#pragma mask Get Asy Action
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    NSLog(@"开始有响应了");//9.0以后这里需要设置允许，不然不会继续响应下面的事件了
    completionHandler(NSURLSessionResponseAllow);//设置允许
    [self.mutableDataGet setLength:0];
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    NSLog(@"开始不断接受数据了");//和6版本一样这里在数据很大的时候也会分段
    [self.mutableDataGet appendData:data];//接受数据
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    NSLog(@"完成接受和带回错误%@,%@",error,[[NSString alloc]initWithData:self.mutableDataGet encoding:NSUTF8StringEncoding]);
    
}
/*!
 Xcode6
 Post和Get最大的区别就在于Post需要定制request而Get则不需要
 同步和异步最大的区别在于同步直接获得数据，异步使用行为从数据传递的整个流程中去看事件比同步好，同步是死等，异步则可以做其他事情，所有实际使用的时候多使用异步
 Xcode7
 Post和Get最大的区别就在于Post需要定制request而Get则不需要
 Xcode7以后使用的都是异步哦
 */
//Post同步行为
-(void)synRequestBtnPost:(UIButton *)sender
{
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/xinwen/getsearchs.php"];
    //post就必须要设置请求了，那么久需要动态请求了
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置请求的方法为post
    [request setHTTPMethod:@"post"];
    //设置请求的主体
    NSString *str=@"content=12";
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    //先创建个会话
    NSURLSession *session=[NSURLSession sharedSession];
    //使用会话来创建任务,这里就需要使用请求了
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"数据接收完成%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //运行创建好的任务
    [task resume];

}
//Post异步行为
-(void)asyRequestBtnPost:(UIButton *)sender
{
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/xinwen/getsearchs.php"];
    //post就必须要设置请求了，那么久需要动态请求了
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置请求的方法为post
    [request setHTTPMethod:@"post"];
    //设置请求的主体
    NSString *str=@"content=12";
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    //异步的时候这里就不能使用单例了，要使用代理了
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //使用会话来创建任务,这里就需要使用请求了
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request];
    //运行创建好的任务
    [task resume];
}
#pragma mask Post Asy Action
//这里也喝6的一样写了就重复了，但是更便于理解哦
//-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
//{
//    NSLog(@"开始有响应了");//9.0以后这里需要设置允许，不然不会继续响应下面的事件了
//    completionHandler(NSURLSessionResponseAllow);//设置允许
//    [self.mutableDataGet setLength:0];
//}
//-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
//{
//    NSLog(@"开始不断接受数据了");//和6版本一样这里在数据很大的时候也会分段
//    [self.mutableDataGet appendData:data];//接受数据
//}
//-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
//{
//    NSLog(@"完成接受和带回错误%@,%@",error,[[NSString alloc]initWithData:self.mutableDataGet encoding:NSUTF8StringEncoding]);
//    
//}
@end





















