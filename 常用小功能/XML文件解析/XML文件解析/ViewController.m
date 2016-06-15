//
//  ViewController.m
//  XML文件解析
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "GMXxuan.h"
@interface ViewController ()<NSXMLParserDelegate>
{
    //第一种格式解析，也就是默认解析
    BOOL isXuan;
    GMXxuan *xuan;
    NSString *proName;
    NSMutableArray *xuans;
    
    //第二种解析，通过属性格式来解析比较简单
    BOOL isXuan2;
    GMXxuan *xuan2;
    NSString *proName2;
    NSMutableArray *xuans2;
    
    //第三方解析，了解即可，毕竟太多，需要用的时候，可以借鉴xml和json解析里的谷歌解析那是通过文档的方式来解析的
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"xuanxuan" ofType:@"xml"];
    NSData *data=[NSData dataWithContentsOfFile:path];
    
    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];

    parser.delegate=self;    //解析xml必须通过代理
    [parser parse];          //运行解析
}
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"xml文件解析之文档开始!");
    isXuan=NO;
    proName=@"";
    xuans=[NSMutableArray arrayWithCapacity:100];
    //---分割线---//
    xuans2=[NSMutableArray arrayWithCapacity:100];
}
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"xml文件解析之元素开始!");
    if (isXuan==YES) {
        proName=elementName;
    }
    if ([elementName isEqualToString:@"xuan"]) {
        isXuan=YES;
        xuan=[[GMXxuan alloc]init];
    }
    //---分割线---//
    if ([elementName isEqualToString:@"xuan2"]) {
        NSLog(@"%@",attributeDict);
        xuan2=[[GMXxuan alloc]init];
        NSArray *arr=[attributeDict allKeys];
        for (NSString *str in arr) {
            [xuan2 setValue:[attributeDict valueForKey:str] forKey:str];
        }
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"xml文件解析之发现字符串%@",string);
    if (isXuan==YES && proName.length>0) {
        [xuan setValue:string forKey:proName];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"xml文件解析之元素结束!");
    if ([elementName isEqualToString:@"xuan"]) {
        isXuan=NO;
        [xuans addObject:xuan];
    }
    proName=@"";
    
    //---分割线---//
    if ([elementName isEqualToString:@"xuan2"]) {
        [xuans2 addObject:xuan2];
    }
}
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"xml文件解析之文档结束!");
    for (GMXxuan *x in xuans) {
        NSLog(@"姓名:%@ 性别:%@ 年龄:%d",x.name,x.sex,x.age);
    }
    for (GMXxuan *x in xuans2) {
        NSLog(@"姓名:%@ 性别:%@ 年龄:%d",x.name,x.sex,x.age);
    }
}

@end
