//
//  ViewController.m
//  第三方json文件解析
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "Json.h"
#import "JsonKit.h"
#import "CJSONSerializer.h"
#import "CJSONDeserializer.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSMutableDictionary *dic;
@property (nonatomic,strong) NSString *text;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SBJson:(UIButton *)sender {
    //GCD异步实现
    dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q1, ^{
        //还是先获取url
        NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/25995508"];
        //返回上面url的内容，格式为Json放在了字符串里
        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //实例化SBJson对象，将Json格式字符串解析，转化为字典。
        SBJsonParser *parser = [[SBJsonParser alloc] init];
        self.dic = [parser objectWithString:jsonString error:nil];
        NSString *title = [self.dic objectForKey:@"original_title"];
        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
        NSString *genres = [NSString stringWithFormat:@"%@/%@", [genresArray objectAtIndex:0], [genresArray objectAtIndex:1]];
        NSString *summary = [self.dic objectForKey:@"summary"];
        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
        //更新UI操作需要在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = self.text;
        });
    });
}

- (IBAction)JsonKit:(UIButton *)sender {
    //GCD异步实现
    dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q1, ^{
        //还是先获取url
        NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/26279433"];
        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //代码越来越简单了有木有！！就一个方法搞定~
        self.dic = [jsonString objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
        NSString *title = [self.dic objectForKey:@"original_title"];
        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
        NSString *genres = [NSString stringWithFormat:@"%@/%@", [genresArray objectAtIndex:0], [genresArray objectAtIndex:1]];
        NSString *summary = [self.dic objectForKey:@"summary"];
        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
        //更新UI操作需要在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = self.text;
        });
    });
}

- (IBAction)TouchJson:(UIButton *)sender {
    //GCD异步实现
    dispatch_queue_t q1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(q1, ^{
        //还是先获取url
        NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/movie/subject/22265299"];
        NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        //还是一句话的事儿
        self.dic = [[CJSONDeserializer deserializer] deserialize:[jsonString dataUsingEncoding:NSUTF8StringEncoding] error:nil];
        NSString *title = [self.dic objectForKey:@"original_title"];
        NSMutableArray *genresArray = [self.dic objectForKey:@"genres"];
        NSString *genres = [NSString stringWithFormat:@"%@/%@", [genresArray objectAtIndex:0], [genresArray objectAtIndex:1]];
        NSString *summary = [self.dic objectForKey:@"summary"];
        self.text = [NSString stringWithFormat:@"电影名称：\n%@\n体裁：\n%@\n剧情简介：\n%@", title, genres, summary];
        //更新UI操作需要在主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            self.textView.text = self.text;
        });
    });
}
@end
