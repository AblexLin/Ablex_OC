//
//  MyClass.h
//  2016.06.06(沙盒数据)
//
//  Created by 顾明轩 on 16/6/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject<NSCopying,NSCoding>

@property (strong, nonatomic) NSString *str;
@property (strong, nonatomic) NSArray *array;
@property (strong, nonatomic) NSDictionary *dictionary;

@end
