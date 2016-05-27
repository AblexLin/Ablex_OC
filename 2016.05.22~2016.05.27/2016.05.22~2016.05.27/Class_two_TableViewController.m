//
//  Class_two_TableViewController.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_two_TableViewController.h"

@interface Class_two_TableViewController ()

@end

/************************************/
/** 通过新建一个表格视图控制器方式来实现 **/
/************************************/

@implementation Class_two_TableViewController
@synthesize names;

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.barTintColor=[UIColor lightGrayColor];//设置导航颜色
    self.title=@"Class_Two";//设置导航标题
    names=[NSMutableArray arrayWithObjects:@"轩爷1",@"轩爷2",@"轩爷3",@"轩爷4",@"轩爷5", nil];//初始化数组
    
}

//内存报警的时候调用
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//表格视图控制器里面的表格视图有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//表格视图控制器里面的表格视图每个分区有几行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //每个分区里的行数就是数组的容量
    return names.count;
}

//表格视图控制器里面的表格视图每个分区的每行里显示的是什么
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //定义编码解码的字符串
    static NSString *cellid=@"xuanxuan";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell ==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    //表格单元内容1－－文本
    cell.textLabel.text=[self.names objectAtIndex:indexPath.row];
    
    //表格单元内容2－－图片
    NSString *path=[[NSBundle mainBundle] pathForResource:@"头像" ofType:@"png"];
    cell.imageView.image=[UIImage imageWithContentsOfFile:path];
    
    //表格单元内容3－－详细
    cell.detailTextLabel.text=@"男";
    
    //表格单元内容4－－附件
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
