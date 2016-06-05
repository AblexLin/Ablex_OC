//
//  ViewController.m
//  2016.06.04(webview&collection)
//
//  Created by 顾明轩 on 16/6/4.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#define MYURL @"https://www.baidu.com"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //想要加载网页首先需要创建一个url的对象
    NSURL *url=[NSURL URLWithString:MYURL];
    
    //然后使用这个网页的对象创建一个请求
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    //创建好了以后再加载这个视图
    [self.webView loadRequest:request];
    
    //特别说明，在ios9里面新增一个ATS导致旧式的网站总是请求失败，这个时候需要在info里面新增一组键值对
    // <key>NSAppTransportSecurity</key>
    // <dict>
    // <key>NSAllowsArbitraryLoads</key>
    // <true/>
    // </dict>
    //在没有添加这个键值对的时候是不能访问百度的，添加以后就能正常访问了
    //Github一直可以访问哦
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
