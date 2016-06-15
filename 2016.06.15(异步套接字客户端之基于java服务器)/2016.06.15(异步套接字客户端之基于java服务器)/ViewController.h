//
//  ViewController.h
//  2016.06.15(异步套接字客户端之基于java服务器)
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"
@interface ViewController : UIViewController<AsyncSocketDelegate>
{
    AsyncSocket *socket;//套接字，使用它和服务器来沟通
    NSError *saveError;
}

@property (weak, nonatomic) IBOutlet UITextField *sendText;

- (IBAction)sendBtn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextView *recText;
@end

