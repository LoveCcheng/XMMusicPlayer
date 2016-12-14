//
//  AppDelegate.m
//  XMMusicPlayer
//
//  Created by montnets on 2016/12/13.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "AppDelegate.h"
#import "XMLaunchView.h"
#import "ViewController.h"
#import "XMadViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.window.backgroundColor=[UIColor redColor];
//    [self.window makeKeyAndVisible];
    XMLaunchView *adView=[[XMLaunchView alloc]initWithWindow:self.window withType:LauncgtypeAd];
    adView.imageUrl=@"http://pic.qiantucdn.com/58pic/17/80/57/94s58PICA7j_1024.jpg";
    
    [adView setClickCallBlock:^(NSInteger tag) {
        if (tag == 1100) {
//            NSLog(@"点击广告回调");
            XMadViewController *adv=[[XMadViewController alloc]init];
            [self.window.rootViewController presentViewController:adv animated:YES completion:nil];
        }else{
            ViewController *vc=[[ViewController alloc]init];
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
            self.window.rootViewController = nav;
        
        }
//        if (tag == 1101)
//        {
//            NSLog(@"点击跳过回调");
////            ViewController *vc=[[ViewController alloc]init];
////            self.window.rootViewController = vc;
//        }else{
//            NSLog(@"倒计时完成后的回调");
//        }
    }];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
