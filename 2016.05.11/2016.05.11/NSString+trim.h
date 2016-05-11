//
//  NSString+trim.h
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (trim)
//类别只能添加行为，不能添加数据
//如果添加的行为和内部本身的行为相同的时候，就会覆盖掉原先的内容
-(NSString *)trim;

@end
