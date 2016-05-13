//
//  GMXStd.h
//  玩玩～～
//
//  Created by 顾明轩 on 16/5/11.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMXStd : NSObject<NSCopying,NSCoding>

@property (strong,nonatomic)NSString *std_name;
@property (assign,nonatomic)int std_age;

-(void)stdIntroduction;
+(id)stdIntroduction;

@end
