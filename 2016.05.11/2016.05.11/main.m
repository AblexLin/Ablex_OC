//
//  main.m
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXStd.h"
#import "GMXAutoreleasepool.h"
#import "GMXString.h"
#import "NSString+log.h"
#import "NSString+trim.h"
#import "GMXAction.h"
#import "GMXCopying.h"
#import "GMXWenjian.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //arc内存管理与非arc内存管理
        /*
        int a=123;//局部变量，是系统决定和处理的，内存也是系统释放的

        int *p=malloc(10*4);//堆里面申请内存
        free(p);//需要自己释放
        
        NSString *str=[[NSString alloc]init];//这个也是堆里申请内存为什么没有手动释放呢？
        //举例说明如何释放内存的，是通过类里面的dealloc
        GMXStd *std=[[GMXStd alloc]init];
        [std setName:@"顾明轩"];
        //运行的时候结果是  (null)初始化 顾明轩被销毁了
        //初始化的时候name还是没有数据的，所以不能被调用的就是null了
        GMXStd *std1=[[GMXStd alloc]init];
        //引用计数，使用alloc的时候，引用计数＋1
        NSLog(@"%d",[std1 retainCount]);//关闭引用计数的时候，这个行为才能使用
        [std release];//释放引用计数，释放后，就又能调用dealloc了;
         */
        
        //@property(strong,nonatomic)NSString*name  //@property(copy,nonatomic)NSString*name
        //@synthesize name   便捷式使用setName,xxx.name
        /*
        NSMutableString *name=[NSMutableString stringWithCapacity:20];
        [name appendString:@"张三"];
        GMXStd *a=[[GMXStd alloc]init];
        GMXStd *b=[[GMXStd alloc]init];
        a.name=name;
        b.name=name;
        [name setString:@"李四"];
        NSLog(@"a.name=%@,b.name=%@",a.name,b.name);
        
        //再GMXStd类里面使用下面这组声明和实现的时候，输出的都是李四，因为strong相当于retain没有relese
        //@property(strong,nonatomic)NSString*name;//相当于注释里的声明行为
        //@synthesize name;//相当于注释里的实现行为
        
        //再GMXStd类里面使用下面这组声明和实现的时候，输出的都是张三，因为copy相当于relese了以后在增加了引用计数，相当于拷贝了一份
        //@property(copy,nonatomic)NSString*name;//相当于注释里的声明行为
        //@synthesize name;//相当于注释里的实现行为
        
        //@property虽然好用，但是如果需要对name做有效性处理的时候，就不适合使用这个了，还是要自己定义行为比较合适
        */
        
        //@autoreleasepool
        /*
        //strong---retain
        //copy---
        //assign--int 等简单类型的
        */
        
        //给已有(没有源代码)类添加行为－类别(category)
        /*
        //1.使用继承来实现，以显示字符串为例子
        GMXString *gmx_str1=[[GMXString alloc]init];
//        [gmx_str1 log];
        //2.通过category，主要使用在增强没有源代码的类的功能的时候使用
        NSString *gmx_str2=[NSString stringWithFormat:@"%d",123];
//        [gmx_str2 log];
        //例子，添加一个类别，给字符串剔除空格
        NSString *gmx_str3=@" 1 23 ";
        NSLog(@"%@,%ld",[gmx_str3 trim],gmx_str3.length);//只能剔除两端的
        */
        
        //继承多个类－协议(protocol)
        /*
        GMXAction *gmx_action=[[GMXAction alloc]init];
        gmx_action.name=@"顾明轩";
        [gmx_action say];
        [gmx_action song];
        [gmx_action chuiniu];
        */
        
        //NSCopying(协议的应用，拷贝)
        /*
        NSString *gmx_str=@"顾明轩";
        NSString *gmx_str1=[gmx_str copy];//mutablecopy动态拷贝，能够拷贝动态对象
        NSLog(@"%@",gmx_str1);
        
        GMXCopying *gmx_copy=[[GMXCopying alloc]init];
        gmx_copy.name=@"轩爷";
        gmx_copy.age=15;
        [gmx_copy say];
        //想要拷贝自己定义的类的对象，那么就只能使用nscopying这个协议，然后重写协议里的行为来实现
        GMXCopying *gmx_copy1=[gmx_copy copy];
        //全部拷贝轩爷的名字和年龄，然后修改姓名～～达到目的了，当有很多数据，但是只有少部分差异的时候，这个拷贝很爽了就
        gmx_copy1.name=@"老顾";
        //想要不输出地址，那么久-(NSString *)description把这个行为重写
        NSLog(@"%@",gmx_copy1);
         */
        
        //文件操作
        /*
        //普通文件操作
        NSString *str=@"hello";
        [str writeToFile:@"xia.txt" atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        NSString *str1=[NSString stringWithContentsOfFile:@"xia.txt" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"%@",str1);
        
        //自己定义类写入文件
        GMXWenjian *gmx_wenjian1=[[GMXWenjian alloc]init];
        gmx_wenjian1.name=@"顾明轩";
        gmx_wenjian1.age=22;
        
        GMXWenjian *gmx_wenjian2=[[GMXWenjian alloc]init];
        gmx_wenjian2.name=@"王小霖";
        gmx_wenjian2.age=23;
        
        GMXWenjian *gmx_wenjian3=[[GMXWenjian alloc]init];
        gmx_wenjian3.name=@"王爱平";
        gmx_wenjian3.age=24;
        //下面这个很有意思哦
        //每个GMXWenjian的对象都可以成为一个array都元素，然后可以直接快速遍历调用对象的行为
        NSArray *gmx_array=[NSArray arrayWithObjects:gmx_wenjian1,gmx_wenjian2,gmx_wenjian3, nil];
        for (GMXWenjian *wenjian in gmx_array) {
            [wenjian say];
        }
        if ([gmx_array writeToFile:@"三个人.plist" atomically:YES]) {
            NSLog(@"文件写入成功");
        }
        //上面做了这么多，但是没有写入成功，因为这个是自己定义的类，不能写入的
        //那么想要可以写入，想要“归档”一个自己的类，那么必须继承一个协议
        //实现了归档，还是不行，不能写入，是什么原因呢？
        //不是所有的类或者什么都能写入到文件的，需要使用特殊的类(NSKeyedArchiver)
        //下面这个行为返回的其实是一个nsdata，才能够写入到文件
        
        //归档(序列化)
        [NSKeyedArchiver archiveRootObject:gmx_array toFile:@"把自己实现的类写入文件.plist"];
        //写入成功了
        
        //读取文件
        //解档
        NSArray *gmx_jd=[NSKeyedUnarchiver unarchiveObjectWithFile:@"把自己实现的类写入文件.plist"];
        for (GMXWenjian *wen in gmx_jd) {
            NSLog(@"解码输出");//必须清楚这个数组里有什么，不然读取肯定失败
            [wen say];
        }
        */
        
        //文件管理类(nsfilemanager)
        /*
        NSFileManager *gmx_fm=[NSFileManager defaultManager];//返回一个NSFileManager对象
        NSFileManager *gmx_fm2=[NSFileManager defaultManager];
        if (gmx_fm==gmx_fm2) {
            NSLog(@"同一个对象");//任何时候获取文件管理对象的时候，总是同一个对象，这叫"单例"
        }
//        NSUserDefaults *def=[NSUserDefaults standardUserDefaults];//这也是一个单例
        
        //这个有什么用？可以判断一个文件是不是存在
        NSLog(@"%d",[gmx_fm fileExistsAtPath:@"自.plist"]);//返回1表示存在，0表示不存在，就是yes和no;
        //还可以拷贝，删除一个文件
        NSError *err;
        [gmx_fm removeItemAtPath:@"为日" error:&err];
        NSLog(@"%@",err);//没有这个文件的时候，就报错
        [gmx_fm copyItemAtPath:@"为日.plist" toPath:@"nima.plist" error:&err];
        //还能得到文件的属性
        NSDictionary *gmx_dict=[gmx_fm2 fileSystemAttributesAtPath:@"为日.plist"];
        NSDictionary *gmx_dict2=[gmx_fm2 attributesOfItemAtPath:@"为日.plist" error:nil];//这个才是文件信息，上面的是系统信息
        NSLog(@"%@",gmx_dict2);
         */
    }
    return 0;
}























