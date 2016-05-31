//
//  Class_three_TableViewController.h
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Class_three_TableViewController : UITableViewController

//定义两个动态数组歌星和歌星的性别
@property (strong, nonatomic) NSMutableArray *stars_name;
@property (strong, nonatomic) NSMutableArray *stars_sex;

//定义一个变量来区分男女歌星 0女歌星 1男歌星
@property (assign, nonatomic) int indentationLevel;
@end
