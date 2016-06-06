//
//  NewViewController.m
//  2016.06.06(沙盒数据)
//
//  Created by 顾明轩 on 16/6/6.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *userPassword;

- (IBAction)signTap:(UIButton *)sender;
- (IBAction)loginTap:(UIButton *)sender;

@property (strong ,nonatomic) NSString *filePath;
@property (strong ,nonatomic) NSMutableDictionary *fileInfomation;
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    self.filePath=[path stringByAppendingPathComponent:@"saveUserInfo.plist"];
    self.fileInfomation=[NSMutableDictionary dictionaryWithContentsOfFile:self.filePath];
    NSLog(@"%@",self.filePath);
    self.userName.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signTap:(UIButton *)sender {
    if (![self.userName.text isEqualToString:@""] || ![self.userPassword.text isEqualToString:@""]) {
        //判断字典或者数组是不是为空，因为空的时候不能给里面添加数据的
        if (self.fileInfomation==nil) {
            self.fileInfomation=[NSMutableDictionary dictionaryWithObject:self.userPassword.text forKey:self.userName.text];
        }
        else{
            [self.fileInfomation setObject:self.userPassword.text forKey:self.userName.text];
        }
        //不为空的时候就注册成功
        [self.fileInfomation writeToFile:self.filePath atomically:YES];
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *susscess=[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:^(UIAlertAction *sender){
            NSLog(@"您点击了取消按钮！");
            self.userName.text=@"";
            self.userPassword.text=@"";
            [self.userName becomeFirstResponder];
        }];
        [alert addAction:susscess];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else{
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"友情提示!" message:@"请输入用户名和密码后再注册!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *sender){
            NSLog(@"您点击了取消按钮！");
        }];
        UIAlertAction *reInput=[UIAlertAction actionWithTitle:@"重新输入" style:UIAlertActionStyleDefault handler:^(UIAlertAction *sender){
            NSLog(@"您点击了重新输入按钮！");
            [self.userName becomeFirstResponder];
        }];
        [alert addAction:cancel];
        [alert addAction:reInput];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)loginTap:(UIButton *)sender {
    NSLog(@"%@",self.fileInfomation);
    if (self.fileInfomation==nil) {
        NSLog(@"暂时还未注册过任何信息");
    }
    else{
        NSArray *keys=[self.fileInfomation allKeys];
        for (NSString *str in keys) {
            if ([self.userName.text isEqualToString:str] && [self.userPassword.text isEqualToString:[self.fileInfomation objectForKey:str]]) {
                NSLog(@"登陆成功");
                //如果登陆成功了，记下用户的用户名
                [[NSUserDefaults standardUserDefaults] setObject:self.userName.text forKey:@"USERNAME"];
                //其实就是一个字典，存放在系统的lib目录下面的Preferences这个文件夹下面的一个字典
            }
        }
    }

}
@end
