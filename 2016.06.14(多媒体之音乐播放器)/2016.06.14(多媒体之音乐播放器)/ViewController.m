//
//  ViewController.m
//  2016.06.14(多媒体之音乐播放器)
//
//  Created by 顾明轩 on 16/6/14.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface ViewController ()
{
    AVAudioPlayer *av;
    AVAudioRecorder *recorder;
    
}

//播放30秒之内的系统声音的方法
- (IBAction)sysMusic:(UIButton *)sender;

//播放时间较长的背景声音的方法
- (IBAction)backgroundMusic:(UIButton *)sender;
- (IBAction)pauseMusic:(UIButton *)sender;
- (IBAction)continueMusic:(UIButton *)sender;

//录音也在av的框架里
- (IBAction)touchDownRecord:(UIButton *)sender;
- (IBAction)touchUpRecord:(UIButton *)sender;

//视频播放
- (IBAction)shipinBtn:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导入声音的框架AVFoundation
    //导入头文件<AVFoundation/AVFoundation>
    //获取文件路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"rec" ofType:@"caf"];
    NSString *pathForRec1=[NSTemporaryDirectory() stringByAppendingPathComponent:@"rec.caf"];
//    //通过路径来创建一个url
//    NSURL *url=[NSURL fileURLWithPath:path];
//    //通过url创建一个视频播放对象
//    av=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    //有时候url不好使，推荐使用data二进制的方式去实现
    NSData *data=[[NSFileManager defaultManager] contentsAtPath:pathForRec1];
    av=[[AVAudioPlayer alloc]initWithData:data error:nil];
    
    
    //创建录音机保存路径和文件
    NSString *pathForRec=[NSTemporaryDirectory() stringByAppendingPathComponent:@"rec.caf"];
    NSLog(@"%@",NSTemporaryDirectory());
    //创建初始化用的url
    NSURL *url=[NSURL URLWithString:pathForRec];
    //设置配置的字典，里面主要有四个，采样频率，声道数，采样位数，录音质量
    NSMutableDictionary *settings=[NSMutableDictionary dictionaryWithCapacity:4];
    [settings setObject:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];                   //采样频率
    [settings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];                     //声道数
    [settings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];                   //采样位数
    [settings setObject:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey]; //录音质量
    //创建录音机对象
    recorder=[[AVAudioRecorder alloc]initWithURL:url settings:settings error:nil];
}


//播放30秒之内的系统声音的方法
- (IBAction)sysMusic:(UIButton *)sender {
    NSLog(@"播放系统声音！");
    //系统声音有几个特点，不超过30秒，caf，aif，wav
    //导入声音的框架audioToolBox，我们默认的有三个，uikit是界面的框架，foundion框架，还有cg的那个框架
    //导入头文件<AudioToolbox/AudioToolbox.h>
    //获取文件路径
    NSString *path=[[NSBundle mainBundle] pathForResource:@"win" ofType:@"wav"];
    NSLog(@"%@",path);
    //通过路径来创建一个url
    NSURL *url=[NSURL fileURLWithPath:path];
    //注册文件为系统文件
    SystemSoundID sid;
    //创建系统sid
    OSStatus err=AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &sid);
    if (err) {
        NSLog(@"创建系统声音id失败！");
    }
    //播放系统声音
    AudioServicesPlaySystemSound(sid);
}

//播放时间较长的背景声音的方法
- (IBAction)backgroundMusic:(UIButton *)sender {
    //这个不能喝上面创建av放在一个事件里，放在一个事件里不能播放
    if (av) {
        [av play];
    }
}
//暂停播放背景音乐
- (IBAction)pauseMusic:(UIButton *)sender {
    [av pause];
}
//继续播放背景音乐
- (IBAction)continueMusic:(UIButton *)sender {
    [av play];
}
//开始录音
- (IBAction)touchDownRecord:(UIButton *)sender {
    NSLog(@"开始录音");
    [recorder record];
    
}
//停止录音
- (IBAction)touchUpRecord:(UIButton *)sender {
    NSLog(@"停止录音");
    [recorder stop];
}
//视频播放
- (IBAction)shipinBtn:(UIButton *)sender {
    NSString *path2=NSTemporaryDirectory();
    NSString *path=[path2 stringByAppendingPathComponent:@"夏洛特烦恼.mp4"];
    
    
    NSURL *url2=[NSURL fileURLWithPath:path];
    
    NSLog(@"%@",path2);
    //这里的名字不能写错，是视图控制器哦
    //这个是旧版实现方式
//    MPMoviePlayerViewController *mpv=[[MPMoviePlayerViewController alloc]initWithContentURL:url2];
//    [self presentViewController:mpv animated:YES completion:nil];
    AVPlayerViewController *avp=[[AVPlayerViewController alloc]init];
    AVPlayer *player=[[AVPlayer alloc]initWithURL:url2];
    avp.player=player;
    [self presentViewController:avp animated:YES completion:nil];
    //如何让视频界面的done变成中文，先设置info里面的Localization native development region默认是en设置为china
    //第二步设置上面设置info的最左边可以选择是target还是project，选择projext然后把里面的Localization添加中文简体久好了，这就是本地化
}

@end
