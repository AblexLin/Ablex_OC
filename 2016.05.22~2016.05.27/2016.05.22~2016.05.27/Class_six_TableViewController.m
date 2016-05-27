//
//  Class_six_TableViewController.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_six_TableViewController.h"

@interface Class_six_TableViewController ()

@end

@implementation Class_six_TableViewController
@synthesize names,keys;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Class_Six";
    self.view.backgroundColor=[UIColor lightGrayColor];
    
    //读取本地所有的keys
    NSString *path=[[NSBundle mainBundle] pathForResource:@"names" ofType:@"plist"];
    self.names=[NSMutableDictionary dictionaryWithContentsOfFile:path];
    keys=[[self.names allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //字典里有多少keys就应该有多少个分区
    return keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //每个分区里的行数应该是对应key里面的数组的内容的个数
    //先根据当前的分区读取当前的key
    NSString *currentkey=[keys objectAtIndex:section];
    //读取当前key里面的array
    NSArray *arr=[names objectForKey:currentkey];
    //返回array里面的数目
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idd=@"sasa";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    
    //先读取当前分区所对应动key
    NSString *currentkey=[keys objectAtIndex:indexPath.section];
    //再读取当前key里面对应的数组
    NSArray *arr=[[names objectForKey:currentkey] sortedArrayUsingSelector:@selector(compare:)];
    //再显示到界面上去
    cell.textLabel.text=arr[indexPath.row];

    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return keys[section];
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
