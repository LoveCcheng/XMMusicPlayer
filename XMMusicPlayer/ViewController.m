//
//  ViewController.m
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/13.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "ViewController.h"
#import "XMMusicViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    self.title=@"主界面";
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100,150,XMScreenW-200,50);    button.backgroundColor = [UIColor brownColor];
    [button setTitle:@"音频播放" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(MusicBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)MusicBtnClick{
    XMLog(@"音频播放");
    XMMusicViewController *music=[[XMMusicViewController alloc]init];
    [self presentViewController:music animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
