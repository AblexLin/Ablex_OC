//
//  Class_one_ViewController.h
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Class_one_ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

//声明一个UITableView(表格视图)
@property (strong, nonatomic) UITableView *tableview;

//声明一个动态数组，用来保存表格内容
@property (strong, nonatomic) NSMutableArray *names;

@end
