//
//  PassValueForNewToMain.h
//  2016.05.28~2016.05.31(UIContacts)
//
//  Created by 顾明轩 on 16/5/31.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PassValueForNewToMain <NSObject>

//可选的协议，传递数据用
@optional
-(void)passValueName:(NSString *)_name andTelp:(NSString *)_telp andMail:(NSString *)_mail andHome:(NSString *)_home;
-(void)passValueName:(NSString *)_name andTelp:(NSString *)_telp andMail:(NSString *)_mail andHome:(NSString *)_home andIndexPath:(NSIndexPath *)_indexPath;
-(void)deleteContact:(NSIndexPath *)_indexPath;

@end
