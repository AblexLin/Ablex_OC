//
//  GMXMenuProtocol.h
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GMXMenuProtocol <NSObject>

@required
-(void)showMenu;
-(NSString *)inputItem;

@end
