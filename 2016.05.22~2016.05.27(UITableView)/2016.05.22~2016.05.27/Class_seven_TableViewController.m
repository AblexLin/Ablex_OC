//
//  Class_seven_TableViewController.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_seven_TableViewController.h"

@interface Class_seven_TableViewController ()

@end

@implementation Class_seven_TableViewController

@synthesize dict,keys,values;
@synthesize arrayForDict;
@synthesize sb;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"随机数";
    UITabBarItem *ti=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    self.tabBarItem=ti;
    
    //初始化数组和字典
    keys=[NSMutableArray arrayWithCapacity:27];
    values=[NSMutableArray arrayWithCapacity:1001];
    dict=[NSMutableDictionary dictionaryWithCapacity:27];
    
    //初始化keys
    for (int i=65; i<91; i++) {
        [keys addObject:[NSString stringWithFormat:@"%c",i]];
    }
    //把随机字母放到字典里去
    for (int i=0; i<1000; i++) {
        int random_num1=arc4random()%26+97;
        int random_num2=arc4random()%26+97;
        int random_num3=arc4random()%26+97;
        int random_num4=arc4random()%26+97;
        int random_num5=arc4random()%26+97;
        //获取小写字符串
        NSString *str=[NSString stringWithFormat:@"%c%c%c%c%c",random_num1,random_num2,random_num3,random_num4,random_num5];
        //把所有随机生成的字符串保存到数组中去
        [values addObject:str];
    }
    
    //初始化两个数组
    arrayForDict=[NSMutableArray arrayWithCapacity:1001];
    NSMutableArray *arrayForCopy=[NSMutableArray arrayWithCapacity:1001];

    for (int i=0; i<26; i++) {
        for (NSString *str1 in values) {
            NSString *str2=[NSString stringWithFormat:@"%c",i+97];
            if ([str1 hasPrefix:str2]==YES) {
                [arrayForDict addObject:str1];          //查找是不是有符合条件的首字母，符合就加进来
            }
        }
        arrayForCopy=[arrayForDict copy];               //必须先拷贝出来再赋值
        [dict setObject:arrayForCopy forKey:keys[i]];   //添加到字典中
        [arrayForDict removeAllObjects];                //把数组里的内容删除，回到上面重新循环
    }
    
    //写入到文件（待定方法）
    NSString *path=[[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
    [self.dict writeToFile:path atomically:YES];
    [self.dict writeToFile:@"nihao" atomically:YES];
    
    //下拉刷新
    self.refreshControl=[[UIRefreshControl alloc]init];
    //显示属性文本
    self.refreshControl.attributedTitle=[[NSAttributedString alloc]initWithString:@"正在刷新..."];
    [self.refreshControl addTarget:self action:@selector(refresh) forControlEvents:UIControlEventValueChanged];
    
    //添加搜索栏
    self.sb=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    //关闭拼音检查
    sb.autocorrectionType=UITextAutocorrectionTypeNo;
    //取消首字母大写
    sb.autocapitalizationType=UITextAutocapitalizationTypeNone;
    //设置搜索栏样式
    [sb setSearchBarStyle:UISearchBarStyleMinimal];
    //实现代理
    sb.delegate=self;
    
    sb.placeholder=@"请输入搜索的内容";
    
    //设置表格视图的表头为搜索栏
    self.tableView.tableHeaderView=sb;
}

//搜索栏取消按钮
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"搜索栏取消按钮啦啦啦");
    //搜索栏失去焦点
    [searchBar resignFirstResponder];
    //不显示取消按钮
    searchBar.showsCancelButton=NO;
}

//搜索栏搜索
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"搜索栏啦啦啦");
}

//已经开始编辑了
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    searchBar.showsCancelButton=YES;
}

//下拉刷新
-(void)refresh
{
    //停止刷新
    [self.refreshControl endRefreshing];
    //刷新后重新载入数据
    [self.tableView reloadData];
    
}

//表格视图的分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 26;
}

//表格视图分区内的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //获取当前的key,key对应的是数组，那么数组多长度就是分区内行的行数
    NSArray *temp=[dict objectForKey:keys[section]];
    return temp.count;
}

//表格视图每行显示的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idd=@"jskldjakldsa";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idd ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    //获取当前的key,key对应的是数组，那么数组多长度就是分区内行的行数
    NSArray *temp=[dict objectForKey:keys[indexPath.section]];
    
    cell.textLabel.text=temp[indexPath.row];
    return cell;
}

//表格视图显示的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return keys[section];
}

//表格视图显示的索引
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}


@end
