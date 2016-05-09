//
//  main.m
//  类的继承
//
//  Created by 顾明轩 on 16/5/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXShape.h"
#import "GMXRectangle.h"
#import "GMXCircle.h"
#import "GMXSquare.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        //因为重写了父类的初始化函数，所以输出的应该是9
//        GMXShape *shape=[[GMXShape alloc]init];
//        NSLog(@"\n这个图形1面积是:%d",[shape area]); //调用shape的area行为
//
//        //因为自定义的gmxshape类的初始化函数，所以输出的应该是25
//        GMXShape *shape2=[[GMXShape alloc]initWithWidth:5 andWithHeight:5];//调用自定义init
//        NSLog(@"\n这个图形2面积是:%d",[shape2 area]);
//
//        //长方形，继承shape
//        GMXRectangle *rect1=[[GMXRectangle alloc]init];
//        NSLog(@"\n长方形1面积是:%d",[rect1 area]);
//        GMXRectangle *rect2=[[GMXRectangle alloc]initWithWidth:6 andWithHeight:6];
//        NSLog(@"\n长方形2面积是:%d",[rect2 area]);
//        
//        //正方形也一样，就不写了。。
//        
//        //圆形～～
//        GMXCircle *circle=[[GMXCircle alloc]initWithRadius:6];
//        NSLog(@"\n圆形的面积是:%g",[circle area]);
//        
//        
//        //多态的条件
//        GMXShape *shape2222=circle;
//        NSLog(@"\n多态:%d",[shape2222 area]);
        //这段语句输出的是36，因为不属于多态度，输出的其实是shape类中的width*height
        //不属于多态多原因是因为circle中的area函数返回的是double，而shape中area返回的是int所以shape调用的时候，使用了父类自己的area函数，而不属于多态。这也是多态度的第一个条件。
        //1.父类中已经有了的行为，在子类中被重写。必须行为的名字和返回都相同。
        //下面使用正方形来做实验，新建一个正方形的类～～～
        
//        GMXSquare *square=[[GMXSquare alloc]initWithSide:14];
//        NSLog(@"正方形的面积是下面的数据:%d",[square area]);//输出的是196/2，调用的是sqare中的行为area
//        
//        //这就是多态～～～
//        GMXShape *shapexxx=square;
//        NSLog(@"正真的多态多输出:%d",[shapexxx area]);//这个也是调用square中的area函数
        
        //id数据类型，＝void *

        id s =[[GMXSquare alloc]initWithSide:11];

        if ([s isKindOfClass:[GMXSquare class]])    //判断是不是这个类的成员或者子类的成员
        {
            NSLog(@"是这个类的成员，或者子类的成员");
        }
        else
        {
            NSLog(@"不是这个类的成员，或者子类的成员");
        }
        
        if ([s isMemberOfClass:[GMXShape class]])  //判断是不是这个类的成员
        {
            NSLog(@"是这个类的成员");
        }
        else
        {
            NSLog(@"不是这个类的成员");
        }
        
        SEL selsel=@selector(area);//必须使用sel
        if ([s respondsToSelector:selsel])//判断是否含有某个函数～～～
        {
            NSLog(@"s have area");
            int aa=[s performSelector:selsel];//使用sel去调用area，调用的是动态数据类型s的area
            NSLog(@"面积是:%d",aa);
        }
        else
        {
            NSLog(@"s do not have area");
        }
    }
    return 0;
}








