//
//  ViewController.m
//  2016.06.13(thread多线程)
//
//  Created by 顾明轩 on 16/6/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int tickets;
    int tickets2;
    NSLock *lockon;
    NSLock *lockon2;
}
/*!
 介绍：每个应用程序都是一个进程，每个应用程序里有多个线程，线程越多，占用的系统资源也就越多，运行的时间也就越长
 1.NSThread
 2.NSOperation
 3.GCD(Grand Central Dispatch)
 4.self performSelectorInBackground:<#(nonnull SEL)#> withObject:<#(nullable id)#>这是第四种，创建一个后台的线程
 何时使用：1.想要使用更多系统资源的，占用更多时间的 2.需要运行时间很长的，比如下载
 核介绍：1.双核表示同一时间能运行两个线程 2.计算机最小的运行单位就是线程
*/

//声明三个按钮
- (IBAction)btnNSThread:(UIButton *)sender;
- (IBAction)btnNSOperation:(UIButton *)sender;
- (IBAction)btnGCD:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *outletGCD;

//卖票的三个按钮
- (IBAction)btnNSThreadTickets:(UIButton *)sender;

- (IBAction)btnGCDTickets:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tickets=100;
    //回调函数block学习,块在oc中也是一个对象，但是也是一个特殊的函数
    int n=22;           //在下面的输出中可以输出n，但是如果想改变n的数据，那就不可以了，必须使用__block才可以
    __block int m=30;   //m如此定义的话，m＋＋就能够输出了
    void (^show) (int); //声明一个块
    show=^(int a){
        NSLog(@"block study!a=%d,n=%d,m=%d",a,n,++m);
    };                  //块的实现部分
    show(32);           //块的调用
    //函数只能声明在函数的外面，但是块可以声明在任何地方
    //
}
// 3.GCD卖票小程序
- (IBAction)btnGCDTickets:(UIButton *)sender {
    //定义卖票的块
    tickets2=100;
    lockon2=[[NSLock alloc]init];
    void (^saleTickets)()=^(){
        [lockon lock];//锁起来
        while (1) {
            if (tickets2>0) {
                
                [NSThread sleepForTimeInterval:4];
                [lockon2 lock];
                NSLog(@"窗口卖出了第%d张票!",tickets2--);
                [lockon2 unlock];
            }
            else{
                break;
            }
        }
        [lockon unlock];
    };
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);   //创建六个卖票的线程
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);
    dispatch_async(dispatch_get_global_queue(0, 0), saleTickets);
    
}
// 3.GCD(Grand Central Dispatch)这个是主推的，放在前面
- (IBAction)btnGCD:(UIButton *)sender {
    //既高效又简单，但是它的本质是使用2的NSOperation的队列方式实现的，主推，以后就使用这个来实现多线程
    NSLog(@"this is GCD 多线程!");
    //苹果推崇使用的，arc,GCD,BLOCK要多使用哦
    //块
    //返回值 (^块名字) (形参)=^(实参){实现部分};
//    [self presentViewController:nil animated:NO completion:^{
//        NSLog(@"终于明白这玩意了，这么久了，其实块本身也就是个函数");
//    }];
    //了解块是学习gcd的基础哦～～～
    //来，创建一个异步的GCD线程，后面的参数0，0是固定的，不管他
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.outletGCD setTitle:@"passvalue" forState:UIControlStateNormal];       //这样做是不能修改ui相关的数据的，ui必须在主线程中去运行和修改
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.outletGCD setTitle:@"passvalue" forState:UIControlStateNormal];   //这样获取主队列，就能够修改啦
        });
        [self performSelectorOnMainThread:@selector(uichange:) withObject:@"heihei" waitUntilDone:YES];//这个函数的意思就是在主队列中呈现一个行为，很好记忆和理解
//        while (1) {
//            NSLog(@"this is the gcd thread!");//这个线程的编号肯定在主线程的后面，因为这个线程本来就是主线程创建出来的
//        }
    });
//    while (1) {
//        NSLog(@"this is the main thread!");
//    }
    //当然上面的方法方法还有一个，那就是通过行为
}
- (void)uichange:(id)_obj{
    [self.outletGCD setTitle:@"passvalue method2" forState:UIControlStateNormal];//这样也可以修改哦
    NSLog(@"%@",_obj);//还可以传递对象哦，只要是对象都可以传递来
}


// 1.NSThread基本知识学习
- (IBAction)btnNSThread:(UIButton *)sender {
    //新建一个线程，使用工厂的行为来创建
    [NSThread detachNewThreadSelector:@selector(newThread:) toTarget:self withObject:nil];
    //新建一个线程，使用初始化申请内存的方式来创建
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(newThread:) object:nil];
    //可以通过获取当前的线程，并设置线程的名字
    [NSThread currentThread].name=@"main thread";
    //申请内存的方式需要自己来启动线程
    [thread start];
    //2016-06-13 09:49:31.909 2016.06.13(thread多线程)[1087:883953] this is the new thread!
    //2016-06-13 09:49:31.909 2016.06.13(thread多线程)[1087:883954] this is the new thread!
    //根据这个返回的结果也可以知道，上面其实建立了两个线程了，只是调用的行为是同一个
    
//    while (1) {
//        NSLog(@"this is the main thread!");
//    }
    //2016-06-13 08:34:25.944 2016.06.13(thread多线程)[868:552108] this is the main thread!
    //868是进程编号，552108是线程编号，进程号和下面相同，但是线程不同，且两个线程是交替运行的
}
- (void)newThread:(NSThread *)sender{
    while (1) {
        [NSThread sleepForTimeInterval:2];//睡眠2秒
        NSLog(@"this is the new thread!");
    }
    
    //2016-06-13 08:34:25.944 2016.06.13(thread多线程)[868:552239] this is the new thread!
    //868是进程编号，552239是线程编号
}

// 2.NSOperation
- (IBAction)btnNSOperation:(UIButton *)sender {
    //NSOperation这个类本身是一个抽象的类，因为抽象类只能被继承，所以不能用它，需要使用NSInvocationOperation,这个其实就是继承NSOperation的
    NSInvocationOperation *operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(newThread:) object:nil];
//    [operation start];//运行它，这样的方式和thread是一样的
    //第二种效率较高的方式是使用队列
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [queue addOperation:operation];//这样的方式也是可以的
}


// 1.NSThread卖票实现
- (IBAction)btnNSThreadTickets:(UIButton *)sender {
    NSThread *thread1=[[NSThread alloc]initWithTarget:self selector:@selector(tickets:) object:nil];
    thread1.name=@"线程1";
    [thread1 start];
    NSThread *thread2=[[NSThread alloc]initWithTarget:self selector:@selector(tickets:) object:nil];
    thread2.name=@"线程2";
    [thread2 start];
    NSThread *thread3=[[NSThread alloc]initWithTarget:self selector:@selector(tickets:) object:nil];
    thread3.name=@"线程3";
    [thread3 start];
    NSThread *thread4=[[NSThread alloc]initWithTarget:self selector:@selector(tickets:) object:nil];
    thread4.name=@"线程4";
    [thread4 start];
    lockon=[[NSLock alloc]init];
    
}
- (void)tickets:(NSThread *)sender{
    while (1) {
        [lockon lock];  //加锁
        [NSThread sleepForTimeInterval:2];
        if (tickets>0) {
            NSLog(@"%@卖出了第%d张票!",[NSThread currentThread].name,tickets--);
        }
        [lockon unlock];//解锁
        if (tickets==0) {
            break;
        }
    }
}

@end
