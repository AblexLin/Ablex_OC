//
//  ViewController.m
//  2016.06.11(get&&post login&&regist)
//
//  Created by 顾明轩 on 16/6/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//文本框
@property (weak, nonatomic) IBOutlet UITextField *unameText;
@property (weak, nonatomic) IBOutlet UITextField *upassText;

//同步异步登录注册按钮(GET方法)
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet UIButton *asyLoginBtn;
@property (weak, nonatomic) IBOutlet UIButton *asyResgitBtn;
//同步异步登录注册按钮(POST方法)
- (IBAction)postLogin:(UIButton *)sender;
- (IBAction)postRegister:(UIButton *)sender;

//同步异步登录注册按钮行为
- (IBAction)loginTap:(UIButton *)sender;
- (IBAction)registTap:(UIButton *)sender;
- (IBAction)asyLoginTap:(UIButton *)sender;
- (IBAction)asyResgitTap:(UIButton *)sender;

//声明异步接受数据用的data
@property (strong, nonatomic) NSMutableData *mutableData;

//关闭键盘
- (IBAction)closeKeyBoard:(id)sender;
@end

@implementation ViewController

@synthesize unameText,upassText;
@synthesize loginBtn,registBtn;
@synthesize asyLoginBtn,asyResgitBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//同步请求数据的方式获取data来登录
- (IBAction)loginTap:(UIButton *)sender {
    NSString *name=self.unameText.text;
    NSString *pass=self.upassText.text;
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    pass=[pass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([pass isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.102/php/lg&&rg.php?uname=%@&upass=%@&action=login",name,pass];
    NSLog(@"%@",str);
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data==nil) {
        NSLog(@"连接数据库失败！");
    }
    else{
        NSString *datastr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSRange range=[datastr rangeOfString:@"success"];
        if (range.location!=NSNotFound) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"恭喜你，登录成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号或密码错误！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }

}
//同步请求数据的方式获取data来注册
- (IBAction)registTap:(UIButton *)sender {
    NSString *name=self.unameText.text;
    NSString *pass=self.upassText.text;
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    pass=[pass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([pass isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.102/php/lg&&rg.php?uname=%@&upass=%@&action=register",name,pass];
    NSLog(@"%@",str);
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    NSData *data=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (data==nil) {
        NSLog(@"连接数据库失败！");
    }
    else{
        NSString *datastr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSRange range=[datastr rangeOfString:@"success"];
        if (range.location!=NSNotFound) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"恭喜你，注册成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号已存在！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }

}

//异步请求数据的方式获取data来登录
- (IBAction)asyLoginTap:(UIButton *)sender {
    NSString *name=self.unameText.text;
    NSString *pass=self.upassText.text;
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    pass=[pass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([pass isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    NSString *str=[NSString stringWithFormat:@"http://192.168.0.102/php/lg&&rg.php?uname=%@&upass=%@&action=login",name,pass];
    NSLog(@"%@",str);
    NSURL *url=[NSURL URLWithString:str];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    self.mutableData=[[NSMutableData alloc]init];
    [NSURLConnection connectionWithRequest:request delegate:self];//异步需要实现代理
    
}
//异步请求数据的方式获取data来注册
- (IBAction)asyResgitTap:(UIButton *)sender {
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"返回开始接受的响应");
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"不断接受数据");//数据较大的时候会多次调用这个函数
    [self.mutableData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *str=[[NSString alloc]initWithData:self.mutableData encoding:NSUTF8StringEncoding];
    NSLog(@"接受结束，%@",str);
    if (self.mutableData==nil) {
        NSLog(@"接受数据库失败！");
    }
    else{
        NSString *datastr=[[NSString alloc]initWithData:self.mutableData encoding:NSUTF8StringEncoding];
        NSRange range=[datastr rangeOfString:@"success"];
        if (range.location!=NSNotFound) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"恭喜你，登录成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号或密码错误！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"有错误出现了");
}
- (IBAction)closeKeyBoard:(id)sender {
    [unameText resignFirstResponder];
    [upassText resignFirstResponder];
}
//POST能够传递大量的数据，并且支持中文，但是需要修改一点php文件的传递方式
- (IBAction)postLogin:(UIButton *)sender {
    NSString *name=self.unameText.text;
    NSString *pass=self.upassText.text;
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    pass=[pass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([pass isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    NSString *str=@"http://192.168.0.102/php/lg&&rg.php";
    NSLog(@"%@",str);
    NSURL *url=[NSURL URLWithString:str];
    //需要定义一个动态的请求，这也是和上面get方式的差别的地方,20秒就算超时
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    //设置请求数据的方法为post
    [request setHTTPMethod:@"post"];
    //定制字符串
    NSString *str2=[NSString stringWithFormat:@"uname=%@&upass=%@&action=login",name,pass];
    
    //设置请求的主体使用一个data
    [request setHTTPBody:[str2 dataUsingEncoding:NSUTF8StringEncoding]];
    //使用设置好的请求连接数据库
    NSData *revdata=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (revdata==nil) {
        NSLog(@"连接数据库失败！");
    }
    else{
        NSString *datastr=[[NSString alloc]initWithData:revdata encoding:NSUTF8StringEncoding];
        NSRange range=[datastr rangeOfString:@"success"];
        if (range.location!=NSNotFound) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"恭喜你，登录成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号或者密码错误，请重新输入！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

- (IBAction)postRegister:(UIButton *)sender {
    NSString *name=self.unameText.text;
    NSString *pass=self.upassText.text;
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    pass=[pass stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([name isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    if ([pass isEqualToString:@""]) {
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:close];
        [self presentViewController:alert animated:YES completion:nil];
    }
    NSString *str=@"http://192.168.0.102/php/lg&&rg.php";
    NSLog(@"%@",str);
    NSURL *url=[NSURL URLWithString:str];
    //需要定义一个动态的请求，这也是和上面get方式的差别的地方,20秒就算超时
    NSMutableURLRequest *request=[[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    //设置请求数据的方法为post
    [request setHTTPMethod:@"post"];
    //定制字符串
    NSString *str2=[NSString stringWithFormat:@"uname=%@&upass=%@&action=register",name,pass];

    //设置请求的主体使用一个data
    [request setHTTPBody:[str2 dataUsingEncoding:NSUTF8StringEncoding]];
    //使用设置好的请求连接数据库
    NSData *revdata=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (revdata==nil) {
        NSLog(@"连接数据库失败！");
    }
    else{
        NSString *datastr=[[NSString alloc]initWithData:revdata encoding:NSUTF8StringEncoding];
        NSRange range=[datastr rangeOfString:@"success"];
        if (range.location!=NSNotFound) {
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"恭喜你，注册成功！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
        else{
            UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:@"账号已存在！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *close=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:close];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}
@end
