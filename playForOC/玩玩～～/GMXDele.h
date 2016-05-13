//
//  GMXDele.h
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GMXDele <NSObject>

//必须实现的协议
@required
-(void)changeMan;

//选择实现的协议
@optional
-(void)deleMan;

@end
