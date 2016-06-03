//
//  RotationViewController.h
//  2016.06.03(nib&&tableview)
//
//  Created by 顾明轩 on 16/6/3.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RotationViewController : UIViewController

//水平和垂直的时候使用不同的视图，使用分别定义两个对象
@property (strong, nonatomic) IBOutlet UIView *shuiping;
@property (strong, nonatomic) IBOutlet UIView *chuizhi;

@end
