//
//  SqlitePersistentViewController.m
//  Sqlite持久化
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "SqlitePersistentViewController.h"
#import <sqlite3.h>
@interface SqlitePersistentViewController ()

/*!
 这里定义的属性虽然是属性的格式，但是却是类自己才能调用的哦，不像在头文件中的，别的类也是可以访问的
*/

//定义姓名和年龄的文本框
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *age;

//定义增、删、查、改四个按钮
- (IBAction)addStudentInfo:(id)sender;
- (IBAction)selectStudentInfo:(id)sender;
- (IBAction)updateStudentInfo:(id)sender;
- (IBAction)deleteStudentInfo:(id)sender;

//定义绑定专用标志
@property (assign, nonatomic) int flag;
/*!
 既可以使用绑定的方式来实现删除和修改的定制，也可以直接删除，绑定的方式建议查看增加学生信息中的数据哦
 */
@end

@implementation SqlitePersistentViewController

@synthesize flag;

- (IBAction)addStudentInfo:(id)sender {
    
    NSString *name=self.name.text;          //获取文本里的姓名字符串
    NSString *age=self.age.text;            //获取文本里的年龄字符串
    [self check:name];                      //获取来的姓名有效性检查
    [self check:age];                       //获取来的年龄有效性检查
    char *cName=[name UTF8String];          //转换姓名为c的字符串
    char *cAge=[age UTF8String];            //转换年龄为c的字符串
    NSNumber *numAge=[NSNumber numberWithInt:[age intValue]];
    
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"mydata.sqlite"];     //获取家的路径并确定需要新建的数据库文件的名字
    sqlite3 *mydb;                          //创建数据库对象
    sqlite3_open([path UTF8String], &mydb); //打开数据库
    NSString *sqlite=@"create table if not exists t_student (name,age)";                    //定义需要执行的sqlite语句
    char *err;                              //创建一个错误信息字符串
    int result=sqlite3_exec(mydb, [sqlite UTF8String], NULL, NULL, &err);                   //运行sqlite语句
    if (result!=SQLITE_OK) {                                                                //如果运行失败的话
        NSLog(@"sqlite run failed:%s",err); //如果运行失败那么打印出错信息
    }
    
    /*!
     上面是新建一个数据库文件，并定制其字段（列），增删查改里面都需要
     */
    NSString *sqliteForInsert=@"insert into t_student (name,age) values (?,?)";             //定义需要执行的sqlite语句
    sqlite3_stmt *stmtForInsert;                                                            //创建一个陈述的对象，其实就是个表格
    result=sqlite3_prepare_v2(mydb, [sqliteForInsert UTF8String], -1, &stmtForInsert, NULL);//准备运行sqlite语句
    if (result!=SQLITE_OK) {                //准备运行sqlite语句
        NSLog(@"预处理失败!");
    }
    else{
        result=sqlite3_bind_text(stmtForInsert, 1, cName, -1, NULL);//第一个变量是陈述，第二个变量是第几个问号，第三个变量是需要绑定的数据，第四个是陈述的字节－1表示系统自己计算，第五个不关心
        if (result!=SQLITE_OK) {                                    //如果绑定姓名失败
            NSLog(@"绑定姓名失败!");                                  //打印消息
            flag=1;                                                 //设置绑定标志为1
        }
        result=sqlite3_bind_int(stmtForInsert, 2, [age intValue]);  //第一个变量是陈述，第二个变量是第几个问号，第三个变量是需要绑定的数据，切记这个数据如果是int的时候必须使用nsnumber
        if (result!=SQLITE_OK) {                                    //如果绑定姓名失败
            NSLog(@"绑定年龄失败!");                                  //打印消息
            flag=1;                                                 //设置绑定标志为1
        }
        if (flag!=1) {                                              //如果姓名和年龄都没有绑定失败，那么就执行sqlite语句
            result=sqlite3_step(stmtForInsert);                     //运行陈述
            if (result!=SQLITE_DONE) {                              //如果陈述执行失败，那么往下执行
                NSLog(@"运行陈述失败!");                              //打印消息
            }
            else{
                NSLog(@"运行陈述成功!");                              //打印消息
                sqlite3_finalize(stmtForInsert);                    //陈述运行结束一定要释放它的内存
                self.name.text=@"";                                 //清除表格内容
                self.age.text=@"";
                [self.name becomeFirstResponder];                   //设置姓名为焦点
            }
        }
    }
    
    sqlite3_close(mydb);                    //关闭数据库
}

- (IBAction)selectStudentInfo:(id)sender {
    NSString *name=self.name.text;          //获取文本里的姓名字符串
    NSString *age=self.age.text;            //获取文本里的年龄字符串
    [self check:name];                      //获取来的姓名有效性检查
    [self check:age];                       //获取来的年龄有效性检查
    char *cName=[name UTF8String];          //转换姓名为c的字符串
    char *cAge=[age UTF8String];            //转换年龄为c的字符串
    NSNumber *numAge=[NSNumber numberWithInt:[age intValue]];
    
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"mydata.sqlite"];     //获取家的路径并确定需要新建的数据库文件的名字
    sqlite3 *mydb;                          //创建数据库对象
    sqlite3_open([path UTF8String], &mydb); //打开数据库
    NSString *sqlite=@"create table if not exists t_student (name,age)";                    //定义需要执行的sqlite语句
    char *err;                              //创建一个错误信息字符串
    int result=sqlite3_exec(mydb, [sqlite UTF8String], NULL, NULL, &err);                   //运行sqlite语句
    if (result!=SQLITE_OK) {                                                                //如果运行失败的话
        NSLog(@"sqlite run failed:%s",err); //如果运行失败那么打印出错信息
    }
    
    /*!
     上面是新建一个数据库文件，并定制其字段（列），增删查改里面都需要
     */
    
    NSString *sqliteForSelect=@"select * from t_student";                                   //定义需要执行的sqlite语句
    sqlite3_stmt *stmtForSelect;                                                            //创建一个陈述的对象，其实就是个表格
    result=sqlite3_prepare_v2(mydb, [sqliteForSelect UTF8String], -1, &stmtForSelect, NULL);//准备运行sqlite语句
    if (result!=SQLITE_OK) {                //准备运行sqlite语句
        NSLog(@"预处理失败!");
    }
    else{
        while (sqlite3_step(stmtForSelect)==SQLITE_ROW) {                                   //如果运行一行陈述发现返回的是一行，那么就循环的调用
            char *readNameFromColumn=(char *)sqlite3_column_text(stmtForSelect, 0);         //获取陈述运行时候返回的行数据
            int readAgeFromColumn=sqlite3_column_int(stmtForSelect, 1);
            NSLog(@"姓名:%s 年龄:%d",readNameFromColumn,readAgeFromColumn);                   //打印出返回来的数据用来查看数据库里面的数据
        }
        sqlite3_finalize(stmtForSelect);    //关闭陈述释放内存
    }
    
    sqlite3_close(mydb);                    //关闭数据库
}

- (IBAction)updateStudentInfo:(id)sender {
    NSString *name=self.name.text;          //获取文本里的姓名字符串
    NSString *age=self.age.text;            //获取文本里的年龄字符串
    [self check:name];                      //获取来的姓名有效性检查
    [self check:age];                       //获取来的年龄有效性检查
    char *cName=[name UTF8String];          //转换姓名为c的字符串
    char *cAge=[age UTF8String];            //转换年龄为c的字符串
    NSNumber *numAge=[NSNumber numberWithInt:[age intValue]];
    
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"mydata.sqlite"];     //获取家的路径并确定需要新建的数据库文件的名字
    sqlite3 *mydb;                          //创建数据库对象
    sqlite3_open([path UTF8String], &mydb); //打开数据库
    NSString *sqlite=@"create table if not exists t_student (name,age)";                    //定义需要执行的sqlite语句
    char *err;                              //创建一个错误信息字符串
    int result=sqlite3_exec(mydb, [sqlite UTF8String], NULL, NULL, &err);                   //运行sqlite语句
    if (result!=SQLITE_OK) {                                                                //如果运行失败的话
        NSLog(@"sqlite run failed:%s",err); //如果运行失败那么打印出错信息
    }
    
    /*!
     上面是新建一个数据库文件，并定制其字段（列），增删查改里面都需要
     */
    NSString *sqliteForUpdate=@"update t_student set name='xiaogu' where age=26";           //定义需要执行的sqlite语句
    sqlite3_stmt *stmtForUpdate;                                                            //创建一个陈述的对象，其实就是个表格
    result=sqlite3_prepare_v2(mydb, [sqliteForUpdate UTF8String], -1, &stmtForUpdate, NULL);//准备运行sqlite语句
    if (result!=SQLITE_OK) {                //准备运行sqlite语句
        NSLog(@"预处理失败!");
    }
    else{
        result=sqlite3_step(stmtForUpdate);
        if (result!=SQLITE_DONE) {
            NSLog(@"运行陈述失败!");
        }
        else{
            NSLog(@"修改姓名成功!");
            sqlite3_finalize(stmtForUpdate);
        }
    }
    
    sqlite3_close(mydb);                    //关闭数据库
    
}

- (IBAction)deleteStudentInfo:(id)sender {
    NSString *name=self.name.text;          //获取文本里的姓名字符串
    NSString *age=self.age.text;            //获取文本里的年龄字符串
    [self check:name];                      //获取来的姓名有效性检查
    [self check:age];                       //获取来的年龄有效性检查
    char *cName=[name UTF8String];          //转换姓名为c的字符串
    char *cAge=[age UTF8String];            //转换年龄为c的字符串
    NSNumber *numAge=[NSNumber numberWithInt:[age intValue]];
    
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"mydata.sqlite"];     //获取家的路径并确定需要新建的数据库文件的名字
    sqlite3 *mydb;                          //创建数据库对象
    sqlite3_open([path UTF8String], &mydb); //打开数据库
    NSString *sqlite=@"create table if not exists t_student (name,age)";                    //定义需要执行的sqlite语句
    char *err;                              //创建一个错误信息字符串
    int result=sqlite3_exec(mydb, [sqlite UTF8String], NULL, NULL, &err);                   //运行sqlite语句
    if (result!=SQLITE_OK) {                                                                //如果运行失败的话
        NSLog(@"sqlite run failed:%s",err); //如果运行失败那么打印出错信息
    }
    
    /*!
     上面是新建一个数据库文件，并定制其字段（列），增删查改里面都需要
     */
    NSString *sqliteForDelete=@"delete from t_student where age=0";                        //定义需要执行的sqlite语句
    sqlite3_stmt *stmtForDelete;                                                            //创建一个陈述的对象，其实就是个表格
    result=sqlite3_prepare_v2(mydb, [sqliteForDelete UTF8String], -1, &stmtForDelete, NULL);//准备运行sqlite语句
    if (result!=SQLITE_OK) {                //准备运行sqlite语句
        NSLog(@"预处理失败!");
    }
    else{
        result=sqlite3_step(stmtForDelete);
        if (result!=SQLITE_DONE) {
            NSLog(@"运行陈述失败!");
        }
        else{
            NSLog(@"删除姓名成功!");
            sqlite3_finalize(stmtForDelete);
        }
    }
    
    sqlite3_close(mydb);                    //关闭数据库
}

-(BOOL)check:(NSString *) _str {
    //NSLog(@"数据有效性检查！");
    return YES;
}

@end
