//
//  XMMusicViewController.m
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/14.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMusicViewController.h"
#import <Masonry.h>

//间隔
#define widthSpace 50

@interface XMMusicViewController ()

@property (nonatomic,strong) UIImageView *imageViewBG;

/** 歌手头像 */
@property (nonatomic,strong) UIImageView *IconImageView;

@end

@implementation XMMusicViewController


-(UIImageView *)imageViewBG{
    if (!_imageViewBG) {
        _imageViewBG=[[UIImageView alloc]init];
        _imageViewBG.frame=CGRectMake(0, 0, XMScreenW, XMScreenH);
        _imageViewBG.image=[UIImage imageNamed:@"朴翔.jpg"];
        _imageViewBG.userInteractionEnabled = YES;
        [self.view addSubview:_imageViewBG];
    }
    return _imageViewBG;
}

-(UIImageView *)IconImageView{
    if (!_IconImageView) {
        _IconImageView=[[UIImageView alloc]init];
//        _IconImageView.backgroundColor=[UIColor blueColor];
    }
    return _IconImageView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"音乐播放器";
    self.view.backgroundColor=[UIColor whiteColor];
    [self SetBGimageView];
    [self setupMainUI];
}
//UIToolbar设置背景图片的毛玻璃效果
-(void)SetBGimageView{
    //UIToolbar设置背景图片的毛玻璃效果
    UIToolbar *toolbar = [[UIToolbar alloc]init];
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.frame=[UIScreen mainScreen].bounds;
    [self.imageViewBG addSubview:toolbar];
    
}
/** 主界面UI */
-(void)setupMainUI{
    //上面部分的视图
    UIView *topVIew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XMScreenW, 100)];
    topVIew.backgroundColor=[UIColor clearColor];
    [self.imageViewBG addSubview:topVIew];
    [self viewBelongtoTopview:topVIew];
    
    
    
    
    //添加歌手头像
    self.IconImageView.frame=CGRectMake(widthSpace, widthSpace+100, XMScreenW-2*widthSpace, XMScreenW-2*widthSpace);
    [self.imageViewBG addSubview:self.IconImageView];
    self.IconImageView.image=[UIImage imageNamed:@"朴翔.jpg"];
    
    [self imageViewIconHandle];
    
    //歌词
    UIView *lycView = [[UIView alloc]init];
    lycView.backgroundColor=[UIColor yellowColor];
    [self.imageViewBG addSubview:lycView];
    

    //底部的view
    UIView *BottomVIew=[[UIView alloc]initWithFrame:CGRectMake(0, XMScreenH-160, XMScreenW, 160)];
    [self.imageViewBG addSubview:BottomVIew];
    [self viewBelongBottomView:BottomVIew];
    
    
    [lycView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.imageViewBG).offset(0);
        make.bottom.equalTo(BottomVIew.mas_top).offset(0);
        make.height.equalTo(@30);
        
    }];
  
    
}
/** 上面的控件 */
-(void)viewBelongtoTopview:(UIView *)topview{
    //返回按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(10, 20, 80, 80);
    [button setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_close_b"] forState:UIControlStateNormal];
    [topview addSubview:button];
    [button addTarget:self action:@selector(buttonBack) forControlEvents:UIControlEventTouchUpInside];
    
    //歌名
    UILabel *songName =[[UILabel alloc]init];
    songName.text=@"匆匆那年";
    songName.textColor=[UIColor whiteColor];
    songName.textAlignment=NSTextAlignmentCenter;
    songName.font=[UIFont systemFontOfSize:17];
    [topview addSubview:songName];
    
    //歌手名
    UILabel *ahrourName =[[UILabel alloc]init];
    ahrourName.text=@"王菲";
    ahrourName.textColor=[UIColor whiteColor];
    ahrourName.textAlignment=NSTextAlignmentCenter;
    ahrourName.font=[UIFont systemFontOfSize:15];
    [topview addSubview:ahrourName];
    
    
    //更多按钮
    UIButton *buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonMore setImage:[UIImage imageNamed:@"main_tab_more"] forState:UIControlStateNormal];
    [topview addSubview:buttonMore];
    [buttonMore addTarget:self action:@selector(buttonMore) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topview.mas_top).offset(10);
        make.right.equalTo(topview.mas_right).offset(0);
        make.width.height.equalTo(@90);
    }];
    
    [songName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topview.mas_top).offset(20);
        make.right.equalTo(buttonMore.mas_left).offset(0);
        make.left.equalTo(button.mas_right).offset(0);
        make.height.equalTo(@40);
    }];
    
    [ahrourName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(songName.mas_bottom).offset(0);
        make.right.equalTo(buttonMore.mas_left).offset(0);
        make.left.equalTo(button.mas_right).offset(0);
        make.height.equalTo(@30);
    }];
    
}
/** 给底部视图添加控件 */
-(void)viewBelongBottomView:(UIView *)bottomView{
    //左边label
    UILabel *leftLa = [[UILabel alloc]initWithFrame:CGRectMake(10, 7, 60, 30)];
    //leftLa.backgroundColor=[UIColor redColor];
    leftLa.text=@"00 : 00";
    leftLa.textAlignment=NSTextAlignmentCenter;
    leftLa.textColor=[UIColor whiteColor];
    leftLa.font=[UIFont systemFontOfSize:14];
    [bottomView addSubview:leftLa];
    
    //右边label
    UILabel *rightLa = [[UILabel alloc]init];
    //rightLa.backgroundColor=[UIColor redColor];
    rightLa.text=@"00 : 00";
    rightLa.textAlignment=NSTextAlignmentCenter;
    rightLa.textColor=[UIColor whiteColor];
    rightLa.font=[UIFont systemFontOfSize:14];
    [bottomView addSubview:rightLa];
    
    [rightLa mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView.mas_top).offset(7);
        make.right.equalTo(bottomView).offset(-10);
        make.height.equalTo(@30);
        make.width.equalTo(@60);
    }];
    
    
    //中间的进度条
    UISlider *slider=[[UISlider alloc]init];
    [bottomView addSubview:slider];
    //设置slider属性
    slider.maximumTrackTintColor = [UIColor whiteColor];
    slider.minimumTrackTintColor=[UIColor greenColor];
    slider.thumbTintColor = [UIColor greenColor];
    [slider setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];
    
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView.mas_top).offset(20);
        make.right.equalTo(rightLa.mas_left).offset(-10);
        make.left.equalTo(leftLa.mas_right).offset(10);
        make.height.equalTo(@5);
    }];
    
    
    
    
    //下面的三个按钮
    CGFloat butWidth = (XMScreenW-100-30)/3.0;
    
    UIButton *leftBut=[UIButton buttonWithType:UIButtonTypeCustom];
    leftBut.frame=CGRectMake(50, 50, butWidth, butWidth);
    [leftBut setImage:[UIImage imageNamed:@"player_btn_pre_normal"] forState:UIControlStateNormal];
    [bottomView addSubview:leftBut];
    
    
    UIButton *MidBut=[UIButton buttonWithType:UIButtonTypeCustom];
    MidBut.frame=CGRectMake(butWidth+50+10, 50, butWidth, butWidth);
    //[MidBut sizeToFit];
    [MidBut setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [MidBut setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [bottomView addSubview:MidBut];
    
    
    UIButton *RightBut=[UIButton buttonWithType:UIButtonTypeCustom];
    RightBut.frame=CGRectMake(butWidth+50+10+butWidth+10, 50, butWidth, butWidth);
    [RightBut setImage:[UIImage imageNamed:@"player_btn_next_normal"] forState:UIControlStateNormal];
    [bottomView addSubview:RightBut];
    
}


/** 点击按钮退出 */
-(void)buttonBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)buttonMore{
    XMLog(@"%s",__func__);
}

/** 头像处理 */
-(void)imageViewIconHandle{
    //设置圆角     图片宽度的一半(XMScreenW-2*widthSpace)*0.5
    self.IconImageView.layer.cornerRadius=(XMScreenW-2*widthSpace)*0.5;
    self.IconImageView.layer.masksToBounds=YES;
    //设置边框
    self.IconImageView.layer.borderColor=[UIColor grayColor].CGColor;
    self.IconImageView.layer.borderWidth=5.0;
    
    [self imageBeginTrans];
}
#pragma mark - 头像旋转
/** 旋转图片 */
-(void)imageBeginTrans{
    CABasicAnimation *animation = [[CABasicAnimation alloc]init];
    animation.fromValue =@(0);
    animation.toValue=@(M_PI*2);
    animation.duration = 100;
    animation.keyPath =@"transform.rotation.z";
    //重复次数是最大值
    animation.repeatCount = NSIntegerMax;
    animation.removedOnCompletion = NO;
    [self.IconImageView.layer addAnimation:animation forKey:@"rotation"];
}

//设置状态栏白色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}






































@end
