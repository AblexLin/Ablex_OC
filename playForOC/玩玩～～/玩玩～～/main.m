//
//  main.m
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXTelebook+show.h"

#define TELEBOOK_FILENAME @"通讯录.plist"
#define ARRAY_CAPACITY 10000
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //玩玩
        /*
        GMXStd *gmx_std_jiben=[GMXStd stdIntroduction];
        gmx_std_jiben.std_name=@"小顾";
        gmx_std_jiben.std_age=20;
        [gmx_std_jiben stdIntroduction];
        GMXStd *gmx_std_copy1=[gmx_std_jiben copy];
        GMXStd *gmx_std_copy2=[gmx_std_jiben copy];
        GMXStd *gmx_std_copy3=[gmx_std_jiben copy];
        GMXStd *gmx_std_copy4=[gmx_std_jiben copy];
        GMXStd *gmx_std_copy5=[gmx_std_jiben copy];
        gmx_std_copy1.std_name=@"老顾";
        gmx_std_copy1.std_age=21;
        gmx_std_copy2.std_name=@"轩爷";
        gmx_std_copy2.std_age=22;
        gmx_std_copy3.std_name=@"轩哥";
        gmx_std_copy3.std_age=23;
        gmx_std_copy4.std_name=@"轩轩";
        gmx_std_copy4.std_age=24;
        gmx_std_copy5.std_name=@"阿轩";
        gmx_std_copy5.std_age=25;
        
        NSArray *gmx_std_array=[NSArray arrayWithObjects:gmx_std_copy1,gmx_std_copy2,gmx_std_copy3,gmx_std_copy4,gmx_std_copy5, nil];
        for (GMXStd *std in gmx_std_array) {
            NSLog(@"gmx_std_array:%@今年%d岁了!",std.std_name,std.std_age);
        }
        
        NSMutableArray *gmx_std_mutablearray=[[NSMutableArray alloc]initWithCapacity:1000];
        [gmx_std_mutablearray addObject:gmx_std_copy1];
        [gmx_std_mutablearray addObject:gmx_std_copy2];
        [gmx_std_mutablearray addObject:gmx_std_copy3];
        [gmx_std_mutablearray addObject:gmx_std_copy4];
        [gmx_std_mutablearray addObject:gmx_std_copy5];
        for (GMXStd *std in gmx_std_mutablearray) {
            NSLog(@"gmx_std_mutablearray:%@今年%d了!",std.std_name,std.std_age);
        }
        //写入失败，切记自己写的类必须要编码和解码，然后时候archiver才能写入到文件
        //bool a=[gmx_std_array writeToFile:@"静态轩爷" atomically:YES];
        //bool b=[gmx_std_mutablearray writeToFile:@"动态轩爷" atomically:YES];
        //NSLog(@"%i,%i",a,b);
        
        [NSKeyedArchiver archiveRootObject:gmx_std_array toFile:@"轩爷静态.plist"];
        [NSKeyedArchiver archiveRootObject:gmx_std_mutablearray toFile:@"轩爷动态.plist"];
        NSArray *gmx_std_read_array=[NSKeyedUnarchiver unarchiveObjectWithFile:@"轩爷静态.plist"];
        NSMutableArray *gmx_std_read_mutablearray=[NSKeyedUnarchiver unarchiveObjectWithFile:@"轩爷动态.plist"];

        for (GMXStd *std in gmx_std_read_array) {
            NSLog(@"gmx_std_read_array:%@今年%d了!",std.std_name,std.std_age);
        }
        for (GMXStd *std in gmx_std_read_mutablearray) {
            //            [std stdIntroduction];
            NSLog(@"gmx_std_read_mutablearray:%@今年%d了!",std.std_name,std.std_age);
        }
        
        NSData *gmx_std_data=[NSData dataWithContentsOfFile:@"轩爷静态.plist"];
        NSLog(@"gmx_std_data:%ld",gmx_std_data.length);
        
        GMXStd *gmx_std_new=[GMXStd stdIntroduction];
        gmx_std_new.std_name=@"小轩";
        gmx_std_new.std_age=30;
        [gmx_std_mutablearray addObject:gmx_std_new];
        
        [NSKeyedArchiver archiveRootObject:gmx_std_mutablearray toFile:@"轩爷动态.plist"];
        NSMutableArray *gmx_std_read_mutablearray_new=[NSKeyedUnarchiver unarchiveObjectWithFile:@"轩爷动态.plist"];
        
        for (GMXStd *std in gmx_std_read_mutablearray_new) {
            NSLog(@"gmx_std_read_mutablearray_new:%@今年%d了!",std.std_name,std.std_age);
        }
        
        NSData *gmx_std_data_new=[NSData dataWithContentsOfFile:@"轩爷动态.plist"];
        NSLog(@"gmx_std_data_new:%ld",gmx_std_data_new.length);
        
        NSFileManager *gmx_fm=[NSFileManager defaultManager];
        [gmx_fm removeItemAtPath:@"轩爷静态.plist" error:nil];
        [gmx_fm copyItemAtPath:@"轩爷动态.plist" toPath:@"nimabi.plist" error:nil];
        if ([gmx_fm fileExistsAtPath:@"轩爷动态.plist"]) {
            NSLog(@"存在");
        }
        NSLog(@"%@",[gmx_fm attributesOfItemAtPath:@"轩爷动态.plist" error:nil]);
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"顾明轩1",@"1",@"顾明轩2",@"2",@"顾明轩3",@"3", nil];
        [dict writeToFile:@"字典.txt" atomically:YES];
        dict=[NSDictionary dictionaryWithContentsOfFile:@"字典.txt"];
        for (int i=0; i<3; i++) {
            NSLog(@"%@",[dict objectForKey:[NSString stringWithFormat:@"%d",i+1]]);
        }
        NSMutableData *gmx_mutabledata=[NSMutableData dataWithCapacity:1000];
        gmx_mutabledata=[NSMutableData dataWithContentsOfFile:@"轩爷动态.plist"];
        [gmx_mutabledata appendData:gmx_std_data_new];
        */

        NSLog(@"欢迎使用oc通讯录!");
        NSLog(@"1.添加联系人");
        NSLog(@"2.修改联系人");
        NSLog(@"3.查找联系人");
        NSLog(@"4.删除联系人");
        NSLog(@"5.显示联系人");

        NSMutableArray *gmx_tele_mutablearray=[NSMutableArray arrayWithCapacity:ARRAY_CAPACITY];//申请一个动态数组，来保存联系人对象
        GMXTelebook *gmx_contacts=[[GMXTelebook alloc]init];
        NSString *input_name;
        NSString *input_tele;
        NSString *input_sex;

    }
    return 0;
}
