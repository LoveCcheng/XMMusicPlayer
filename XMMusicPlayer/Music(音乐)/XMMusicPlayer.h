//
//  XMMusicPlayer.h
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/16.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMMusicPlayer : NSObject


@property (nonatomic,assign) NSTimeInterval currentTimes;
@property (nonatomic,assign) NSTimeInterval duration;


+(instancetype)sharePlayManager;

/** 播放音乐的方法 */
-(void)playMusicWithFileName:(NSString *)fileName didComplete:(void(^)())complete;

/** 暂停 */
-(void)pause;


@end
