//
//  AblexAction.h
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AblexAction : NSObject

+(void)alertForTitle:(NSString *)_string ForID:(id)_self;
+(void)actionSheetForTitle:(NSString *)_string ForID:(id)_self;

+(BOOL)invalidCheckForString:(NSString *)_string;
@end
