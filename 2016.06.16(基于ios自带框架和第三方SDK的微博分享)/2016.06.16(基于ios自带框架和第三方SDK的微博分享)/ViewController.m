//
//  ViewController.m
//  2016.06.16(基于ios自带框架和第三方SDK的微博分享)
//
//  Created by 顾明轩 on 16/6/16.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

#import "WeiboSDK.h"

@interface ViewController ()
{
    SLComposeViewController *slComposerSheet;
}
- (IBAction)baseIos:(UIButton *)sender;
- (IBAction)baseSDK:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)baseIos:(UIButton *)sender {
    
    if ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=6) {
        
        
        // if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo])
        //{
        //创建分享视图控制器对象 需要指定你要分享的类型
        slComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        //要分享的文字
        [slComposerSheet setInitialText:@"Sina Weibo"];
        //要分享的图片
        [slComposerSheet addImage:[UIImage imageNamed:@"ios6.jpg"]];
        //要分享的连接
        [slComposerSheet addURL:[NSURL URLWithString:@"http://www.weibo.com/"]];
        //显示这个分享的视图
        [self presentViewController:slComposerSheet animated:YES completion:nil];
        //}
        //判断结果
        [slComposerSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
            NSLog(@"start completion block");
            NSString *output;
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    output = @"Action Cancelled";
                    break;
                case SLComposeViewControllerResultDone:
                    output = @"Post Successfull";
                    break;
                default:
                    break;
            }
            if (result != SLComposeViewControllerResultCancelled)
            {
                UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Weibo Message" message:output preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *show=[UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:nil];
                
                [alert addAction:show];
                [self presentViewController:alert animated:YES completion:nil];
            }
        }];
        
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://weibo.com"]];
        
    }
    
    
}

- (IBAction)baseSDK:(UIButton *)sender {
    
    //创建消息对象
    WBMessageObject *o=[WBMessageObject message];
    o.text=@"你看到额了美啊";
    //设置分享文本
    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:o];
    //发送请求
    [WeiboSDK sendRequest:request];
    //然后在info里面添加urlbyte信息
}
@end
