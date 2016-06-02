//
//  MenuTableViewController.h
//  2016.06.02(平板上的分割视图)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValue.h"

@interface MenuTableViewController : UITableViewController

//定义显示表格视图内容的数组
@property (strong , nonatomic) NSArray *arr;

//定义传值的代理
@property (strong ,nonatomic)id<PassValue>delegate;

@end
