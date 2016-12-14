//
//  XMLaunchView.m
//  baisi-one
//
//  Created by montnets on 2016/12/6.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMLaunchView.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"

/** 屏幕宽度 */
#define XMScreenW [UIScreen mainScreen].bounds.size.width
/** 屏幕高度 */
#define XMScreenH [UIScreen mainScreen].bounds.size.height

#define SDMainScreenBounds [UIScreen mainScreen].bounds

@interface XMLaunchView ()

@property(nonatomic,strong)NSTimer *timer;//广告计时器
/** 标记是什么操作 */
@property (assign, nonatomic) NSInteger isClick;

@end

@implementation XMLaunchView

-(instancetype)initWithWindow:(UIWindow *)window withType:(Launcgtype)type{
    self = [super init];
    if (self) {
        [window makeKeyAndVisible];
        self.adTime = 10;
        self.frame = CGRectMake(0, 0, XMScreenW, XMScreenH);
//        self.placeholderImageName=@"引导页.png";
        self.backgroundColor=[UIColor whiteColor];
        [window addSubview:self];
        [self setUI];
    }
    return self;
}

/** 初始化 */
-(void)setUI{
    [self loadAdimageView];
    [self loadButtonAd];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(ontimer) userInfo:nil repeats:YES];
}
/** 加载广告页图片 */
-(void)loadAdimageView{
    self.adImageView=[[UIImageView alloc]init];
    self.adImageView.frame = CGRectMake(0, 0, XMScreenW, XMScreenH);
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapone)];
    self.adImageView.userInteractionEnabled=YES;
    [self.adImageView addGestureRecognizer:tap];
    [self addSubview:self.adImageView];
}
/** 跳过按钮 */
-(void)loadButtonAd{
    self.skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.skipBtn.frame = CGRectMake(XMScreenW - 100, 20, 90, 30);
    self.skipBtn.backgroundColor = [UIColor brownColor];
    self.skipBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.skipBtn addTarget:self action:@selector(skipBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.adImageView addSubview:self.skipBtn];

}
/** 跳过广告页 */
- (void)skipBtnClick{
    _isClick = 2;
    [self startCallBack];
}
/** 最后的回调 */
-(void)startCallBack{
    [self.timer invalidate];
    self.timer = nil;
    self.hidden = YES;
    self.adImageView.hidden = YES;
    [self removeFromSuperview];
    if (_isClick== 1) {
        if (self.ClickCallBlock) {//点击广告
            self.ClickCallBlock(1100);
        }
    }else if(_isClick == 2){

        if (self.ClickCallBlock) {//点击跳过
            self.ClickCallBlock(1101);
        }
    }else{
        if (self.ClickCallBlock) {//计时器完成跳过
            self.ClickCallBlock(1102);
        }
    }
}
/** 点击图片 */
-(void)tapone{
    _isClick=1;
    NSLog(@"跳转广告页%s",__func__);
    [self startCallBack];
}
/** 计时器方法 */
-(void)ontimer{
    if (self.adTime==0) {
        [self.timer invalidate];
        self.timer = nil;
        _isClick=3;
        [self startCallBack];
    }else{
        [self.skipBtn setTitle:[NSString stringWithFormat:@"%@ | 跳过广告",@(self.adTime--)] forState:UIControlStateNormal];
    }
}
/** 设置图片并启动定时器 */
-(void)setImageUrl:(NSString *)imageUrl{
    _imageUrl=imageUrl;
    __weak typeof(self)weakself = self;
    [self.adImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:self.placeholderImageName] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        weakself.adImageView.image=image;
        [weakself.timer fire];
    }];
}




























@end
