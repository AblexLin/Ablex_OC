//
//  MyMusic.m
//  MusicX
//
//  Created by 顾明轩 on 16/6/20.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import "MyMusic.h"
//开机动画的两个类
#import "AnimatiomView.h"
#import "UIColor+Hex.h"
@interface MyMusic ()<AnimatiomViewDelegate>
@property (strong, nonatomic) AnimatiomView *animationView;
@end

@implementation MyMusic
#pragma mark - View
- (void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.tintColor=[UIColor greenColor];//这个是设置标签栏颜色的除外
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏标签和导航栏不然影响开机动画效果
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.navigationBarHidden=YES;
    [self _initAnimationView];//开场动画
}
#pragma mark AnimatiomView Action Delegate
- (void)_initAnimationView {
    CGFloat size = 100.0;
    self.animationView = [[AnimatiomView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - size/2, CGRectGetHeight(self.view.frame)/2 - size/2, size, size)];
    _animationView.delegate = self;
    _animationView.parentFrame = self.view.frame;
    [self.view addSubview:_animationView];
}
- (void)completeAnimation {
    [_animationView removeFromSuperview];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#40e0b0"];
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:50.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"MusicX";
    label.transform = CGAffineTransformScale(label.transform, 0.25, 0.25);
    [self.view addSubview:label];
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        label.transform = CGAffineTransformScale(label.transform, 4.0, 4.0);
        
    } completion:^(BOOL finished) {
        for (UIView *view in self.view.subviews) {
            [view removeFromSuperview];
        }
        self.animationView = nil;
        self.view.backgroundColor=[UIColor blackColor];
        self.tabBarController.tabBar.barStyle=UIBarStyleBlackOpaque;
        self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
        self.navigationController.navigationBarHidden=NO;
        self.tabBarController.tabBar.hidden=NO;
        //以上代码均为开场动画
        [self readSongInfo];
        [self creatMinView];
        [self creatMaxView];
        [self creatMusicPlayerScrollView];
        [self creatMusicPlayertableview];
        //定时器用于进度条刷新
        refreshTimer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    }];
}
#pragma mark - NSTimer 定时扫描事件
-(void)timer
{
    if (player.isPlaying) {
        songProgressSlider.value=player.currentTime;                                        //播放的时候让进度条自动往前走
        miniSongProgress.progress=songProgressSlider.value/songProgressSlider.maximumValue; //主界面的小进度条也要更新
    }
}

#pragma mark - popMusicPlayerView 弹出音乐播放器界面
-(void)popMusicPlayerView:(UIButton *)sender
{
    [musicPlayerScrollView setContentOffset:CGPointMake(0, HEIGHT_SCREEN-HEIGHT_TAB_BAR) animated:YES];
}
#pragma mark - UIScrollViewDelegate 滚动视图代理事件
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag==100) {
        [self.navigationController.view addSubview:musicPlayerScrollView];  //如果操作的是播放界面，播放器获得焦点
        CGFloat offet=scrollView.contentOffset.y;                           //获取滚动视图的偏移量
        //NSLog(@"%f",offet);
        //tabbar根据滚动视图缩回到最下面去
        [self.tabBarController.tabBar setFrame:CGRectMake(0, HEIGHT_SCREEN-HEIGHT_TAB_BAR+HEIGHT_TAB_BAR*offet/(HEIGHT_SCREEN-HEIGHT_TAB_BAR), WIDTH_SCREEN, HEIGHT_TAB_BAR)];
        //设置显示效果在滚动的时候透明度
        miniSongNameLabel.alpha=(HEIGHT_SCREEN-HEIGHT_TAB_BAR-offet)/((HEIGHT_SCREEN-HEIGHT_TAB_BAR));
        miniWholeNameLabel.alpha=(HEIGHT_SCREEN-HEIGHT_TAB_BAR-offet)/((HEIGHT_SCREEN-HEIGHT_TAB_BAR));
        miniPlayAndPauseBtn.alpha=(HEIGHT_SCREEN-HEIGHT_TAB_BAR-offet)/((HEIGHT_SCREEN-HEIGHT_TAB_BAR));
        miniSongProgress.alpha=(HEIGHT_SCREEN-HEIGHT_TAB_BAR-offet)/((HEIGHT_SCREEN-HEIGHT_TAB_BAR));
        if (offet==0) {
            [self.navigationController.view addSubview:musicPlayertableview];//如果播放界面被关闭了，表视图获得焦点
        }
    }
}

#pragma mark - UITableView 表格视图代理事件
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return songNames.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    myMusicTableViewCell *cell=[[myMusicTableViewCell alloc]init];
    NSString *wholeName=songNames[indexPath.row];
    NSArray *array=[wholeName componentsSeparatedByString:@"."];
    NSString *nameAndsinger=array[0];
    array=[nameAndsinger componentsSeparatedByString:@"-"];
    NSString *name=array[1];
    cell.songNameLabel.text=name;
    cell.wholeNameLabel.text=nameAndsinger;
    cell.playAndPause.tag=indexPath.row;    //网上淘来的牛b方法
    [cell setCellPlayAndPauseBtnIMG:cellSaveRow andFlag:cellFlag];//通过行和标志来给按钮设置图片
    [cell.playAndPause addTarget:self action:@selector(playAndPause:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    globalCurrentRow=[[[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENTROW"] intValue];
    if (!player.isPlaying || indexPath.row!=globalCurrentRow) {
        songProgressSlider.value=0;
        globalCurrentRow=indexPath.row; //把选择的行给当前行
        [self playAndPause:nil];        //开始播放且按钮参数为空
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//播放后取消选中的状态
}
#pragma mark - readSongInfo 歌曲读取事件
-(void)readSongInfo
{
    NSString *path=[NSBundle mainBundle].bundlePath;
    NSFileManager *fm=[NSFileManager defaultManager];
    NSArray *array=[fm subpathsAtPath:path];
    songNames=[NSMutableArray arrayWithArray:array];
    NSArray *copyArray=[array copy];
    for (NSString *str in copyArray) {
        NSRange range=[str rangeOfString:@".mp3"];
        if (range.location==NSNotFound) {
            [songNames removeObject:str];
        }
    }
    //读取本地保存的当前行
    globalCurrentRow=[[[NSUserDefaults standardUserDefaults] valueForKey:@"CURRENTROW"] intValue];
}
#pragma mark - play 歌曲播放按钮相关点击事件
-(void)playAndPause:(UIButton *)sender
{
    if (sender==nil) {
        NSLog(@"click the button on MusicPlayertableview!");//这里的globalCurrentRow就是表格视图的行在上面赋值了
        [self playSongWithName:songNames[globalCurrentRow]];
    }
    else if (sender.tag==9999 || sender.tag==9998){
        NSLog(@"click the button on maxView or minView!");
        globalCurrentRow=[[[NSUserDefaults standardUserDefaults]valueForKey:@"CURRENTROW"] intValue];
        if (player.isPlaying) {
            [self stopSongAndRefreshUi];
        }
        else{
            [self playSongWithName:songNames[globalCurrentRow]];
        }
    }
    else{
        NSLog(@"click the button on cellPlayAndPauseBtn");
        globalCurrentRow=sender.tag;
        if (cellSaveRow!=sender.tag) {
            [self playSongWithName:songNames[globalCurrentRow]];
        }
        else{
            if (player.isPlaying) {
                [self stopSongAndRefreshUi];
            }
            else{
                [self playSongWithName:songNames[globalCurrentRow]];
            }
        }
    }
}
-(void)lastSong:(UIButton *)sender
{
    songProgressSlider.value=0;
    switch (playModelValue) {
        case RANDOM_PLAY_MODEL:
            while (1) {
                int randomSong;
                randomSong=arc4random()%songNames.count;
                if (globalCurrentRow!=randomSong) {
                    globalCurrentRow=randomSong;
                    break;
                }
            }
            break;
        case AUTOMATIC_PLAY_MODEL:
            if (globalCurrentRow-1>=0) {
                globalCurrentRow=globalCurrentRow-1;
            }
            else{
                globalCurrentRow=songNames.count-1;
            }
            break;
        case SINGLE_PLAY_MODEL:
            //SINGLE_PLAY_MODEL i do nothing
            break;
        default:
            break;
    }
    [self playSongWithName:songNames[globalCurrentRow]];
}
-(void)nextSong:(UIButton *)sender
{
    songProgressSlider.value=0;
    switch (playModelValue) {
        case RANDOM_PLAY_MODEL:
            while (1) {
                int randomSong;
                randomSong=arc4random()%songNames.count;
                if (globalCurrentRow!=randomSong) {
                    globalCurrentRow=randomSong;
                    break;
                }
            }
            break;
        case AUTOMATIC_PLAY_MODEL:
            if (globalCurrentRow+1<=songNames.count-1) {
                globalCurrentRow=globalCurrentRow+1;
            }
            else{
                globalCurrentRow=0;
            }
            break;
        case SINGLE_PLAY_MODEL:
            //SINGLE_PLAY_MODEL i do nothing
            break;
        default:
            break;
    }
    [self playSongWithName:songNames[globalCurrentRow]];
}
-(void)loveSong:(UIButton *)sender
{
    
}
-(void)menuList:(UIButton *)sender
{
    [musicPlayerScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
-(void)playModel:(UIButton *)sender
{
    if (playModelValue==RANDOM_PLAY_MODEL) {
        [self refreshUI:playModelBtn imgNameOrText:@"player_btn_repeat_normal@2x"];
        playModelValue+=1;
    }
    else if (playModelValue==AUTOMATIC_PLAY_MODEL) {
        [self refreshUI:playModelBtn imgNameOrText:@"player_btn_repeatone_normal@2x"];
        playModelValue+=1;
    }
    else if (playModelValue==SINGLE_PLAY_MODEL) {
        [self refreshUI:playModelBtn imgNameOrText:@"player_btn_random_normal@2x"];
        playModelValue=0;
    }
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:playModelValue] forKey:@"PLAYMODEL"];
}
#pragma mark - slider 进度条相关点击事件
-(void)systemVolume:(NSNotification *)sender
{
    player.volume=systemVolumeSlider.value;
    songVolumeSlider.value=systemVolumeSlider.value;
    NSLog(@"系统音量%f",systemVolumeSlider.value);
    if (songVolumeSlider.value==0) {
        songVolumeSlider.minimumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_nosound@2x" ofType:@"png"]];
    }
    else{
        songVolumeSlider.minimumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_slide_sound_little@2x" ofType:@"png"]];
    }
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithFloat:songVolumeSlider.value] forKey:@"VOLUME"];
}
-(void)songVolume:(UISlider *)sender
{
    player.volume=songVolumeSlider.value;
    [systemVolumeSlider setValue:songVolumeSlider.value animated:NO];
    if (songVolumeSlider.value==0) {
        songVolumeSlider.minimumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_nosound@2x" ofType:@"png"]];
    }
    else{
        songVolumeSlider.minimumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_slide_sound_little@2x" ofType:@"png"]];
    }
    [[NSUserDefaults standardUserDefaults]setValue:[NSNumber numberWithFloat:songVolumeSlider.value] forKey:@"VOLUME"];
    
}
-(void)songProgressDown:(UISlider *)sender
{
    [refreshTimer invalidate];//点击滑块的thumb按下的时候关闭定时器，抬起来的时候在重新开启，目的是为了解决滑块滑动的时候卡顿的问题
}
-(void)songProgressUp:(UISlider *)sender
{
    [self playSongWithName:songNames[globalCurrentRow]];
    refreshTimer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer) userInfo:nil repeats:YES];
}
#pragma mark - AVAudioPlayer 播放器代理事件
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [self nextSong:nil];
}
-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
    [self stopSongAndRefreshUi];//如果有电话或者等中断了音乐，就暂停
}
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    [self playSongWithName:songNames[globalCurrentRow]];
}
#pragma mark - 创建界面视图
-(void)creatMinView
{
    //获取歌曲信息
    NSString *wholeName=songNames[globalCurrentRow];
    NSArray *array=[wholeName componentsSeparatedByString:@"."];
    NSString *nameAndsinger=array[0];
    array=[nameAndsinger componentsSeparatedByString:@"-"];
    //创建小视图
    minView=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT_SCREEN-HEIGHT_TAB_BAR-HEIGHT_PLAY_BTN, WIDTH_SCREEN, HEIGHT_PLAY_BTN)];
    minView.backgroundColor=[UIColor blackColor];
    //弹出播放界面按钮
    popMusicPlayerViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_PLAY_BTN)];
    [popMusicPlayerViewBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [popMusicPlayerViewBtn addTarget:self action:@selector(popMusicPlayerView:) forControlEvents:UIControlEventTouchUpInside];
    [minView addSubview:popMusicPlayerViewBtn];
    //迷你歌曲名称
    miniSongNameLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(50, 8, WIDTH_SCREEN-100, HEIGHT_PLAY_BTN/2-8) rate:50.0f andFadeLength:10.0f];
    miniSongNameLabel.marqueeType = MLContinuous;
    miniSongNameLabel.continuousMarqueeSeparator = @"   ";
    miniSongNameLabel.animationCurve = UIViewAnimationOptionCurveLinear;
    miniSongNameLabel.opaque = NO;
    miniSongNameLabel.enabled = YES;
    miniSongNameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    miniSongNameLabel.textAlignment = NSTextAlignmentCenter;
    miniSongNameLabel.textColor = [UIColor greenColor];
    miniSongNameLabel.backgroundColor = [UIColor clearColor];
    miniSongNameLabel.font = [UIFont systemFontOfSize:12.000];
    miniSongNameLabel.text = array[1];
    UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popMusicPlayerView:)];
    [miniSongNameLabel addGestureRecognizer:tapRecognizer1];
    [minView addSubview:miniSongNameLabel];
    //迷你歌曲信息
    miniWholeNameLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(50, 22, WIDTH_SCREEN-100, HEIGHT_PLAY_BTN/2-8) rate:50.0f andFadeLength:10.0f];
    miniWholeNameLabel.marqueeType = MLContinuous;
    miniWholeNameLabel.continuousMarqueeSeparator = @"  |MusicX|  ";
    miniWholeNameLabel.animationCurve = UIViewAnimationOptionCurveLinear;
    miniWholeNameLabel.opaque = NO;
    miniWholeNameLabel.enabled = YES;
    miniWholeNameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    miniWholeNameLabel.textAlignment = NSTextAlignmentCenter;
    miniWholeNameLabel.textColor = [UIColor lightGrayColor];
    miniWholeNameLabel.backgroundColor = [UIColor clearColor];
    miniWholeNameLabel.font = [UIFont systemFontOfSize:10.000];
    miniWholeNameLabel.text = nameAndsinger;
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popMusicPlayerView:)];
    [miniWholeNameLabel addGestureRecognizer:tapRecognizer2];
    [minView addSubview:miniWholeNameLabel];
    //迷你进度条
    miniSongProgress=[[UIProgressView alloc]initWithFrame:CGRectMake(0, HEIGHT_PLAY_BTN-0.5, WIDTH_SCREEN, 0.5)];
    miniSongProgress.backgroundColor=[UIColor grayColor];
    miniSongProgress.progressTintColor=[UIColor greenColor];
    [minView addSubview:miniSongProgress];
    //迷你播放暂停按钮
    miniPlayAndPauseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    miniPlayAndPauseBtn.tag=9998;
    [miniPlayAndPauseBtn setFrame:CGRectMake(0, 0, 40, 40)];
    [miniPlayAndPauseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"nousenow_player_btn_play_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [miniPlayAndPauseBtn addTarget:self action:@selector(playAndPause:) forControlEvents:UIControlEventTouchUpInside];
    [minView addSubview:miniPlayAndPauseBtn];
}
-(void)creatMaxView
{
    NSString *wholeName=songNames[globalCurrentRow];
    NSArray *array=[wholeName componentsSeparatedByString:@"."];                    //通过歌曲名字分割掉.
    NSString *path=[[NSBundle mainBundle] pathForResource:array[0] ofType:array[1]];//通过名字和后缀获取歌曲的路径
    NSString *nameAndsinger=array[0];                                               //获取歌手和歌曲的字符串
    array=[nameAndsinger componentsSeparatedByString:@"-"];                         //拆分歌曲和歌手名字
    NSData *data=[NSData dataWithContentsOfFile:path];                              //获取歌曲二进制数据
    player=[[AVAudioPlayer alloc]initWithData:data error:nil];                      //通过二进制创建播放器，使用url的时候有时候会有bug
    //创建大视图
    maxView=[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT_SCREEN-HEIGHT_TAB_BAR, WIDTH_SCREEN, HEIGHT_SCREEN)];
    maxView.backgroundColor=[UIColor blackColor];
    //播放暂停按钮
    playAndPauseBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    playAndPauseBtn.tag=9999;
    playAndPauseBtn.frame=CGRectMake(WIDTH_SCREEN/2-35, HEIGHT_SCREEN-170, 70, 70);
    [playAndPauseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_play_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [playAndPauseBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_play_highlight@2x" ofType:@"png"]] forState:UIControlStateHighlighted];
    [playAndPauseBtn addTarget:self action:@selector(playAndPause:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:playAndPauseBtn];
    //上一首
    lastSongBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    lastSongBtn.frame=CGRectMake(WIDTH_SCREEN/2-35-(WIDTH_SCREEN-210)/4-70, HEIGHT_SCREEN-170, 70, 70);
    [lastSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_pre_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [lastSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_pre_highlight@2x" ofType:@"png"]] forState:UIControlStateHighlighted];
    [lastSongBtn addTarget:self action:@selector(lastSong:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:lastSongBtn];
    //下一首
    nextSongBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    nextSongBtn.frame=CGRectMake(WIDTH_SCREEN/2+35+(WIDTH_SCREEN-210)/4, HEIGHT_SCREEN-170, 70, 70);
    [nextSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_next_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [nextSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_next_highlight@2x" ofType:@"png"]] forState:UIControlStateHighlighted];
    [nextSongBtn addTarget:self action:@selector(nextSong:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:nextSongBtn];
    //我喜欢
    loveSongBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    loveSongBtn.frame=CGRectMake(20, HEIGHT_SCREEN-40, 35, 35);
    [loveSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_love_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [loveSongBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_love_highlight@2x" ofType:@"png"]] forState:UIControlStateHighlighted];
    [loveSongBtn addTarget:self action:@selector(loveSong:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:loveSongBtn];
    //返回歌曲列表
    menuListBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    menuListBtn.frame=CGRectMake(WIDTH_SCREEN-70, HEIGHT_SCREEN-43, 50, 50);
    [menuListBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_playlist_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [menuListBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_playlist_highlight@2x" ofType:@"png"]] forState:UIControlStateHighlighted];
    [menuListBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:menuListBtn];
    //播放模式
    playModelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    playModelBtn.frame=CGRectMake((WIDTH_SCREEN)/2-25, HEIGHT_SCREEN-45, 50, 50);
    id playmodel=[[NSUserDefaults standardUserDefaults] objectForKey:@"PLAYMODEL"];
    if (playModelBtn==nil) {
        playModelValue=1;
    }
    else{
        playModelValue=[playmodel intValue];
    }
    if (playModelValue==RANDOM_PLAY_MODEL) {
        [playModelBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_random_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    }
    else if (playModelValue==AUTOMATIC_PLAY_MODEL){
        [playModelBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_repeat_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    }
    else if (playModelValue==SINGLE_PLAY_MODEL){
        [playModelBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player_btn_repeatone_normal@2x" ofType:@"png"]] forState:UIControlStateNormal];
    }
    [playModelBtn addTarget:self action:@selector(playModel:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:playModelBtn];

    //声音滑块
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    systemVolumeSlider = nil;
    for (UIView *view in [volumeView subviews]){
        if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
            systemVolumeSlider = (UISlider*)view;
            break;
        }
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemVolume:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    
    songVolumeSlider=[[UISlider alloc]initWithFrame:CGRectMake(40, HEIGHT_SCREEN-80, WIDTH_SCREEN-80, 10)];
    id userSound=[[NSUserDefaults standardUserDefaults]objectForKey:@"VOLUME"];
    if (userSound==nil) {
        songVolumeSlider.value=0.5;
    }
    else{
        songVolumeSlider.value=[userSound floatValue];
    }
    songVolumeSlider.minimumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_slide_sound_little@2x" ofType:@"png"]];
    songVolumeSlider.maximumValueImage=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"playing_volumn_sound@2x" ofType:@"png"]];
    songVolumeSlider.minimumTrackTintColor=[UIColor greenColor];
    [songVolumeSlider setThumbImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"volume_slider_thumb@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [songVolumeSlider addTarget:self action:@selector(songVolume:) forControlEvents:UIControlEventValueChanged];
    [maxView addSubview:songVolumeSlider];
    //歌曲进度滑块
    songProgressSlider=[[ASValueTrackingSlider alloc]initWithFrame:CGRectMake(0, HEIGHT_SCREEN-200, WIDTH_SCREEN, 20)];
    NSNumberFormatter *formatter = [NSNumberFormatter new];//自定义一个格式化
    formatter.numberStyle=NSNumberFormatterDecimalStyle;
    formatter.multiplier=@(0.01666666666666667);
    formatter.positiveSuffix=@"秒";
    formatter.decimalSeparator=@"分";
    formatter.maximumFractionDigits = 2;// 小数位最多位数
    [songProgressSlider setNumberFormatter:formatter];
    songProgressSlider.font = [UIFont systemFontOfSize:12.0];
    songProgressSlider.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor magentaColor], [UIColor greenColor]];
    songProgressSlider.minimumValue=0;
    songProgressSlider.maximumValue=player.duration;
    [songProgressSlider setThumbImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mvplayer_progress_thumb_mini@2x" ofType:@"png"]] forState:UIControlStateNormal];
    [songProgressSlider addTarget:self action:@selector(songProgressDown:) forControlEvents:UIControlEventTouchDown];
    [songProgressSlider addTarget:self action:@selector(songProgressUp:) forControlEvents:UIControlEventTouchUpInside];
    [maxView addSubview:songProgressSlider];
    //歌曲名称
    songNameLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(40, HEIGHT_SCREEN-220-33, WIDTH_SCREEN-80, 18) rate:50.0f andFadeLength:10.0f];
    songNameLabel.marqueeType = MLContinuous;
    songNameLabel.continuousMarqueeSeparator = @"  |MusicX|  ";
    songNameLabel.animationCurve = UIViewAnimationOptionCurveLinear;
    songNameLabel.opaque = NO;
    songNameLabel.enabled = YES;
    songNameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    songNameLabel.textAlignment = NSTextAlignmentCenter;
    songNameLabel.textColor = [UIColor greenColor];
    songNameLabel.backgroundColor = [UIColor clearColor];
    songNameLabel.font = [UIFont systemFontOfSize:18.000];
    songNameLabel.text = miniSongNameLabel.text;
    UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popMusicPlayerView:)];
    [songNameLabel addGestureRecognizer:tapRecognizer1];
    [maxView addSubview:songNameLabel];
    //歌曲信息
    wholeNameLabel = [[MarqueeLabel alloc] initWithFrame:CGRectMake(40, HEIGHT_SCREEN-220-15, WIDTH_SCREEN-80, 15) rate:50.0f andFadeLength:10.0f];
    wholeNameLabel.marqueeType = MLContinuous;
    wholeNameLabel.continuousMarqueeSeparator = @"   ";
    wholeNameLabel.animationCurve = UIViewAnimationOptionCurveLinear;
    wholeNameLabel.opaque = NO;
    wholeNameLabel.enabled = YES;
    wholeNameLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    wholeNameLabel.textAlignment = NSTextAlignmentCenter;
    wholeNameLabel.textColor = [UIColor lightGrayColor];
    wholeNameLabel.backgroundColor = [UIColor clearColor];
    wholeNameLabel.font = [UIFont systemFontOfSize:15.000];
    wholeNameLabel.text = miniWholeNameLabel.text;
    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(popMusicPlayerView:)];
    [wholeNameLabel addGestureRecognizer:tapRecognizer2];
    [maxView addSubview:wholeNameLabel]; 
}
-(void)creatMusicPlayerScrollView
{
    musicPlayerScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH_SCREEN, HEIGHT_SCREEN)];//滚动视图全屏可见
    musicPlayerScrollView.tag=100;                         //设置标志来区分视图
    musicPlayerScrollView.scrollEnabled=YES;               //允许滚动
    musicPlayerScrollView.showsVerticalScrollIndicator=NO; //不显示垂直滚动的指示器
    [musicPlayerScrollView setPagingEnabled:YES];          //开启分页滚动
    musicPlayerScrollView.bounces=NO;                      //滚动在边框时候的弹簧效果
    musicPlayerScrollView.contentSize=CGSizeMake(0, HEIGHT_SCREEN*2-HEIGHT_TAB_BAR);//设置滚动视图能够滚动的范围
    musicPlayerScrollView.contentOffset=CGPointMake(0, 0); //设置滚动视图的位置
    musicPlayerScrollView.delegate=self;                   //设置滚动视图代理
    [musicPlayerScrollView addSubview:minView];            //将小视图添加到滚动视图上去
    [musicPlayerScrollView addSubview:maxView];            //将大视图添加到滚动视图上去
    
    /*!
     1.折腾死我了，这里要分清楚，你想吧滚动视图放在哪里
     2.如果放在tabBarController.view上面，那么视图就会覆盖掉全部，因为tab在这个程序里时rootviewcontroller
     3.如果放在navigationController上面，那么视图就会覆盖掉导航视图，但是不会覆盖掉，tabbar，这里要的就是这个效果
     */
    [self.navigationController.view addSubview:musicPlayerScrollView];

}
-(void)creatMusicPlayertableview
{
    musicPlayertableview=[[UITableView alloc]initWithFrame:CGRectMake(0, HEIGHT_NAV_BAR, WIDTH_SCREEN, HEIGHT_SCREEN-HEIGHT_TAB_BAR-HEIGHT_PLAY_BTN-HEIGHT_NAV_BAR) style:UITableViewStylePlain];
    musicPlayertableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    musicPlayertableview.tag=101;                  //设置标志来区分视图
    musicPlayertableview.dataSource=self;          //设置数据源
    musicPlayertableview.delegate=self;            //设置代理
    musicPlayertableview.showsVerticalScrollIndicator=NO;
    musicPlayertableview.backgroundColor=[UIColor blackColor];
    [self.navigationController.view addSubview:musicPlayertableview];
}

#pragma mark - 播放歌曲
-(void)playSongWithName:(NSString *)_wholeName
{
    NSArray *array=[_wholeName componentsSeparatedByString:@"."];                   //通过歌曲名字分割掉.
    NSString *path=[[NSBundle mainBundle] pathForResource:array[0] ofType:array[1]];//通过名字和后缀获取歌曲的路径
    NSString *nameAndsinger=array[0];                                               //获取歌手和歌曲的字符串
    array=[nameAndsinger componentsSeparatedByString:@"-"];                         //拆分歌曲和歌手名字
    NSData *data=[NSData dataWithContentsOfFile:path];                              //获取歌曲二进制数据
    player=[[AVAudioPlayer alloc]initWithData:data error:nil];                      //通过二进制创建播放器，使用url的时候有时候会有bug
    float tempProgress=songProgressSlider.value/songProgressSlider.maximumValue;    //极其重要，获取当前进度条所在总长度的百分比
    songProgressSlider.maximumValue=player.duration;                                //然后再设置进度条的最大值
    player.currentTime=tempProgress*player.duration;                                //根据保留下来的进度来获取真正播放的点
    player.delegate=self;
    [player play];
    
    //refresh ui
    [self refreshUI:miniSongNameLabel imgNameOrText:array[1]];
    [self refreshUI:miniWholeNameLabel imgNameOrText:nameAndsinger];
    [self refreshUI:songNameLabel imgNameOrText:array[1]];
    [self refreshUI:wholeNameLabel imgNameOrText:nameAndsinger];
    [self refreshUI:playAndPauseBtn imgNameOrText:@"player_btn_pause_normal@2x"];
    [self refreshUI:miniPlayAndPauseBtn imgNameOrText:@"nousenow_player_btn_pause_normal@2x"];
    
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:globalCurrentRow] forKey:@"CURRENTROW"];//只要播放我就写文件
    cellSaveRow=globalCurrentRow;       //这个是cell刷新按钮图片用的
    cellFlag=1;                         //这个是cell刷新按钮图片用的
    [musicPlayertableview reloadData];  //播放完刷新界面
    [self creatBackGroundInfo];         //只要播放就刷新后台数据
}
-(void)stopSongAndRefreshUi
{
    [player stop];
    //refresh ui
    [self refreshUI:playAndPauseBtn imgNameOrText:@"player_btn_play_normal@2x"];
    [self refreshUI:miniPlayAndPauseBtn imgNameOrText:@"nousenow_player_btn_play_normal@2x"];
    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithInt:globalCurrentRow] forKey:@"CURRENTROW"];//只要停止我就写文件
    cellSaveRow=globalCurrentRow;       //这个是cell刷新按钮图片用的
    cellFlag=0;                         //这个是cell刷新按钮图片用的
    [musicPlayertableview reloadData];  //播放结束刷新界面
}
#pragma mark - 自定义刷新界面行为
-(void)refreshUI:(id)_buttonOrLabel imgNameOrText:(NSString *)_imgOrText
{
    if ([_buttonOrLabel isKindOfClass:[UIButton class]]) {
        [_buttonOrLabel setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:_imgOrText ofType:@"png"]] forState:UIControlStateNormal];
    }
    if ([_buttonOrLabel isKindOfClass:[UILabel class]] || [_buttonOrLabel isKindOfClass:[MarqueeLabel class]]) {
        [_buttonOrLabel setText:_imgOrText];
    }
}
#pragma mark - 音乐播放器后台播放
-(void) creatBackGroundInfo
{
    NSString *wholeName=songNames[globalCurrentRow];
    NSArray *array=[wholeName componentsSeparatedByString:@"."];                    //通过歌曲名字分割掉.
    NSString *nameAndsinger=array[0];                                               //获取歌手和歌曲的字符串
    array=[nameAndsinger componentsSeparatedByString:@"-"];                         //拆分歌曲和歌手名字
    // 播放信息中心
    MPNowPlayingInfoCenter *center = [MPNowPlayingInfoCenter defaultCenter];
    // 初始化播放信息
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    // 专辑名称
    //info[MPMediaItemPropertyAlbumTitle] = self.playingMusic.name;
    // 歌手
    info[MPMediaItemPropertyArtist] = nameAndsinger;
    // 歌曲名称
    info[MPMediaItemPropertyTitle] = array[1];
    // 设置图片
    //info[MPMediaItemPropertyArtwork] = [[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:self.playingMusic.icon]];
    // 设置持续时间（歌曲的总时间）
    info[MPMediaItemPropertyPlaybackDuration] = @(player.duration);
    // 设置当前播放进度
    info[MPNowPlayingInfoPropertyElapsedPlaybackTime] = @(player.currentTime);
    
    // 切换播放信息
    center.nowPlayingInfo = info;
    
    // 远程控制事件 Remote Control Event
    // 加速计事件 Motion Event
    // 触摸事件 Touch Event
    
    // 成为第一响应者（必备条件）
    [self becomeFirstResponder];
    // 开始监听远程控制事件
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];

}
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
- (void) remoteControlReceivedWithEvent: (UIEvent *) receivedEvent {
    if (receivedEvent.type == UIEventTypeRemoteControl) {
        switch (receivedEvent.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                [self playSongWithName:songNames[globalCurrentRow]];
                break;
            case UIEventSubtypeRemoteControlPause:
                [self stopSongAndRefreshUi];
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                [self lastSong:nil];
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                [self nextSong:nil];
                break;
            default:
                break;
        }
    }
}
@end
