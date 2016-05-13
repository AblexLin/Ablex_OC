//
//  GMXSec.h
//  2016.05.12
//
//  Created by 顾明轩 on 16/5/12.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecDelegate.h"

@interface GMXSec : NSObject<SecDelegate>

@property(strong,nonatomic)NSString *name;

@end
