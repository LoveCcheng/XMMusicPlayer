//
//  XMMusicViewController.m
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/14.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "XMMusicViewController.h"

@interface XMMusicViewController ()

@property (nonatomic,strong) UIImageView *imageViewBG;

@end

@implementation XMMusicViewController


-(UIImageView *)imageViewBG{
    if (!_imageViewBG) {
        _imageViewBG=[[UIImageView alloc]init];
        _imageViewBG.frame=CGRectMake(0, 0, XMScreenW, XMScreenH);
        _imageViewBG.image=[UIImage imageNamed:@"朴翔.jpg"];
        [self.view addSubview:_imageViewBG];
    }
    return _imageViewBG;
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

-(void)setupMainUI{
    UIView *topVIew=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XMScreenW, 100)];
    topVIew.backgroundColor=[UIColor redColor];
    [self.imageViewBG addSubview:topVIew];
    
    
    
    
    UIView *BottomVIew=[[UIView alloc]initWithFrame:CGRectMake(0, XMScreenH-150, XMScreenW, 150)];
    BottomVIew.backgroundColor=[UIColor greenColor];
    [self.imageViewBG addSubview:BottomVIew];
}










































@end
