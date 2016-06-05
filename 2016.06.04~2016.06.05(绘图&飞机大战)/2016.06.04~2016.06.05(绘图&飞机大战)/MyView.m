//
//  MyView.m
//  2016.06.04~2016.06.05(绘图&飞机大战)
//
//  Created by 顾明轩 on 16/6/4.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "MyView.h"

@implementation MyView

@synthesize point;
@synthesize donghuaTimer;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor orangeColor];
        point.x=50.0;
        point.y=50.0;
        //初始化一个定时器
        self.donghuaTimer=[[NSTimer alloc]init];
        
        //定制一个定时器
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
        //这里的定时器是需要行为里面的代码运行结束才开始计时时间，所以根据行为里代码量的不一样，实际时间可能不是你设置的时间哦！
    }
    return self;
}
-(void)timer:(NSTimer *)sender
{
    //每隔零点五秒就擦掉一次屏幕重新显示
    [self setNeedsDisplay];
    
    //如果到达底部了，那就不刷新了
    if (point.y>=400.0) {
        [sender invalidate];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    /*
    // 画图之前先要获取画布,设置当前的view为画布其实就是
    CGContextRef context=UIGraphicsGetCurrentContext();
    
    //设置起点
    CGContextMoveToPoint(context, 50, 50);
    
    //开始划线
    CGContextAddLineToPoint(context, 60, 60);
    
    //想要显示就必须要使用画笔着色
    CGContextStrokePath(context);
    
    //画个空心的矩形
    CGContextAddRect(context, CGRectMake(60, 60, 30, 30));
    //着色
    CGContextStrokeRect(context, CGRectMake(60, 60, 30, 30));
    //画个实心的矩形
    CGContextFillRect(context, CGRectMake(100, 60, 30, 30));
    
    //画个空心的圆
    CGContextStrokeEllipseInRect(context, CGRectMake(140, 60, 30, 30));
    //画个实心的矩形
    CGContextFillEllipseInRect(context, CGRectMake(180, 60, 30, 30));
    
    //绘制文字
    NSString *str=@"你看到我啦";
    [str drawAtPoint:CGPointMake(100, 100) withAttributes:nil];
    
    //绘制图片
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Settings-Air@2x" ofType:@"png"];
    UIImage *img=[UIImage imageWithContentsOfFile:path];
    [img drawAtPoint:CGPointMake(100, 140)];
    */
    
    //以上为学习绘图的，下面将绘制飞机大战需要的图
    //先牛刀小试画一个动态的圆
    
    //每次进来都让这里的y往下走,因为执行上面的清除画布，所以才会一直执行这里的这个画布程序
    point.y+=0.8;
    //先获取画布
    CGContextRef context=UIGraphicsGetCurrentContext();
    //画圆
    CGContextStrokeEllipseInRect(context, CGRectMake(100, point.y, 50, 50));
    
}


@end
