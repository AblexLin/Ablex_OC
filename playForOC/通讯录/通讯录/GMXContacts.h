//
//  GMXContacts.h
//  通讯录
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXContacts : NSObject<NSCopying,NSCoding>

//联系人信息
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *tel;

@end
