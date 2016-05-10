//
//  main.m
//  2016.05.10
//
//  Created by 顾明轩 on 16/5/10.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

/********************************************************
**ARRAY 中保存的数据一定是一个对象，一般的数据是无法保存在数组中的*
*********************************************************/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //静态数组(array)
        /*
        //三种实现数组(array)初始化的方法
        NSArray *gmxarray1=@[@"顾明轩1a",@"顾明轩2b",@"顾明轩3c"];                                       //直接初始化
        NSArray *gmxarray2=[NSArray arrayWithObjects:@"顾明轩1a",@"顾明轩2b",@"顾明轩3c", nil];          //调用"对象"的行为来初始化
        NSArray *gmxarray3=[[NSArray alloc]initWithObjects:@"顾明轩1a",@"顾明轩2b",@"顾明轩3c", nil];    //调用"类"的行为来初始化
        
        [gmxarray1 count];//返回数组的长度
        
        //1.简单的for循环遍历数组
        for (int i=0; i<[gmxarray2 count]; i++) {
            NSLog(@"%@",[gmxarray2 objectAtIndex:i]);//和c中gmxarray2[i]含义是相同的
        }
        //2.快速遍历的for循环遍历数组
        for (NSString *str in gmxarray3) {
            NSLog(@"%@",str);
        }
        //3.迭代方法遍历数组不常用，其中常用的是2
        */
        
        //动态数组(array)
        /*
        //动态数组初始化
        NSMutableArray *gmxarray11=[NSMutableArray arrayWithCapacity:20];
        NSMutableArray *gmxarray12=[[NSMutableArray alloc]initWithCapacity:20];
        //动态数组增加元素
        [gmxarray11 addObject:@"顾明轩1a"];
        [gmxarray11 addObject:@"顾明轩2b"];
        [gmxarray11 addObject:@"顾明轩3c"];
        //动态数组删除元素
        [gmxarray11 removeObject:@"顾明轩2b"];   //删除指定内容元素
        [gmxarray12 removeAllObjects];          //删除全部元素
        [gmxarray11 removeLastObject];          //删除最后元素
        [gmxarray11 removeObjectAtIndex:0];     //删除指定位置元素
        //动态数组插入元素
        [gmxarray11 insertObject:@"插入字符串" atIndex:0];
        //动态数组循环赋值
        for (int i=0; i<10; i++) {
            [gmxarray12 addObject:[NSString stringWithFormat:@"%d",i+1]];
        }
        //数组的遍历
        for (NSString *str in gmxarray11) {
            NSLog(@"%@",str);
        }
        */
        
        //静态集合(set)
        /*
        //三种实现集合(set)初始化的方法
        //NSSet *gmxset1=@[@"顾明轩1a",@"顾明轩2b",@"顾明轩3c",@"顾明轩1a"];//数组才这么用
        NSSet *gmxset2=[NSSet setWithObjects:@"1",@"2",@"3",@"1", nil];
        NSSet *gmxset3=[[NSSet alloc]initWithObjects:@"1",@"2",@"3",@"1", nil];
        
        //集合的元素不能相同，且内容是没有顺序的,想排序，可以吧集合带到数组上去，再排序，这个方法不好，可以了解下
        NSArray *array20=[gmxset2 allObjects];//先吧集合中时全部元素给array
        array20=[array20 sortedArrayUsingSelector:@selector(compare:)];//比较器来排序
        for (NSString *str in array20) {
            NSLog(@"%@",str);
        }
        */
        
        //动态集合(set)
        /*
        //动态集合的初始化
        NSMutableSet *gmxset11=[NSMutableSet setWithCapacity:20];
        NSMutableSet *gmxset12=[[NSMutableSet alloc]initWithCapacity:20];
        
        //动态集合增加元素
        [gmxset11 addObject:@"1a"];
        [gmxset11 addObject:@"2b"];
        [gmxset11 addObject:@"3c"];
        
        //动态集合删除元素
        [gmxset11 removeObject:@"2b"];
        
        for (NSString *str in gmxset11) {
            NSLog(@"%@",str);
        }
        */
        
        //静态字典(dictionary)
        /*
        //三种实现字典(dictionary)初始化的方法
        NSDictionary *gmxdict1=@{@"顾明轩":@"1",@"王爱平":@"2",@"王小霖":@"3"};
        NSDictionary *gmxdict2=[NSDictionary dictionaryWithObjectsAndKeys:@"顾明轩1",@"1a",@"顾明轩2",@"2b",@"顾明轩3",@"3c", nil];
        NSDictionary *gmxdict3=[[NSDictionary alloc]initWithObjectsAndKeys:@"顾明轩1",@"1a",@"顾明轩2",@"2b",@"顾明轩3",@"3c", nil];
        
        //获取字典中的keys和values
        NSArray *arrayvalues=[gmxdict2 allValues];
        NSArray *arraykeys=[gmxdict1 allKeys];
        
        //只能通过keys去找values不能反过来找
        for (NSString *str in arraykeys) {
            NSLog(@"keys=%@,values=%@",str,[gmxdict1 objectForKey:str]);
        }
        */
        
        //动态字典(dictionary)
        /*
        NSMutableDictionary *gmxdict11=[[NSMutableDictionary alloc]initWithCapacity:20];
        NSMutableDictionary *gmxdict12=[NSMutableDictionary dictionaryWithCapacity:20];

        //增加一组键值，增加的键不能重复，重复的时候，旧的会被新替换
        [gmxdict11 setObject:@"轩爷" forKey:@"1"];
        [gmxdict11 setObject:@"老人头" forKey:@"2"];
        [gmxdict11 setObject:@"首长" forKey:@"3"];
        
        //删除键值对
        [gmxdict11 removeAllObjects];
        [gmxdict11 removeObjectForKey:@"2"];
        
        NSArray *gmxarray=[gmxdict11 allKeys];
        for (NSString *str in gmxarray) {
            NSLog(@"key=%@,value=%@",str,[gmxdict11 valueForKey:str]);
        }
        */
        
        //NSValue把数据型的数据转换为对象,把点，矩形，范围，大小转换为对象，在保存在数组中
        /*
        CGPoint point1={1,1};
        CGPoint point2={2,2};
        CGPoint point3={3,3};
        NSValue *gmxvalue1=[NSValue valueWithPoint:point1];//alloc的形式没有这个行为
        NSValue *gmxvalue2=[NSValue valueWithPoint:point2];//结构都可以放进来
        NSValue *gmxvalue3=[NSValue valueWithPoint:point3];//point，size，rect，rang等
        NSArray *gmxarray=[NSArray arrayWithObjects:gmxvalue1,gmxvalue2,gmxvalue3, nil];

        //遍历一下，看看能不能正确的输出
        for (NSValue *v in gmxarray) {
            NSLog(@"%g,%g",[v pointValue].x,[v pointValue].y);//和之前的intvalue是一样的
        }
        */
        
        //NSNumber把数值转换为对象
        /*
        NSNumber *gmxnumber1=[NSNumber numberWithFloat:1.2];
        NSNumber *gmxnumber2=[[NSNumber alloc]initWithInt:12];
        NSNumber *gmxnumber3=[NSNumber numberWithFloat:25.2];
        
        NSArray *gmxarray= [NSArray arrayWithObjects:gmxnumber1,gmxnumber2,gmxnumber3, nil];
        for (NSNumber *num in gmxarray) {
            NSLog(@"%@",num);
        }
        
        NSMutableArray *gmxmutablearray=[NSMutableArray arrayWithCapacity:20];
        //循环赋值
        for (int i=0; i<20; i++) {
            [gmxmutablearray addObject:[NSNumber numberWithInt:i+1]];//把number这个对象加进来
        }
        //遍历打印
        for (NSNumber *num in gmxmutablearray) {
            NSLog(@"%d",[num intValue]);
        }
        */
        
        //NSData，针对二进制文件的写入
        /*
        //数组写入文件
        [[NSArray arrayWithObjects:@"xuan",@"ye",@"ni",@"hao", nil] writeToFile:@"数学.txt" atomically:YES];
        NSArray *gmxarr=[NSArray arrayWithContentsOfFile:@"数学.txt"];
        NSLog(@"%@",gmxarr);

        //集合不能写入文件，只能先转给array再写NSArray *arrset=[set allObjects];
        //NSSet *set=[NSSet setWithObjects:@"11",@"22", nil];

        //字典
        [[NSDictionary dictionaryWithObjectsAndKeys:@"aaa",@"11",@"bbb",@"2", nil] writeToFile:@"dict.plist" atomically:YES];
        NSDictionary *gmxdict=[NSDictionary dictionaryWithContentsOfFile:@"dict.plist"];
        NSLog(@"%@",gmxdict);
        
        //读写，二进制的方式
        NSData *gmxdata=[NSData dataWithContentsOfFile:@"IMG_0037.JPG"];
        NSLog(@"%ld",gmxdata.length);
        [gmxdata writeToFile:@"a.jpg" atomically:YES];
         */
    }
    return 0;
}
