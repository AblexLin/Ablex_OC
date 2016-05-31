//
//  AllPersonViewController.h
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValueForNewToMain.h"

@interface AllPersonViewController : UIViewController<PassValueForNewToMain,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>

//定义一个字典，这个字典点keys是已有联系人的首字母的数组，values则是一个数组，这个数组里有很多联系人对象
@property (strong, nonatomic) NSMutableDictionary *dictionary;

//定义字典的keys和values数组
@property (strong, nonatomic) NSMutableArray *keys;
@property (strong, nonatomic) NSMutableArray *values;

//定义表格单元
@property (strong, nonatomic) UITableView *table_view;

//定义联系人集合
@property (strong, nonatomic) NSMutableArray *persons;

//定义搜索栏
@property (strong, nonatomic) UISearchBar *searchbar;

@end
