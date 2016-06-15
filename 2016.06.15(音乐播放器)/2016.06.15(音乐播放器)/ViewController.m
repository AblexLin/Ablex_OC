//
//  ViewController.m
//  2016.06.15(音乐播放器)
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{
    BOOL isPlaying;
    AVAudioPlayer *player;
    NSArray *urlArray;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path1=[[NSBundle mainBundle] pathForResource:@"杜雯媞,王艺翔-雪" ofType:@"mp3"];
    NSURL *url1=[NSURL fileURLWithPath:path1];
    NSString *path2=[[NSBundle mainBundle] pathForResource:@"李荣浩-李白" ofType:@"mp3"];
    NSURL *url2=[NSURL fileURLWithPath:path2];
    NSString *path3=[[NSBundle mainBundle] pathForResource:@"薛之谦-演员" ofType:@"mp3"];
    NSURL *url3=[NSURL fileURLWithPath:path3];
    urlArray=[NSArray arrayWithObjects:url1,url2,url3, nil];
    //创建播放器
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:urlArray[1] error:nil];
    //设置定时器
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(pro:) userInfo:nil repeats:YES];
}

//刷新图片和进度条
-(void)pro:(NSTimer *)sender{
    self.progressSlider.value=player.currentTime;
    self.progressSlider.maximumValue=player.duration;//歌曲的总时间，浮点型，单位是秒
    
    if (player.isPlaying) {
        [self.playSong setImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
        
    }
    else{
        [self.playSong setImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }
}
//上一首
- (IBAction)lastSongBtn:(UIButton *)sender {
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:urlArray[0] error:nil];
    [player play];
    
}
//下一首
- (IBAction)nextSongBtn:(id)sender {
    player=[[AVAudioPlayer alloc]initWithContentsOfURL:urlArray[2] error:nil];
    [player play];
}
//开始和暂停
- (IBAction)playSongBtn:(UIButton *)sender {
    if (!player.isPlaying) {
        [player play];
    }
    else{
        [player stop];
    }
}
//歌曲播放进度
- (IBAction)progressChange:(UISlider *)sender {
    player.currentTime=sender.value;//歌曲当前进度
}
//歌曲播放声音
- (IBAction)volSlider:(UISlider *)sender {
    player.volume=sender.value;//设置音量
}
@end
