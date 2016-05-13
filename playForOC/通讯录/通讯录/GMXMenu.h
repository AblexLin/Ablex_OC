//
//  GMXMenu.h
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXMenuProtocol.h"

@interface GMXMenu : NSObject<GMXMenuProtocol>

@property (strong,nonatomic)NSString *item_number;

@end
