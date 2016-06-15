//
//  ViewController.m
//  Json文件解析
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"%@",dict);
        NSDictionary *dict2=[dict objectForKey:@"weatherinfo"];
        NSLog(@"%@",dict2);
    }];
    [task resume];
}

@end
