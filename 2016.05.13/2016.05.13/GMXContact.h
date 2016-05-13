//
//  GMXContact.h
//  2016.05.13
//
//  Created by 顾明轩 on 16/5/13.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXContact : NSObject<NSCopying,NSCoding>

//联系人有哪些资料
@property (strong,nonatomic)NSString *name;
@property (strong,nonatomic)NSString *tel;
@property (strong,nonatomic)NSString *sex;
@property (strong,nonatomic)NSString *company;

@end
