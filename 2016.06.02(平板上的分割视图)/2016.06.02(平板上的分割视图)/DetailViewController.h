//
//  DetailViewController.h
//  2016.06.02(平板上的分割视图)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PassValue.h"
@interface DetailViewController : UIViewController<PassValue>

@property (strong, nonatomic) UILabel *label;

@end
