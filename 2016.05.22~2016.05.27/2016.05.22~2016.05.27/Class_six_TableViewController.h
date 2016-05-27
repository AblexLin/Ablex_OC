//
//  Class_six_TableViewController.h
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Class_six_TableViewController : UITableViewController

//定义一个读取本地文件的字典
@property (strong, nonatomic) NSMutableDictionary *names;

//定义读取字典keys的数组
@property (strong, nonatomic) NSArray *keys;
@end
