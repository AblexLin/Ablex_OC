//
//  AllPersonViewController.m
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AllPersonViewController.h"
#import "AddPersonViewController.h"
#import "ContactInfo.h"
#import "ShowPersonViewController.h"

@interface AllPersonViewController ()

@end

@implementation AllPersonViewController

@synthesize searchbar;
@synthesize persons;
@synthesize table_view;
@synthesize dictionary;
@synthesize keys;
@synthesize values;

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化两个按钮
    UIBarButtonItem *mainview_left=[[UIBarButtonItem alloc]initWithTitle:@"群组" style:UIBarButtonItemStylePlain target:self action:@selector(mianview_left_Tap)];
    UIBarButtonItem *mainview_right=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(mianview_right_Tap)];
    
    //定义左右按钮
    self.navigationItem.leftBarButtonItem=mainview_left;
    self.navigationItem.rightBarButtonItem=mainview_right;
    self.navigationItem.title=@"所有联系人";

    //定义搜索栏
    searchbar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 320, 40)];
    searchbar.searchBarStyle=UISearchBarStyleProminent;
    searchbar.delegate=self;
    searchbar.placeholder=@"搜索";
    [self.view addSubview:searchbar];
    
    //定义表视图
    table_view=[[UITableView alloc]initWithFrame:CGRectMake(0, 104, 320, 376) style:UITableViewStylePlain];
    table_view.dataSource=self;
    table_view.delegate=self;
    //定义个刷新控件(如果是uitableviewcontroller会自带这个)
    UIRefreshControl *ref=[[UIRefreshControl alloc]init];
    [ref addTarget:self action:@selector(refreshTap:) forControlEvents:UIControlEventValueChanged];
    [table_view addSubview:ref];
    [self.view addSubview:table_view];

    //初始化字典，keys，persons
    self.dictionary=[NSMutableDictionary dictionaryWithCapacity:1000];
    self.keys=[NSMutableArray arrayWithCapacity:100];
    self.persons=[NSMutableArray arrayWithCapacity:1000];
}

//刷新控件行为
-(void)refreshTap:(id)sender
{
    NSLog(@"dsadsadsadsa");
    [sender endRefreshing];
}
//搜索栏行为
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击了搜索按钮");
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //相关于取消搜索对行为
    [searchbar resignFirstResponder];
    searchbar.showsCancelButton=NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"搜索栏开始编辑");
    //显示取消按钮
    searchbar.showsCancelButton=YES;
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

//新增联系人
- (void)mianview_right_Tap
{
    NSLog(@"点击了新增联系人");
    AddPersonViewController *add=[[AddPersonViewController alloc]init];
    add.delegate=self;//实现代理
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:add];
    [self presentViewController:nav animated:YES completion:nil];
}

//点击了群组按钮
- (void)mianview_left_Tap
{
    NSLog(@"点击了群组");
}
//标题
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keys;
}
//分区数目
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return keys.count;
}
//分区内行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //先获取当前所在分区
    NSArray *arr=[dictionary objectForKey:keys[section]];
    return arr.count;
}
//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idd=@"sdjhkladjklsajdklsajlkd";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:idd];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
    }
    //首先获取显示的分区在哪个分区
    NSArray *arr=[dictionary objectForKey:keys[indexPath.section]];
    
    //arr里面全部都是联系人，所以必须新建一个联系人的对象来保存数据
    ContactInfo *temp=arr[indexPath.row];
    
    //显示字典里的values里的联系人的姓名
    cell.textLabel.text=temp.name;
    return cell;
}
//选中某一个行的时候
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowPersonViewController *show=[[ShowPersonViewController alloc]init];
    show.delegate=self;//实现代理
    ContactInfo *temp=[dictionary objectForKey:keys[indexPath.section]][indexPath.row];
    //传递数据到显示页面去
    show.text_name=temp.name;
    show.text_telp=temp.telp;
    show.text_mail=temp.mail;
    show.text_home=temp.home;
    show.indexPathForMainToShow=indexPath;//主界面行列信息传递给显示界面
    
    [self.navigationController pushViewController:show animated:YES];
}
//实现传递数据协议的行为(显示界面到主界面--删除联系人)
-(void)deleteContact:(NSIndexPath *)_indexPath
{
    
    //删除数据
    NSMutableArray *arr=[dictionary objectForKey:keys[_indexPath.section]];
    [arr removeObjectAtIndex:_indexPath.row];
    
    //如果删除数据后里面就没有数据了，那么直接连key也删除了，否则重新写字典
    if (arr.count==0) {
        [dictionary removeObjectForKey:keys[_indexPath.section]];
    }
    else{
        [dictionary setObject:arr forKey:keys[_indexPath.section]];
    }
    
    //删除界面
    [self.table_view deleteRowsAtIndexPaths:[NSArray arrayWithObject:_indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    //获取keys后要排序
    NSArray *key=[[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];;
    keys=[NSMutableArray arrayWithArray:key];

    //不管对界面做什么，都要重新刷新下数据，不然行列不对应，久报错了
    [self.table_view reloadData];
}

//实现传递数据协议的行为(显示界面到主界面--修改联系人)---修改联系人，其实就是先删除联系人，再新建联系人。这样的实现方式是最靠谱的。比老师讲的修改行要好。
-(void)passValueName:(NSString *)_name andTelp:(NSString *)_telp andMail:(NSString *)_mail andHome:(NSString *)_home andIndexPath:(NSIndexPath *)_indexPath
{
    //删除数据
    NSMutableArray *arr=[dictionary objectForKey:keys[_indexPath.section]];
    [arr removeObjectAtIndex:_indexPath.row];
    
    //如果删除数据后里面就没有数据了，那么直接连key也删除了，否则重新写字典
    if (arr.count==0) {
        [dictionary removeObjectForKey:keys[_indexPath.section]];
    }
    else{
        [dictionary setObject:arr forKey:keys[_indexPath.section]];
    }
    
    //删除界面
    [self.table_view deleteRowsAtIndexPaths:[NSArray arrayWithObject:_indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
    //获取keys后要排序
    NSArray *key=[[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];;
    keys=[NSMutableArray arrayWithArray:key];
    
    //不管对界面做什么，都要重新刷新下数据，不然行列不对应，久报错了
    [self.table_view reloadData];
    ContactInfo *ci=[[ContactInfo alloc]init];
    ci.name=_name;
    ci.telp=_telp;
    ci.mail=_mail;
    ci.home=_home;
    //截取姓名拼音的首字母
    NSString *headerName=[[[self hanzi2pinyin:ci.name] substringToIndex:1] uppercaseString];
    
    //首先我要读取联系人从字典里
    persons =[dictionary objectForKey:headerName];
    
    //这里为什么这么做？
    //因为一个空的数组，不能使用addObject给它添加元素
    if (persons.count==0) {
        persons=[NSMutableArray arrayWithObject:ci];
    }
    else{
        [persons addObject:ci];
    }
    
    //使用这个行为点时候自动会添加key的。我总是认为不会添加。其实是添加一组键值
    [dictionary setObject:persons forKey:headerName];
    
    //字典添加完成后，再获取下keys
    //获取keys后要排序
    NSArray *key2=[[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];;
    keys=[NSMutableArray arrayWithArray:key2];
    
    [self.table_view reloadData];
    
}

//实现传递数据协议的行为(新增界面到主界面)
-(void)passValueName:(NSString *)_name andTelp:(NSString *)_telp andMail:(NSString *)_mail andHome:(NSString *)_home
{
    ContactInfo *ci=[[ContactInfo alloc]init];
    ci.name=_name;
    ci.telp=_telp;
    ci.mail=_mail;
    ci.home=_home;
    //截取姓名拼音的首字母
    NSString *headerName=[[[self hanzi2pinyin:ci.name] substringToIndex:1] uppercaseString];
    
    //首先我要读取联系人从字典里
    persons =[dictionary objectForKey:headerName];
    
    //这里为什么这么做？
    //因为一个空的数组，不能使用addObject给它添加元素
    if (persons.count==0) {
        persons=[NSMutableArray arrayWithObject:ci];
    }
    else{
        [persons addObject:ci];
    }
    
    //使用这个行为点时候自动会添加key的。我总是认为不会添加。其实是添加一组键值
    [dictionary setObject:persons forKey:headerName];
    
    //字典添加完成后，再获取下keys
    //获取keys后要排序
    NSArray *key=[[dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];;
    keys=[NSMutableArray arrayWithArray:key];

    [self.table_view reloadData];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"aaa");
}

//汉字转换成拼音
-(NSString *)hanzi2pinyin:(NSString *)str
{
    NSMutableString *ms = [[NSMutableString alloc] initWithString:str];//定义一个动态字符串
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
        NSLog(@"Pingying: %@", ms); // wǒ shì zhōng guó rén//返回带声调的拼音
    }
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
        NSLog(@"Pingying: %@", ms); // wo shi zhong guo ren//返回不带声调的拼音
    }
    return ms;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
