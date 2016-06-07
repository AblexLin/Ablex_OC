//
//  ViewController.m
//  2016.06.07(CoreData)
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *name;             //文本框姓名的定义
@property (weak, nonatomic) IBOutlet UITextField *age;              //文本框年龄的定义

@property (strong, nonatomic) AppDelegate *app;                     //应用程序代理对象
@property (strong, nonatomic) NSManagedObjectContext *context;      //托管上下文的对象

- (IBAction)addStudent:(UIButton *)sender;                          //增加学生信息按钮
- (IBAction)selectStudent:(UIButton *)sender;                       //查找学生信息按钮
- (IBAction)deleteStudent:(UIButton *)sender;                       //删除学生信息按钮
- (IBAction)updateStudent:(UIButton *)sender;                       //修改学生信息按钮

@end

@implementation ViewController
@synthesize app,context;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*!
     实现应用程序代理的对象，因为所有的持久化相关的数据都在应用程序代理里面
    */
    app=[UIApplication sharedApplication].delegate;
    
    /*!
     创建一个托管对象上下文的对象，创建这个对象以后，doc路径下就会自动生成数据库文件了
    */
    context=app.managedObjectContext;
    
    /*!
     在_016_06_07_CoreData_这个文件中添加字段（列）的时候，切记需要吧检查器里的那个optional的勾选取消掉，因为必须要写入数据库，而不是可选写入
    */
    
    
}
//添加学生信息
- (IBAction)addStudent:(UIButton *)sender {
    
    NSString *name=self.name.text;          //获取文本中的姓名字符串
    NSString *age=self.age.text;            //获取文本中的年龄字符串
    name=[name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];  //去除姓名字符串中的空格
    age=[age stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];    //去除年龄字符串中的空格
    /*!
     还可以对姓名等做一些有效性检查，这里就暂时不做了！
    */
    NSNumber *num=[NSNumber numberWithInt:[age intValue]];                                //想要给托管对象增加数据，必须使用对象，否则无法添加会报错，所以这里需要吧int变成nsnumber
    
    NSManagedObject *mo=[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];//从实体中获取来托管对象
    
    [mo setValue:name forKey:@"name"];      //给姓名字段添加数据对象
    [mo setValue:num forKey:@"age"];        //给姓年龄段添加数据对象
    
    //[context insertObject:mo];            //因为上面使用的就是在context里的来insert的，所以这里没有这个语句也能正常插入
    
    NSError *err=nil;                       //创建记录错误信息的对象
    if (![context save:&err]) {             //保存下上下文数据到本地
        NSLog(@"文件保存失败！");
    }
    else{
        NSLog(@"文件保存成功！");
    }
}
//查找学生信息
- (IBAction)selectStudent:(UIButton *)sender {
    //创建一个实体的对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个请求通过实体对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    //创建一个谓词
    //NSPredicate *pre=[NSPredicate predicateWithFormat:@"age=%d",27];
    //NSPredicate *pre1=[NSPredicate predicateWithFormat:@"name=%@",@"laopo"];
    //设置请求的谓词
    //[request setPredicate:pre1];
    
    NSError *err=nil;
    //通过上下文来运行请求
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {
            NSLog(@"姓名＝%@,年龄＝%@",[mo valueForKey:@"name"],[mo valueForKey:@"age"]);
        }
    }
    if (![context save:&err]) {             //保存下上下文数据到本地
        NSLog(@"文件保存失败！%@",err);
    }
    else{
        NSLog(@"文件保存成功！");
    }
}
//删除学生信息
- (IBAction)deleteStudent:(UIButton *)sender {
    //创建一个实体的对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个请求通过实体对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    //创建一个谓词
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"age=%d",27];
    //设置请求的谓词
    [request setPredicate:pre];
    
    NSError *err=nil;
    //通过上下文来运行请求
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {
            [context deleteObject:mo];      //删除托管对象
        }
    }
    if (![context save:&err]) {             //保存下上下文数据到本地
        NSLog(@"文件保存失败！%@",err);
    }
    else{
        NSLog(@"文件保存成功！");
    }

}
//修改学生信息
- (IBAction)updateStudent:(UIButton *)sender {
    //创建一个实体的对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个请求通过实体对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    [request setEntity:entity];
    
    //创建一个谓词
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"age=%d",22];
    //设置请求的谓词
    [request setPredicate:pre];
    
    NSError *err=nil;
    //通过上下文来运行请求
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {
            [mo setValue:@"nihao" forKey:@"name"];                  //根据谓词修改学生信息
            [mo setValue:[NSNumber numberWithInt:30] forKey:@"age"];//修改学生姓名
        }
    }
    if (![context save:&err]) {             //保存下上下文数据到本地
        NSLog(@"文件保存失败！%@",err);
    }
    else{
        NSLog(@"文件保存成功！");
    }
}

@end
