//
//  sandBoxViewController.m
//  2016.06.06~2016.06.15
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "sandBoxViewController.h"

@interface sandBoxViewController ()

@end

@implementation sandBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str1=NSHomeDirectory();
    NSString *str2=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *str3=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *str4=NSTemporaryDirectory();
    NSLog(@"\n%@\n%@\n%@\n%@",str1,str2,str3,str4);
    //获取用户数据显示在输入框中
    self.userInfoText.text=[[NSUserDefaults standardUserDefaults] valueForKey:@"key"];
    
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

- (IBAction)saveUserInfoBtn:(UIButton *)sender {
    //点击按钮保存数据
    [[NSUserDefaults standardUserDefaults] setValue:self.userInfoText.text forKey:@"key"];
}
@end
