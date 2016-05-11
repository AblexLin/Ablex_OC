//
//  GMXWenjian.h
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXWenjian : NSObject<NSCoding>//想归档自己等类，必须继承这个协议

@property (strong,nonatomic)NSString *name;
@property (assign,nonatomic)int age;

-(void)say;

@end
