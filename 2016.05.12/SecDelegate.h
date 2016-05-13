//
//  SecDelegate.h
//  2016.05.12
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SecDelegate <NSObject>

@required
-(void)phone;//打电话
-(void)payoff;//发工资

@optional
-(void)talk;//谈心

@end
