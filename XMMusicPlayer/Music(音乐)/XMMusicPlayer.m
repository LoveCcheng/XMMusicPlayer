//
//  XMMusicPlayer.m
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/16.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMusicPlayer.h"
#import <AVFoundation/AVFoundation.h>


@interface XMMusicPlayer ()<AVAudioPlayerDelegate>
/** 播放器 */
@property (nonatomic,strong) AVAudioPlayer *player;
/** 文件名 */
@property (nonatomic,copy) NSString *fileName;

/** 播放完成后的的回调 */
@property (nonatomic,copy) void(^complete)();

@end

@implementation XMMusicPlayer


+(instancetype)sharePlayManager{
    static XMMusicPlayer *playManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playManager = [[self alloc]init];
    });
    return playManager;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)playMusicWithFileName:(NSString *)fileName didComplete:(void (^)())complete{
    if (![_fileName isEqualToString:fileName]) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        AVAudioPlayer *player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        
        self.player=player;
        [player prepareToPlay];
        player.delegate=self;
        self.fileName=fileName;
        self.complete=complete;
    }
    [self.player play];
}


-(void)pause{
    [self.player pause];
}


//返回当前播放的时间
-(NSTimeInterval)currentTimes{
    return self.player.currentTime;
}
//返回音频总时长
-(NSTimeInterval)duration{
    return self.player.duration;
}

-(void)setCurrentTime:(NSTimeInterval)currentTimes{
    self.player.currentTime = currentTimes;
}


































@end
