//
//  ViewController.m
//  PeterAVPlayer
//
//  Created by Peter.Hsu on 2016/10/14.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface ViewController ()
@property (nonatomic) AVPlayerViewController *avPlayerViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *videoUrl = [NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14468618701471.mp4"];
    //NSURL *videoUrl = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    //NSURL *videoUrl = [NSURL URLWithString:@"http://evaluation.unified-streaming.com/video/tears-of-steel/tears-of-steel.ism/.m3u8"];
    AVPlayer *player = [AVPlayer playerWithURL:videoUrl];
    self.avPlayerViewController = [AVPlayerViewController new];
    self.avPlayerViewController.player = player;
    self.avPlayerViewController.view.frame = self.view.frame;
    [self.view addSubview:self.avPlayerViewController.view];
    self.view.autoresizesSubviews = TRUE;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
