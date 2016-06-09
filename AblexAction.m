//
//  AblexAction.m
//  2016.06.08(登陆注册)
//
//  Created by 顾明轩 on 16/6/9.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "AblexAction.h"

@implementation AblexAction

+(void)alertForTitle:(NSString *)_string ForID:(id)_self
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:_string preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *close=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:close];
    [_self presentViewController:alert animated:YES completion:nil];
}

+(void)actionSheetForTitle:(NSString *)_string ForID:(id)_self
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示" message:_string preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *close=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:close];
    [_self presentViewController:alert animated:YES completion:nil];
}

+(BOOL)invalidCheckForString:(NSString *)_string
{
    NSString *str=[_string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([str isEqualToString:@""]) {
        return NO;
    }
    return YES;
}
@end
