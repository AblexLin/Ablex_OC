//
//  GMXAction.h
//  2016.05.11
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "action.h"//导入协议
#import "action1.h"

@interface GMXAction : NSObject<action,action1> //继承这个协议

//@interface GMXAction : NSObject<action1,action2,action3,> //继承多个协议

@property (copy,nonatomic)NSString *name;

@end
