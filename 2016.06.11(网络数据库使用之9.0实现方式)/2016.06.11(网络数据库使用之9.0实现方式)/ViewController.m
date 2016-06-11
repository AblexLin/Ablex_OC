//
//  ViewController.m
//  2016.06.11(网络数据库使用之9.0实现方式)
//
//  Created by 顾明轩 on 16/6/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
- (IBAction)tap:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *guancatap;
- (IBAction)guancaTap:(UIButton *)sender;
@property (strong, nonatomic) NSMutableData *mudata;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //get方式获取mysql也就是网络数据库
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html"];
    //定义一个单例获取的始终是同一个会话
    NSURLSession *session=[NSURLSession sharedSession];
    //使用会话去获取一个任务
    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"进程二获取数据后%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //有了任务后就要执行任何
    [task resume];
    self.mudata=[[NSMutableData alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UIButton *)sender {
    //post获取数据的时候，那么就需要使用resquest请求了
    NSURL *postUrl=[NSURL URLWithString:@"http://115.159.1.248:56666/xinwen/getsearchs.php"];
    //想要定制请求，那么必须使用动态的请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:postUrl];
    //设置请求的方法
    [request setHTTPMethod:@"post"];
    //设置请求的主体，其实就是想要传递的数据
    NSString *dataStr=@"content=1";
    [request setHTTPBody:[dataStr dataUsingEncoding:NSUTF8StringEncoding]];
    //定制一个会话
    NSURLSession *postSession=[NSURLSession sharedSession];
    //使用会话来定制任务
    NSURLSessionDataTask *postTask=[postSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"这里可以输入控件相关代码");});
    }];
    //执行任务
    [postTask resume];
}
- (IBAction)guancaTap:(UIButton *)sender {
    //get方式为例子
    NSURL *url=[NSURL URLWithString:@"http://115.159.1.248:56666/index.html"];
    //定义一个单例和上面的不同，不是使用shared来初始化的,并设置好代理
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    //使用会话去获取一个任务
    NSURLSessionDataTask *task=[session dataTaskWithURL:url];
    //有了任务后就要执行任何
    [task resume];
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler{
    NSLog(@"有响应了");
    //如果这里什么都不做的话，就只运行到这里哦需要在9.0以后要在这里设置运行才可以
    completionHandler(NSURLSessionResponseAllow);//其实就是设置允许继续响应
    [self.mudata setLength:0];//每次刚响应的时候应该清除数据
}
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"开始接受数据了");
    [self.mudata appendData:data];
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"完成数据接收了，不管数据传递是否有错都进来这里，而且error带来是否错误%@  %@",[[NSString alloc]initWithData:self.mudata encoding:NSUTF8StringEncoding],error);
    
}
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend{
    NSLog(@"使用下载的时候可以在这里实现断点继续下载功能，关注下，但是在这里不好使用");
}
@end