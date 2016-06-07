//
//  ViewController.m
//  2016.06.07(sqlite)
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textSex;
@property (assign, nonatomic) int flag;
//sqlite基本知识了解
/*!
 ddl(结构定义 creat alter drop)
 dml(数据操作 insert delete update select)
 CREATE TABLE "main"."ddbb" ("id" text(10,0) NOT NULL,"name" text(11,0),PRIMARY KEY("id"));          //创建一个数据
 INSERT INTO "ddbb" ("name") VALUES('xuanye')                                                        //插入一行数据
 DROP TABLE "ddbb"                                                                                   //删除一个表格
 ALTER TABLE "ddbb"                                                                                  //修改一个表格
 */

//常用的sqlite代码
/*
//表名为db的时候
//insert into db (id,name) values(1,'xuanye')                   //插入一组数据
//update db set name='nima' where id=1                          //修改一组数据
//delete from db where id=10                                    //删除一组数据

//查找条件 如果存在所有语句，那么必须按照这个顺序去写
//select name as 列表 from db where name='xuanye' order by id    //as表示别名

//常用的语法多看看，熟悉就好了
//select * from db where name='xuanye' --order by id            //拍序
//select * from db where name like 'xuan%'                      //like和％合用
//select count(*) from db where id>4                            //逻辑也支持，返回多少行
//select * from db order by id                                  //排序
//select * from db order by id desc                             //反相排序
//select sum(id) from db                                        //求和
//select avg(id) from db                                        //求平均数
//select *,yuwen+shuxue+yingyu as zongfen from db               //显示多一行总分
*/

@end

@implementation ViewController

- (IBAction)newRow:(UIButton *)sender {
    //打开数据库
    sqlite3 *db;                                                            //先创建一个数据库的指针的指针 sqlite本身是一个结构
    NSString *path=NSHomeDirectory();                                       //获取家的路径
    path=[path stringByAppendingPathComponent:@"mydb.sqlite"];              //新建数据库文件
    NSLog(@"%@",path);                                                      //打印路径，便于进入
    
    int result=sqlite3_open([path UTF8String], &db);                        //打开数据库文件
    if (result!=SQLITE_OK) {                                                //通过数据库的宏判断打开是否ok
        NSLog(@"打开文件失败1");
    }
    
    //操作数据库来创建一个新的表格
    char *err;
    char *sqlite="create table if not exists t_student (id integer,name text,sex text)";  //定义数据库代码的c串
    result=sqlite3_exec(db, sqlite, NULL, NULL, &err);                                    //运行创建表格的代码并记录是否创建ok
    if (result!=SQLITE_OK) {                                                              //通过数据库的宏判断打开是否ok
        NSLog(@"打开文件失败,失败原因%s",err);
    }
    
    //可以直接使用这个sqlite3_exec配合占位符来实现增删改查，但是我们需要使用绑定的方式来实现，因为输入‘’这样的数据的时候会影响sqlite的语法，使用绑定可以完美的解决这个问题
    //增加
    /*!
    sqlite3_stmt *stmt;
    char *sql="insert into t_student (name,sex) values(?,?)";                             //使用占位符
    result=sqlite3_prepare(db, sql, -1, &stmt, NULL);                                     //1数据库变量2需要运行的语句3-1表示全部4返回一个表格的意思5空我们不关注
    if (result!=SQLITE_OK) {                                                              //通过数据库的宏判断打开是否ok
        NSLog(@"插入文件失败,失败原因%s",err);
    }
    else{
        NSString *name=self.textName.text;      //获取表格里输入的name
        NSString *sex=self.textSex.text;        //获取表格里输入的sex
        result=sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);//1需要绑定的是那个表格里的数据2就是上面的第几个问号3是绑定的字段4表示字节5空不关注
        if (result!=SQLITE_OK) {
            NSLog(@"绑定姓名失败");
        }
        result=sqlite3_bind_text(stmt, 2, [sex UTF8String], -1, NULL); //如上，判断下性别的绑定是不是正常
        if (result!=SQLITE_OK) {
            NSLog(@"绑定姓别失败");
        }
    }
    if (sqlite3_step(stmt)!=SQLITE_DONE) {      //运行下这个陈述，看看是不是运行正常的
        NSLog(@"插入数据失败了!");
    }
    sqlite3_finalize(stmt);                     //关闭陈述，因为陈述很占用内存，其实这个陈述就是一个表格
     */
    //删除
    char *sql="delete from t_student where name=?";
    sqlite3_stmt *stmtForDelete;
    result=sqlite3_prepare_v2(db, sql, -1, &stmtForDelete, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"准备运行sql失败了");
    }
    else{
        result=sqlite3_bind_text(stmtForDelete, 1, "xuanye;", -1, NULL);
        if (result!=SQLITE_OK) {
            NSLog(@"绑定失败了");
        }
        else{
            if (sqlite3_step(stmtForDelete)==SQLITE_DONE) {
                NSLog(@"运行ok");
            }
            
        }
    }
    sqlite3_finalize(stmtForDelete);//关闭陈述
    //修改
    sql="update t_student set sex=? where name=?";
    sqlite3_stmt *stmtForUpdate;
    result=sqlite3_prepare_v2(db, sql, -1, &stmtForUpdate, NULL);
    if (result!=SQLITE_OK) {
        NSLog(@"准备运行sql失败了");
    }
    else{

        result=sqlite3_bind_text(stmtForUpdate, 1, "robot", -1, NULL);
        if (result!=SQLITE_OK) {
            NSLog(@"绑定失败了");
            _flag=1;
        }
        result=sqlite3_bind_text(stmtForUpdate, 2, "yay", -1, NULL);
        if (result!=SQLITE_OK) {
            NSLog(@"绑定失败了");
            _flag=1;
        }
        
        if (_flag==0) {
            if (sqlite3_step(stmtForUpdate)==SQLITE_DONE) {
                NSLog(@"运行ok");
            }
            else{
                NSLog(@"运行失败");
            }
        }
    }
    sqlite3_finalize(stmtForUpdate);//关闭陈述
    
    //查找
    sql="select * from t_student";
    sqlite3_stmt *stmtForSelect;
    result=sqlite3_prepare_v2(db, sql, -1, &stmtForSelect, NULL);//这里的－1 表示的数据库的字节让他自己去计算
    if (result!=SQLITE_OK) {
        NSLog(@"预处理出错了");
    }
    else{
        while (sqlite3_step(stmtForSelect)==SQLITE_ROW) {
            char *tempName=(char *)sqlite3_column_text(stmtForSelect, 1);
            char *tempSex=(char *)sqlite3_column_text(stmtForSelect, 2);
            NSLog(@"name=%@,sex=%@",[NSString stringWithUTF8String:tempName],[NSString stringWithUTF8String:tempSex]);
        }
    }
    
    //关闭数据库
    sqlite3_close(db);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
