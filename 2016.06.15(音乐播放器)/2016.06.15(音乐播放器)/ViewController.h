//
//  ViewController.h
//  2016.06.15(音乐播放器)
//
//  Created by 顾明轩 on 16/6/15.
//  Copyright © 2016年 顾明轩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)lastSongBtn:(UIButton *)sender;
- (IBAction)nextSongBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *playSong;
- (IBAction)progressChange:(UISlider *)sender;
- (IBAction)volSlider:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UISlider *volSlider;
- (IBAction)playSongBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@end

