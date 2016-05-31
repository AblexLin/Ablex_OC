//
//  Class_three_TableViewController.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_three_TableViewController.h"

@interface Class_three_TableViewController ()

@end

@implementation Class_three_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Class_Three";                                        //设置导航标题
    //直接设置title能够让标签栏和导航栏都显示，这个非常棒，建议使用title
    
    //初始化两个数组
    self.stars_name=[NSMutableArray arrayWithObjects:@"王菲",@"汪峰",@"刘欢",@"韩红",@"丁丁",@"小刚",@"德华", nil];
    self.stars_sex=[NSMutableArray arrayWithObjects:@"女歌星",@"男歌星",@"男歌星",@"女歌星",@"女歌星",@"男歌星",@"男歌星", nil];
    
}

//分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//每个分区内的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.stars_name.count;
}

//每个分区每个行的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellid=@"xuanxuan";
    //先从内存出列一个看看
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell ==NULL) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"头像" ofType:@"png"];
    
    cell.textLabel.text=self.stars_name[indexPath.row];
    cell.detailTextLabel.text=self.stars_sex[indexPath.row];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageWithContentsOfFile:path];
    
    //区分男女歌星
    if ([self.stars_sex[indexPath.row] isEqualToString:@"男歌星"]) {
        self.indentationLevel=1;
    }
    else{
        self.indentationLevel=0;
    }
    
    return cell;
}

//重点，行选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"您选中了%d",indexPath.row);
    //可以在这里添加一个新的视图控制器，这样就能够继续显示新的界面了
}

//男歌星缩进一格
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int a;
    if (self.indentationLevel==1) {
        a=1;
    }
    else{
        a=0;
    }
    return a;
}

//单元格的高度,也就是每行表格的宽度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}

//内存报警的时候调用
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
