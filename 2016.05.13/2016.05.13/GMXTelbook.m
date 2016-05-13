//
//  GMXTelbook.m
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXTelbook.h"
#import "GMXContact.h"

@implementation GMXTelbook

//实现联系人的动态数组
@synthesize contacts,contacts_num;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contacts=[NSKeyedUnarchiver unarchiveObjectWithFile:FILE_NAME];
        if (self.contacts==nil) {
            self.contacts=[NSMutableArray arrayWithCapacity:1000];
            NSLog(@"暂无联系人，请优先添加联系人!");
        }
    }
    return self;
}

//添加联系人
-(void)addcontact
{
    GMXContact *temp_contact=[[GMXContact alloc]init];
    NSLog(@"请输入您要添加的联系人姓名:");
    temp_contact.name=[self inputandconvert:20];//返回的是一个输入后的字符串，而且是oc型的
    
    NSLog(@"请输入您要添加的联系人性别:");
    temp_contact.sex=[self inputandconvert:4];
    
    NSLog(@"请输入您要添加的联系人电话:");
    temp_contact.tel=[self inputandconvert:20];
    
    NSLog(@"请输入您要添加的联系人公司:");
    temp_contact.company=[self inputandconvert:100];
    
    //把新增的联系人数据写入到数组中
    [contacts addObject:temp_contact];
    
    //把新增的联系人输入写入到文件中
    [NSKeyedArchiver archiveRootObject:contacts toFile:FILE_NAME];
    
    NSLog(@"联系人添加成功!");
    
}

//删除联系人
-(void)delcontact
{
    while (1) {
        NSLog(@"请选择删除联系人通过的方式(1.联系人编号 2.联系人姓名 3.联系人电话 4.返回上级菜单):");
        //获取键盘输入的删除方式
        int temp_type = [[self inputandconvert:2]intValue];
        if (temp_type==1) {
            NSLog(@"请输入您要删除的联系人编号:");
            int temp_num=[[self inputandconvert:3]intValue];
            if (temp_num>self.contacts.count) {
                NSLog(@"超过已有联系人的最大编号，请重新输入!");
                continue;
            }
            NSMutableArray *temp_arr=[contacts copy];
            for (GMXContact *temp_contact in temp_arr) {
                contacts_num++;
                if (temp_num==contacts_num) {
                    [contacts removeObject:temp_contact];
                }
            }
            //写入文件
            [NSKeyedArchiver archiveRootObject:contacts toFile:FILE_NAME];
            NSLog(@"删除联系人成功!");
            contacts_num=0;
            break;
        }
        else if(temp_type==2){
            NSLog(@"请输入您要删除的联系人姓名:");
            NSString *temp_name=[self inputandconvert:20];
            NSMutableArray *temp_arr=[contacts copy];
            for (GMXContact *temp_contact in temp_arr) {
                if ([temp_name isEqualToString:temp_contact.name]) {
                    [contacts removeObject:temp_contact];
                }
            }
            //判断是否删除成功
            if (contacts.count==temp_arr.count) {
                NSLog(@"删除联系人失败:没有这个联系人!");
            }
            else{
                //写入文件
                [NSKeyedArchiver archiveRootObject:contacts toFile:FILE_NAME];
                NSLog(@"删除联系人成功!");
                break;
            }
            
        }
        else if(temp_type==3){
            NSLog(@"请输入您要删除的联系人电话:");
            NSString *temp_tel=[self inputandconvert:20];
            NSMutableArray *temp_arr=[contacts copy];
            for (GMXContact *temp_contact in temp_arr) {
                if ([temp_tel isEqualToString:temp_contact.tel]) {
                    [contacts removeObject:temp_contact];
                }
            }
            //判断是否删除成功
            if (contacts.count==temp_arr.count) {
                NSLog(@"删除联系人失败:没有这个联系人!");
            }
            else{
                //写入文件
                [NSKeyedArchiver archiveRootObject:contacts toFile:FILE_NAME];
                NSLog(@"删除联系人成功!");
                break;
            }
        }
        else if(temp_type==4){
            break;
        }
        else{
            NSLog(@"错误的输入，请重新输入!");
        }
    }
}

//修改联系人
-(void)modcontact
{
    NSLog(@"请输入联系人的编号来修改联系人的信息(不需要修改的项目可输入0):");
    int temp_num=[[self inputandconvert:3]intValue];
    for (GMXContact *temp_contact in self.contacts) {
        contacts_num++;
        if (contacts_num==temp_num) {
            NSLog(@"请输入您要修改的联系人姓名:");
            NSString *temp_name=[self inputandconvert:20];
            if (![temp_name isEqualToString:@"0"]) {
                temp_contact.name=temp_name;
            }
            
            NSLog(@"请输入您要修改的联系人性别:");
            NSString *temp_sex=[self inputandconvert:4];
            if (![temp_sex isEqualToString:@"0"]) {
                temp_contact.sex=temp_sex;
            }

            NSLog(@"请输入您要修改的联系人电话:");
            NSString *temp_tel=[self inputandconvert:20];
            if (![temp_tel isEqualToString:@"0"]) {
                temp_contact.tel=temp_tel;
            }
            
            NSLog(@"请输入您要修改的联系人公司:");
            NSString *temp_company=[self inputandconvert:100];
            if (![temp_company isEqualToString:@"0"]) {
                temp_contact.company=temp_company;
            }
        }
    }
    
    //写入文件
    [NSKeyedArchiver archiveRootObject:contacts toFile:FILE_NAME];
    NSLog(@"联系人修改成功!");
    contacts_num=0;
}

//查找联系人
-(void)sekcontact
{
    NSLog(@"请输入您要查找的联系人编号:");
    int temp_num=[[self inputandconvert:3]intValue];
    for (GMXContact *temp_contact in contacts) {
        contacts_num++;
        if (temp_num==contacts_num) {
            NSLog(@"编号\t姓名\t\t性别\t\t电话\t\t\t\t公司");
            NSLog(@"%02d \t%@\t%@ \t\t%@\t\t%@",contacts_num,temp_contact.name,temp_contact.sex,temp_contact.tel,temp_contact.company);
        }
    }
    contacts_num=0;
}

//显示联系人
-(void)shwcontact
{
    if (!self.contacts.count) {
        NSLog(@"通讯录暂无联系人!请添加联系人!");
    }
    for (GMXContact *temp_contact in self.contacts) {
        NSLog(@"编号\t姓名\t\t性别\t\t电话\t\t\t\t公司");
        NSLog(@"%02d \t%@\t%@ \t\t%@\t\t%@",++contacts_num,temp_contact.name,temp_contact.sex,temp_contact.tel,temp_contact.company);
    }
    contacts_num=0;
}

//退出联系人
-(void)qutcontact
{
    NSLog(@"退出我的通讯录!");
}

//输入和转换字符串的行为的实现
-(NSString *)inputandconvert:(int)_strlength
{
    char temp[_strlength];  //定义一个临时字符串
    temp[_strlength-1]='\0';//最后一个字符必须是0
    scanf("%s",temp);
    return [NSString stringWithUTF8String:temp];
}

@end
