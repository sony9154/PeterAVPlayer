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
#import "PlayerView.h"

@interface ViewController ()
//@property (nonatomic) AVPlayerViewController *avPlayerViewController;
@property (nonatomic ,weak) IBOutlet PlayerView *playerView;
@property (nonatomic ,weak) AVPlayerItem *playerItem;
@property (nonatomic) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *videoUrl = [NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14468618701471.mp4"];
    //NSURL *videoUrl = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    //NSURL *videoUrl = [NSURL URLWithString:@"http://192.168.99.30/schedule/schedule_stream1/playlist.m3u8"];
    /*AVPlayer *player = [AVPlayer playerWithURL:videoUrl];
    self.avPlayerViewController = [AVPlayerViewController new];
    self.avPlayerViewController.player = player;
    self.avPlayerViewController.view.frame = self.view.frame;
    [self.view addSubview:self.avPlayerViewController.view];
    self.view.autoresizesSubviews = TRUE;*/
    
    //self.playerView = [PlayerView new];
    self.playerItem = [AVPlayerItem playerItemWithURL:videoUrl];
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    self.playerView.player = self.player;
    [self.playerView.player play];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
