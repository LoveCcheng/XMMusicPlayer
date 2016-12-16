//
//  XMMusicModel.h
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/16.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    XMMusicTypeLocal,
    XMMusicTypeRemote
}XMMusicType;


@interface XMMusicModel : NSObject

/** 图片 */
@property (nonatomic,copy) NSString *image;

/** 歌词 */
@property (nonatomic,copy) NSString *lrc;

/** 歌曲 */
@property (nonatomic,copy) NSString *mp3;

/** 歌曲名 */
@property (nonatomic,copy) NSString *name;

/** 歌手 */
@property (nonatomic,copy) NSString *singer;

/** 专辑 */
@property (nonatomic,copy) NSString *album;

/** 类型 */
@property (nonatomic,assign) XMMusicType type;



@end
