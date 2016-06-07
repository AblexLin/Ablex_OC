//
//  SqlitePersistentViewController.h
//  Sqlite持久化
//
//  Created by 顾明轩 on 16/6/7.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SqlitePersistentViewController : UIViewController
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
