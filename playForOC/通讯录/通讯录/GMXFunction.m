//
//  GMXFunction.m
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "GMXFunction.h"

@implementation GMXFunction

@synthesize gmx_mutablearray;

- (instancetype)init
{
    self = [super init];
    if (self) {
        //先读文件
        gmx_mutablearray=[NSKeyedUnarchiver unarchiveObjectWithFile:FILE_NAME];
        if (gmx_mutablearray==nil) {
            gmx_mutablearray=[NSMutableArray arrayWithCapacity:1000];
        }
    }
    return self;
}
-(void)addContacts
{
    char c_name[20];
    char c_tel[20];
    NSLog(@"请输入联系人的姓名:");
    scanf("%s",c_name);
    NSLog(@"请输入联系人的号码:");
    scanf("%s",c_tel);
    GMXContacts *func_contacts=[[GMXContacts alloc]init];
    func_contacts.name = [NSString stringWithUTF8String:c_name];
    func_contacts.tel=[NSString stringWithUTF8String:c_tel];
    

    //再写文件
    [gmx_mutablearray addObject:func_contacts];
    [NSKeyedArchiver archiveRootObject:gmx_mutablearray toFile:FILE_NAME];
    
}

-(void)delContacts
{
    char dele_name[20];
    GMXContacts *func_contacts=[[GMXContacts alloc]init];
    
    NSLog(@"请输入需要删除的联系人姓名:");
    scanf("%s",dele_name);
    func_contacts.name=[NSString stringWithUTF8String:dele_name];
    
    NSMutableArray *muarr=[gmx_mutablearray copy];//这里不能直接赋值。直接赋值的时候和单例一样，地址相同，所以还是会报错。
    
    //这里不能直接使用gmx_mutablearray的原因是，使用了满足条件的时候就会删除一个元素，那么数组就变化了。for后面的这个数组应该是不变的。
    for (GMXContacts *contacts in muarr) {
        if ([contacts.name isEqualToString:func_contacts.name]) {
            [gmx_mutablearray removeObject:contacts];
        }
    }
    [NSKeyedArchiver archiveRootObject:gmx_mutablearray toFile:FILE_NAME];
}

-(void)findContacts
{
    char find_name[20];
    GMXContacts *func_contacts=[[GMXContacts alloc]init];
    
    NSLog(@"请输入需要查找的联系人姓名:");
    scanf("%s",find_name);
    func_contacts.name=[NSString stringWithUTF8String:find_name];
    
    for (GMXContacts *contacts in gmx_mutablearray) {
        if ([contacts.name isEqualToString:func_contacts.name]) {
            NSLog(@"%@的电话号码是:%@",contacts.name,contacts.tel);
            break;
        }
    }

}

-(void)modifyContacts
{
    char modify_name[20];
    char modify_tel[20];
    GMXContacts *func_contacts=[[GMXContacts alloc]init];
    
    NSLog(@"请输入需要修改的联系人姓名:");
    scanf("%s",modify_name);
    func_contacts.name=[NSString stringWithUTF8String:modify_name];
    
    NSMutableArray *muarr=[gmx_mutablearray copy];//这里不能直接赋值。直接赋值的时候和单例一样，地址相同，所以还是会报错。
    
    //这里不能直接使用gmx_mutablearray的原因是，使用了满足条件的时候就会删除一个元素，那么数组就变化了。for后面的这个数组应该是不变的。
    for (GMXContacts *contacts in muarr) {
        if ([contacts.name isEqualToString:func_contacts.name]) {
            NSLog(@"请输入修改后的联系人姓名:");
            scanf("%s",modify_name);
            contacts.name=[NSString stringWithUTF8String:modify_name];
            
            NSLog(@"请输入修改后的联系人电话:");
            scanf("%s",modify_tel);
            contacts.tel=[NSString stringWithUTF8String:modify_tel];
        }
    }
    [NSKeyedArchiver archiveRootObject:gmx_mutablearray toFile:FILE_NAME];
}

-(void)showContacts
{
    for (GMXContacts *contacts in gmx_mutablearray) {
        NSLog(@"%@",contacts);
    }
}

@end
