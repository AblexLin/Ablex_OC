//
//  ViewController.m
//  2016.06.04~2016.06.05(绘图&飞机大战)
//
//  Created by 顾明轩 on 16/6/4.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "KVOStudy.h"

@interface ViewController ()

@property (strong, nonatomic)KVOStudy *person;

@end

@implementation ViewController

@synthesize person;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyView *view=[[MyView alloc]init];
    self.view=view;
    
    person=[[KVOStudy alloc]init];
    person.name=@"zhangsan";
    person.age=20;
    //使用kvc的时候可以如下的对赋值
    id person2=[[KVOStudy alloc]init];
    //这个是单个赋值，也可以构建一个字典来赋值
    [person2 setValue:@"xuanyr" forKey:@"name"];
    [person2 valueForKey:@"name"];
    //[person2 setValue:@12212 forKeyPath:@"card.num"];可以直接这样来给对象的属性的属性来设置数据也可以的
    //使用字典来赋值
    NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan",@"name",@22,@"age", nil];
    [person2 setValuesForKeysWithDictionary:dict];
    
    //观察这个对象
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:@"111"];
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld context:@"222"];
    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew|NSKeyValueObservingOptionPrior context:@"333"];
    //NSKeyValueObservingOptionPrior意思是在旧的数据的那个change里面先产生一个旧的，再去产生新的，一般不需要这么做
    //移除对对象的观察观察
    //[person removeObserver:self forKeyPath:@"name" context:@"111"];
}
-(void)viewDidAppear:(BOOL)animated
{
    person.name=@"xuanye";
    person.age=30;
}
//你观察的对象发生变化了就会调用这个函数了
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //上面是初始化的时候这里是看不到前两个数据的
    NSLog(@"keypath=%@,change=%@,context=%@",keyPath,change,context);
    
}

//移除观察时候调用的行为
-(void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
