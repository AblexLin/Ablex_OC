//
//  Class_one_ViewController.m
//  2016.05.22~2016.05.27
//
//  Created by 顾明轩 on 16/5/27.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "Class_one_ViewController.h"

@interface Class_one_ViewController ()

@end

/************************************/
/** 通过在视图控制器上添加表格视图来实现 **/
/************************************/
@implementation Class_one_ViewController
//视图加载完成
- (void)viewDidLoad {
    [super viewDidLoad];                                            //调用父类的viewDidLoad
    self.view.backgroundColor=[UIColor whiteColor];                 //设置下视图的背景颜色
    self.title=@"Class_One";                                        //设置导航标题
    //直接设置title能够让标签栏和导航栏都显示，这个非常棒，建议使用title
    
    //UITableView相关设置
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 416) style:UITableViewStylePlain];//初始化一个表格视图，样式为普通样式
    self.names=[NSMutableArray arrayWithObjects:@"轩爷1",@"轩爷2",@"轩爷3",@"轩爷4",@"轩爷5", nil];//初始化数组
    
    //想要将UITableView显示在屏幕上，需要实现两个协议
    self.tableview.dataSource=self;
    self.tableview.delegate=self;
    
    //将表格视图添加到视图控制器上
    [self.view addSubview:self.tableview];
}

//实现协议的行为－－确定表格视图有几个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //返回表格视图里有多少个分区
    return 1;
}

//实现协议的行为－－确定表格视图每个分区有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //数组有多少个元素，表格视图的每个分区就有多少行就有多少行
    return self.names.count;
}

//实现协议的行为－－确定表格视图每个分区的每一行里显示什么
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid=@"mycell";//定义一个静态变量用来表示单元解码用的
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellid];//先从内存中去读cell或者叫出列一个
    //如果内存中读取不到，那么就自己初始化一个
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text=self.names[indexPath.row];//把数组里的数据显示到表格的text上面去
    return cell;
}


//内存不足时报警
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//生成时候的注释
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
