//
//  XMLaunchView.h
//  baisi-one
//
//  Created by montnets on 2016/12/6.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 加载的类型 */
typedef enum{
    /** 广告类型 */
    LauncgtypeAd = 1,
    /** 引导图类型 */
    LauncgtypeGuide,
    /** GIF类型 */
    LauncgtypeGif
}Launcgtype;

@interface XMLaunchView : UIView

/** 广告图片 */
@property (nonatomic,strong) UIImageView *adImageView;
/** 倒计时时间 */
@property (nonatomic,assign) NSInteger adTime;
/** 跳过按钮 */
@property (nonatomic,strong) UIButton *skipBtn;
/** 图片地址 */
@property (nonatomic,copy) NSString *imageUrl;
/** 广告地址 */
@property (nonatomic,copy) NSString *adUrl;
/**
 广告图片未出现之时的占位图,默认为"引导页.png",可自行设置.提高用户体验.
 */
@property(nonatomic,strong)NSString *placeholderImageName;

/**
 广告页面是否允许跳过,默认可以点击跳过
 */
@property(nonatomic,assign)BOOL isSkip;

@property (nonatomic,copy) void(^ClickCallBlock)(NSInteger tag);

/** 初始化方法，并传入类型 */
-(instancetype)initWithWindow:(UIWindow *)window withType:(Launcgtype)type;





































@end
