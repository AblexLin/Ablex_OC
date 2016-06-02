//
//  PassValue.h
//  2016.06.02(平板上的分割视图)
//
//  Created by 顾明轩 on 16/6/2.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValue <NSObject>

//定义传递数据的协议，主要是把菜单栏的数据传递给后面显示的详细界面

-(void)passStr:(NSString *)_strNum;

@end
