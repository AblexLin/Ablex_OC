//
//  ViewController.m
//  2016.06.12(xml和son文件解析)
//
//  Created by 顾明轩 on 16/6/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "GMXStudent.h"
#import "GDataXMLNode.h"
@interface ViewController ()<NSXMLParserDelegate>
{
    GMXStudent *student;        //创建学生对象
    NSString *proName;          //定义学生属性的名称的变量
    BOOL isStudent;             //定义判断是不是学生的变量
    NSMutableArray *students;   //定义存放所有学生的数组
}

//xml文件解析按钮默认版
- (IBAction)xmlParser:(UIButton *)sender;
//xml文件解析按钮属性版
- (IBAction)xmlParserAttribute:(UIButton *)sender;
//xml文件解析按钮php获取版
- (IBAction)xmlParserRemote:(UIButton *)sender;
//xml文件解析按钮基于文档的，或者说第三方库的实现方式
- (IBAction)xmlParserDocument:(UIButton *)sender;

//json文件解析
- (IBAction)jsonParser:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    students=[NSMutableArray arrayWithCapacity:100];
}

//xml文件解析按钮默认版行为
- (IBAction)xmlParser:(UIButton *)sender {
    //解析xml文件一般有两种方法
    /*!
     1.基于文件的document方法，这样的方式需要使用第三方库一次性的把文件加载进来，比较消耗内存，一般不建议使用
     2.基于事件的，也就是使用代理来实现的，不占用内存，较好，下面使用这样的方式来学习
     */
    //第一步获取xml文件的路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"studentsDefault" ofType:@"xml"];
    //第二步以二进制的形式去读取文件内容
    NSData *data=[NSData dataWithContentsOfFile:path];
    //第三步通过二进制数据创建一个xml文件转换的对象
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
    //第四步实现代理，来获取事件响应
    parser.delegate=self;
    //第五步运行转换，这流程和之前学习的保存上下文啊，运行任务啊都一样 context save］［  task resume
    [parser parse];
    
//    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
}
#pragma mark Default
/*
//文档开始
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"文档开始");
    isStudent=NO;                       //文档开始初始化是不是学生变量
    [students removeAllObjects];        //文档开始的时候清除学生的集合
    proName=@"";
}
//元素开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"元素开始");
    if (isStudent==YES) {
        proName=elementName;             //把属性给属性名称，切记这里要放在上面，因为放下面，会把student也当成属性了，所以前置先判断
    }
    if ([elementName isEqualToString:@"student"]) {
        isStudent=YES;
        student=[[GMXStudent alloc]init];//如果是学生就初始化一个学生对象
    }
    
}
//发现字符串
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"发现字符串%@",string);
    if (isStudent==YES && proName.length>0) {
        [student setValue:string forKey:proName];
    }
}
//元素结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"元素结束");
    if ([elementName isEqualToString:@"student"]) {
        isStudent=NO;                   //如果元素结束的时候发现student，那么就把是学生变成no
        [students addObject:student];   //是学生结束的时候我才增加到学生集合里
    }
    proName=@"";                        //每次元素结束都应该清空下这个变量
    //之所以需要在这里清空是因为在元素结束后，进入下一个元素中间有换行符号，那么换行符号也是字符串，所以还会走上面的发现字符串行为，那么不清空就会把空的又给赋值，那么最后看到的就是空
}
//文档结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"文档结束");
    for (GMXStudent *s in students) {
        NSLog(@"name:%@,sex:%@,age:%d",s.name,s.sex,s.age);
    }
}
*/

//xml文件解析按钮属性版行为
- (IBAction)xmlParserAttribute:(UIButton *)sender {
    //解析xml文件一般有两种方法
    /*!
     1.基于文件的document方法，这样的方式需要使用第三方库一次性的把文件加载进来，比较消耗内存，一般不建议使用
     2.基于事件的，也就是使用代理来实现的，不占用内存，较好，下面使用这样的方式来学习
     */
    //第一步获取xml文件的路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"studentsAttribute" ofType:@"xml"];
    //第二步以二进制的形式去读取文件内容
    NSData *data=[NSData dataWithContentsOfFile:path];
    //第三步通过二进制数据创建一个xml文件转换的对象
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:data];
    //第四步实现代理，来获取事件响应
    parser.delegate=self;
    //第五步运行转换，这流程和之前学习的保存上下文啊，运行任务啊都一样 context save］［  task resume
    [parser parse];
    
    //    NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
}
#pragma mark Attribute
//文档开始
-(void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"文档开始");
    [students removeAllObjects];
}
//元素开始
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"元素开始elementName:%@,attributeDict:%@",elementName,attributeDict);//查看字典内容
    if ([elementName isEqualToString:@"student"]) {                            //如果是学生的开始，那么就创建对象然后读取字典里的数据，写入到学生的属性中去
        student=[[GMXStudent alloc]init];
        NSArray *array=[attributeDict allKeys];
        for (NSString *str in array) {
            [student setValue:[attributeDict objectForKey:str] forKey:str];    //这里使用kvc的方式能够自动识别age为整形，非常好
        }
    }
}
//发现字符串
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"发现字符串,使用属性的时候这里基本不用干活了%@",string);
}
//元素结束
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"元素结束%@",elementName);
    if ([elementName isEqualToString:@"student"]) {
        [students addObject:student];
    }
}
//文档结束
-(void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"文档结束");
    for (GMXStudent *s in students) {
        NSLog(@"name=%@,sex=%@,age=%d",s.name,s.sex,s.age);                     //因为上面使用了kvc所以这里可以返回的age就是int的，很好很方便，自动的匹配类型
    }
}

//xml文件解析按钮php获取版行为
- (IBAction)xmlParserRemote:(UIButton *)sender {
    //post,必须实现请求
    NSURL *url=[NSURL URLWithString:@"php.weather.sina.com.cn/xml.php"];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    NSString *str=@"city=北京&password=DJ0YnieT8234jlsk&day=0";
    [request setHTTPMethod:@"post"];
    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",data);
    }];
    [task resume];
    //因为网站无效，所以得不到，数据，得到数据后一样的解析方式就可以了
}
#pragma mark Remote

//以上三给都是基于事件的，这里介绍下基于文档的解析xml，也就是通过第三方库的方式
#pragma mark Doc
- (IBAction)xmlParserDocument:(UIButton *)sender {
    //视频读取网络的，我没有，还是读取本地吧
    //第一步获取xml文件的路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"studentsDefault" ofType:@"xml"];
    //第二步以二进制的形式去读取文件内容
    NSData *data=[NSData dataWithContentsOfFile:path];
    //拿到数据后创建一个文本
    GDataXMLDocument *doc=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    //有了文本以后就创建一个元素,通过这个文本的根元素来获取
    GDataXMLElement *element=doc.rootElement;
    //遍历这个元素的孩子元素
    for (GDataXMLElement *gstudent in element.children) {
        NSLog(@"%@",gstudent);//这里其实就是学生
        GMXStudent *mystudent=[[GMXStudent alloc]init];
        //再去遍历这个学生的孩子，就是属性了
        for (GDataXMLElement *property in gstudent.children) {
            NSLog(@"name=%@,value=%@",property.name,property.stringValue);//这里其实就是学生属性
            [mystudent setValue:property.stringValue forKey:property.name];
        }
        [students addObject:mystudent];
    }
    for (student in students) {
        NSLog(@"%@,%@,%d",student.name,student.sex,student.age);
    }
    
}

//json文件解析
- (IBAction)jsonParser:(UIButton *)sender {
    //先看看如何通过字典和数组生出一个json文件
    NSDictionary *dict1=[NSDictionary dictionaryWithObjectsAndKeys:@"轩爷",@"name",@"男",@"sex",@"22",@"age", nil];
    NSDictionary *dict2=[NSDictionary dictionaryWithObjectsAndKeys:@"首长",@"name",@"女",@"sex",@"21",@"age", nil];
    NSArray *array=[NSArray arrayWithObjects:dict1,dict2, nil];
    NSData *data=[NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
    //NSLog(@"%@,%@",array,[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    
    
    //网络端获取json数据来解析
    //这里有异常错误，换一个新的去实现jsaon,异常原因找到了，网址的前面没有加http。。。切记啊，忘记会死人的
    NSURL *url=[NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *task=[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dt=[dict objectForKey:@"weatherinfo"];
        NSArray *array=[dt allKeys];
        for (NSString *str in array) {
            NSLog(@"key=%@,value=%@",str,[dt valueForKey:str]);
        }
    }];
    [task resume];
    //其实就是个字典，哎， 累了，因为一个http://没加，所以要细心哦，醉啦
}

@end
