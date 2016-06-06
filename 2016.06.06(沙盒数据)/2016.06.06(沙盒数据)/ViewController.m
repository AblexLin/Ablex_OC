//
//  ViewController.m
//  2016.06.06(沙盒数据)
//
//  Created by 顾明轩 on 16/6/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "MyClass.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (IBAction)homePath:(UIButton *)sender;
- (IBAction)docPath:(UIButton *)sender;
- (IBAction)libPath:(UIButton *)sender;
- (IBAction)tempPath:(UIButton *)sender;
- (IBAction)writeMyClass:(UIButton *)sender;
- (IBAction)newView:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //未整理前的数据
    /*
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=NSHomeDirectory();                       //获取家的路径
    //path=[path stringByAppendingPathComponent:@"abc.txt"];  //通过获取来的家的路径来创建一个文件夹
    NSString *strs=@"homePath";                             //定义需要写入文件的文件夹
    //[strs writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];//写文件，如果是自定义的类那么就需要使用archeiver了
    NSLog(@"home:%@",path);
    //在实际的手机上，这个路径是不可写的，根目录，所以需要吧文件写入到document里面去
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//获取document的路径，返回的一个数组
    NSString *documentPath=[paths objectAtIndex:0];//获取文本的那个路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:@"xxx.txt"];
    NSLog(@"document:%@",documentPath);
    
     sure,you also can use home&/document的方式去获取
     
    NSLog(@"home&/document:%@",[NSString stringWithFormat:@"%@/Documents",path]);
    NSString *xieru=[NSString stringWithFormat:@"%@/Documents/aaa.txt",path];
    [strs writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *readStr=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",readStr);//可以读出来
    
    
    //家的路径文件读取方式
    /*!
    1.通过NSHomeDirectory()获取家的路径，然后获取到了以后再在这里创建文件保存数据path=[path stringByAppendingPathComponent:@"abc.txt"]这样的形式来做
     
    //获取documents文件的目的是因为家的路径在实际的手机上是只读的，那就没办法写入文件了，所以需要读取documents的路径，有两种方法
    /*!
    1. //NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//获取document的路径，返回的一个数组
       //NSString *documentPath=[paths objectAtIndex:0];//获取文本的那个路径
       //NSString *filePath=[documentPath stringByAppendingPathComponent:@"xxx.txt"];//创建包含文本文件的路径，最后使用这个路径来写入就好了
    2.第二种方式就是先读取家的路径，然后在家的路径下面通过字符串连接的方式获取documents的路径，还可以直接在路径后面加文件名字[NSString stringWithFormat:@"%@/Documents/aaa.txt",path]像这样也是支持的
    */
    //整理后的数据看下面的四个按钮对应的数据，家和temp使用行为就好，文本和库的则需要使用数组来获取，当然使用家的路径和/docments字符串连接也是可以的，测试过，没问题哦
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)homePath:(UIButton *)sender {
    NSString *path=NSHomeDirectory();                                                           //获取家的路径
    NSString *filePath=[path stringByAppendingPathComponent:@"saveForHome.plist"];              //在获取到的家的路径下创建一个plist文件
    NSString *wantSaveStr=@"轩爷你好啊！";                                                        //设置想要保存的数据
    [wantSaveStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];  //把字符串写入文件
    self.textView.text=filePath;                                                                //显示路径到多行文本框上面去
}

- (IBAction)docPath:(UIButton *)sender {
    NSArray *ay=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);//获取doc路径的数组
    NSString *path=[ay objectAtIndex:0];                                                        //获取doc的路径字符串
    NSString *filePath=[path stringByAppendingPathComponent:@"saveForDoc.plist"];               //在获取到的家的路径下创建一个plist文件
    NSString *wantSaveStr=@"轩爷你好啊！";                                                        //设置想要保存的数据
    [wantSaveStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];  //把字符串写入文件
    self.textView.text=filePath;                                                                //显示路径到多行文本框上面去
}

- (IBAction)libPath:(UIButton *)sender {
    NSArray *ay=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES); //获取lib路径的数组
    NSString *path=[ay objectAtIndex:0];                                                        //获取lib的路径字符串
    NSString *filePath=[path stringByAppendingPathComponent:@"saveForLib.plist"];               //在获取到的家的路径下创建一个plist文件
    NSString *wantSaveStr=@"轩爷你好啊！";                                                        //设置想要保存的数据
    [wantSaveStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];  //把字符串写入文件
    self.textView.text=filePath;                                                                //显示路径到多行文本框上面去
}

- (IBAction)tempPath:(UIButton *)sender {
    NSString *path=NSTemporaryDirectory();                                                      //获取temp的路径
    NSString *filePath=[path stringByAppendingPathComponent:@"saveForTemp.plist"];              //在获取到的temp的路径下创建一个plist文件
    NSString *wantSaveStr=@"轩爷你好啊！";                                                        //设置想要保存的数据
    [wantSaveStr writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];  //把字符串写入文件
    self.textView.text=filePath;                                                                //显示路径到多行文本框上面去
}

- (IBAction)writeMyClass:(UIButton *)sender {
    MyClass *myData=[[MyClass alloc]init];                                                      //创建一个自定义类的对象
    NSString *path=NSTemporaryDirectory();                                                      //获取temp的路径
    NSString *filePath=[path stringByAppendingPathComponent:@"saveForMyData.plist"];            //在路径下新建文件夹
    [NSKeyedArchiver archiveRootObject:myData toFile:filePath];                                 //写入自定义类的对象到文件
    NSLog(@"%@",filePath);                                                                      //打印路径查看是否正常
    MyClass *readData=[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];                     //读取本地已经存在文件
    NSLog(@"str:%@ array:%@ dictionary:%@",readData.str,readData.array,readData.dictionary);    //打印文件中读取来的数据是否正常
}

- (IBAction)newView:(UIButton *)sender {
}
@end
