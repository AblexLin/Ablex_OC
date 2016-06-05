//
//  ViewController.m
//  2016.06.05(飞机大战)
//
//  Created by 顾明轩 on 16/6/5.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
@interface ViewController ()

@property (strong, nonatomic) MainView *mainView;

@end

@implementation ViewController
@synthesize mainView,bullet,enemy,bomb;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView=[[MainView alloc]init];
    self.view=mainView;
    //初始化子弹的数组
    self.mainView.bullets=[[NSMutableArray alloc]initWithCapacity:100];
    //初始化敌人的数组
    self.mainView.enemys=[[NSMutableArray alloc]initWithCapacity:100];
    //初始化爆炸的数组
    self.mainView.bombs=[[NSMutableArray alloc]initWithCapacity:100];

    
    //创建刷新界面的定时器
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    
    //创建生产敌人的定时器
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(produce:) userInfo:nil repeats:YES];
}

//随机生成敌人的战机
-(void)produce:(NSTimer *)sender
{
    //随机生成一个平宽度以内的x
    int b=[UIScreen mainScreen].bounds.size.width-57;
    int a=arc4random()%b;
    
    //初始化敌人
    enemy=[[Enemys alloc]init];
    //给敌人添加初始化数据
    enemy.enemyPointX=a;
    enemy.enemyPointY+=3;
    enemy.isEnemyValid=YES;
    //把敌人添加到数组中
    [self.mainView.enemys addObject:enemy];
}

-(void)refresh:(NSTimer *)sender
{
    NSLog(@"刷新刷新");
    //获取子弹，然后改变子弹的坐标,这里需要一个拷贝，不然你在下面删除的时候，这个遍历数组的数组就变成了一个变量，这个是不合理的
    NSMutableArray *arr=[self.mainView.bullets copy];
    for (bullet in arr) {
        if (bullet.bulletPointY<-11) {
            bullet.isBulletValid=NO;
            [self.mainView.bullets removeObject:bullet];
        }
        else{
            bullet.bulletPointY-=3;
        }
    }
    //刷新敌人的坐标
    NSMutableArray *arr1=[self.mainView.enemys copy];
    for (enemy in arr1) {
        if (enemy.enemyPointY>[UIScreen mainScreen].bounds.size.height) {
            enemy.isEnemyValid=NO;
            [self.mainView.enemys removeObject:enemy];
        }
        else{
            enemy.enemyPointY+=3;
        }
    }
    
    //判断现在是不是有敌人和子弹相交接，如果有的话就认为现在是爆炸
    NSMutableArray *arr2=[self.mainView.bullets copy];
    NSMutableArray *arr3=[self.mainView.enemys copy];
    for (enemy in arr3) {
        CGRect enemyRect=CGRectMake(enemy.enemyPointX, enemy.enemyPointY, 57, 43);
        for (bullet in arr2) {
            CGRect bulletRect=CGRectMake(bullet.bulletPointX,bullet.bulletPointY, 5, 11);
            //判断两个矩形是不是相交
            if (CGRectIntersectsRect(enemyRect, bulletRect)) {
                //创建爆炸的对象不能忘记了
                bomb=[[BombS alloc]init];
                //有相交点那么就是爆炸
                bomb.isBomb=YES;
                //记录爆炸点
                bomb.bombPointX=enemy.enemyPointX;
                bomb.bombPointY=enemy.enemyPointY;
                //添加爆炸点到数组
                [self.mainView.bombs addObject:bomb];
 
                //删除子弹和敌人
                [self.mainView.bullets removeObject:bullet];
                [self.mainView.enemys removeObject:enemy];

            }
            else{
                self.bomb.isBomb=NO;
            }
        }
    }
    
    //遍历数组让数字加1,放在这里非常重要哦，每次刷新都重绘制，非常重要哦
    for (BombS *b in self.mainView.bombs) {
        b.bombImgNum+=1;
    }
    self.mainView.myPlaneNum+=1;
    //擦掉屏幕
    [self.view setNeedsDisplay];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"开始点击屏幕，点击屏幕了那么就生成子弹");
    //首先获取点击的手指个数
    UITouch *touch=[touches anyObject];
    //获取点击点的坐标
    CGPoint point=[touch locationInView:self.view];
    if (point.y>400) {
        //初始化武器库对象
        bullet=[[Bullets alloc]init];
        //把点的坐标赋值给子弹的坐标
        bullet.bulletPointX=point.x;
        bullet.bulletPointY=[UIScreen mainScreen].bounds.size.height-70;
        
        //新增的子弹设置为有效的子弹
        bullet.isBulletValid=YES;
        
        //把子弹添加到数组里
        [self.mainView.bullets addObject:bullet];
        
        //把鼠标点击的点设置为飞机的点
        self.mainView.myPlanePoint=point;
    }
    
    //每次子弹添加完毕那么就清楚屏幕重新去绘画，这里的刷新还是有必要的
    [self.view setNeedsDisplay];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
