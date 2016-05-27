//
//  Class_seven_TableViewController.h
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Class_seven_TableViewController : UITableViewController<UISearchBarDelegate>

//定义字典
@property (strong, nonatomic) NSMutableDictionary *dict;

//定义字典的键和值
@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSMutableArray *arrayForDict;

//定义随机生成的字符串总集合
@property (strong, nonatomic) NSMutableArray *values;

@property (strong, nonatomic) UISearchBar *sb;
@end
