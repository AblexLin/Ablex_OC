//
//  GMXTelebook.h
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMXDele.h"

@interface GMXTelebook : NSObject<GMXDele,NSCopying>

@property (strong,nonatomic)NSString *contacts_name;
@property (strong,nonatomic)NSString *contacts_tele;
@property (strong,nonatomic)NSString *contacts_sex;

//通讯录对象的行为
-(void)addMan;
-(void)findMan;

@end
