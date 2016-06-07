//
//  CoreDataViewController.m
//  CoreData持久化
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "CoreDataViewController.h"
#import "AppDelegate.h"

@interface CoreDataViewController ()

//定义文本框属性
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;

//定义增删查改四个按钮
- (IBAction)addStudent:(id)sender;
- (IBAction)findStudent:(id)sender;
- (IBAction)updateStudent:(id)sender;
- (IBAction)deleteStudent:(id)sender;
/*!
 增加学生的时候只要创建个托管对象就好了，然后对应的去赋值，
 查找，修改，删除的时候就需要先获取实体对象，先后创建请求，再运行请求，或者中间设置谓词，最后再保存上下文
 */
@end

@implementation CoreDataViewController

- (IBAction)addStudent:(id)sender {
    AppDelegate *app=[UIApplication sharedApplication].delegate;        //获取应用程序代理对象
    NSManagedObjectContext *context=app.managedObjectContext;           //获取应用程序代理里的属性托管对象上下文
    /*!
     以上两步执行后队友的数据库文件久生成了，对应的表格在CoreData___文件里面也定制了，所以都生产ok了
     */
    NSManagedObject *mo=[NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:context];//新建托管对象，其实就是一个表格对象
    
    NSString *name=self.name.text;
    NSString *age=self.age.text;
    NSNumber *numAge=[NSNumber numberWithInt:[age intValue]];
    
    [mo setValue:name forKey:@"name"];
    [mo setValue:numAge forKey:@"age"];
    //[context insertObject:mo];
    
    NSError *err;
    if (![context save:&err]) {         //文件必须保存，否则内容就存在内存中，不会保存到本地的
        NSLog(@"%@",err);
    }
    else{
        NSLog(@"增加学生ok");
    }
    
}

- (IBAction)findStudent:(id)sender {
    AppDelegate *app=[UIApplication sharedApplication].delegate;        //获取应用程序代理对象
    NSManagedObjectContext *context=app.managedObjectContext;           //获取应用程序代理里的属性托管对象上下文
    /*!
     以上两步执行后队友的数据库文件久生成了，对应的表格在CoreData___文件里面也定制了，所以都生产ok了
     */
    //先从上下文（连接）中获取实体对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个访问的请求对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    //设置请求需要的实体
    [request setEntity:entity];
    //使用链接来运行这个请求
    NSError *err;
    //运行后返回的是一个托管的对象组成的数组
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {
            NSLog(@"姓名:%@ 年龄:%@",[mo valueForKey:@"name"],[mo valueForKey:@"age"]);
        }
    }
    else{
        NSLog(@"%@",err);
    }
    if (![context save:&err]) {         //文件必须保存，否则内容就存在内存中，不会保存到本地的
        NSLog(@"%@",err);
    }
    else{
        NSLog(@"查找学生ok");
    }
}

- (IBAction)updateStudent:(id)sender {
    AppDelegate *app=[UIApplication sharedApplication].delegate;        //获取应用程序代理对象
    NSManagedObjectContext *context=app.managedObjectContext;           //获取应用程序代理里的属性托管对象上下文
    /*!
     以上两步执行后队友的数据库文件久生成了，对应的表格在CoreData___文件里面也定制了，所以都生产ok了
     */
    //先从上下文（连接）中获取实体对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个访问的请求对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    //设置请求需要的实体
    [request setEntity:entity];
    
    //修改的时候需要先设置个条件，不然就全部修改了
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"age=%d",15];
    //给请求添加一个条件
    [request setPredicate:pre];
    
    //使用链接来运行这个请求
    NSError *err;
    //运行后返回的是一个托管的对象组成的数组
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {

            [mo setValue:@"尼玛" forKey:@"name"];
            [mo setValue:[NSNumber numberWithInt:25] forKey:@"age"];
        }
    }
    else{
        NSLog(@"%@",err);
    }
    if (![context save:&err]) {         //文件必须保存，否则内容就存在内存中，不会保存到本地的
        NSLog(@"%@",err);
    }
    else{
        NSLog(@"修改学生ok");
    }
}

- (IBAction)deleteStudent:(id)sender {
    AppDelegate *app=[UIApplication sharedApplication].delegate;        //获取应用程序代理对象
    NSManagedObjectContext *context=app.managedObjectContext;           //获取应用程序代理里的属性托管对象上下文
    /*!
     以上两步执行后队友的数据库文件久生成了，对应的表格在CoreData___文件里面也定制了，所以都生产ok了
     */
    //先从上下文（连接）中获取实体对象
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Student" inManagedObjectContext:context];
    //创建一个访问的请求对象
    NSFetchRequest *request=[[NSFetchRequest alloc]init];
    //设置请求需要的实体
    [request setEntity:entity];
    
    //修改的时候需要先设置个条件，不然就全部修改了
    NSPredicate *pre=[NSPredicate predicateWithFormat:@"age=%d",156];
    //给请求添加一个条件
    [request setPredicate:pre];
    
    //使用链接来运行这个请求
    NSError *err;
    //运行后返回的是一个托管的对象组成的数组
    NSArray *objects=[context executeFetchRequest:request error:&err];
    if (objects) {
        for (NSManagedObject *mo in objects) {
            [context deleteObject:mo];
        }
    }
    else{
        NSLog(@"%@",err);
    }
    if (![context save:&err]) {         //文件必须保存，否则内容就存在内存中，不会保存到本地的
        NSLog(@"%@",err);
    }
    else{
        NSLog(@"删除学生ok");
    }
}
@end
