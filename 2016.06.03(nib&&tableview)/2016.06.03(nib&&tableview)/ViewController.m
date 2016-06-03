//
//  ViewController.m
//  2016.06.03(nib&&tableview)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //想要实现自定义单元格,需要在这里先加载nib
    //加载nib其实就是初始化一个nib的对象
    UINib *nib=[UINib nibWithNibName:@"Empty" bundle:nil];
    
    //注册nib到内存,这里成功后，下面就可以直接出列啦，这样就不需要判断是不是出列成功
    [self.tableView registerNib:nib forCellReuseIdentifier:@"oneXX"];
    
    
}

//这个和正常的纯代码编辑的时候有些区别
//主要区别在于纯代码编辑的时候，必须手动设置代理，也就是必须有
//    self.tableview.delegate=self;
//    self.tableview.datasource=self;
//而在nib的编程里面这一步则需要使用拖拽的方式来确定这个所谓的代理的赋值

//下面再来设计表格里的自定义单元格如何来实现

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString*cellid=@"fdjahfdk";
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"oneXX"];
//    if (cell==nil) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
//    }
//    cell.textLabel.text=@"hello!";
    
    if (cell.switchSX.on==YES) {
        cell.textField.text=@"heihei";
    }
    else{
        cell.textField.text=@"尼玛";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tap:(UITapGestureRecognizer *)sender {
    NSLog(@"触摸事件的单击事件");
}
@end
