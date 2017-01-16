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
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *videoUrl = [NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/14468618701471.mp4"];
    //NSURL *videoUrl = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    self.avPlayerViewController = [AVPlayerViewController new];
    self.avPlayerViewController.player = player;
    self.avPlayerViewController.view.frame = self.view.frame;
    [self.view addSubview:self.avPlayerViewController.view];
    MPVolumeView *volumeView = [ [MPVolumeView alloc] init] ;
    volumeView.center = CGPointMake(volumeView.center.x + self.view.frame.size.width/2, volumeView.center.y + 350);
    [volumeView setShowsVolumeSlider:YES];
    [volumeView sizeToFit];
    [self.avPlayerViewController.view addSubview:volumeView];
    self.view.autoresizesSubviews = TRUE;

}
// =======================強制轉向播放=====================================
- (void)viewDidAppear:(BOOL)animated {
    [[UIDevice currentDevice] setValue:
     [NSNumber numberWithInteger: UIInterfaceOrientationLandscapeRight]
                                forKey:@"orientation"];
}
- (BOOL) shouldAutorotate {
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskLandscape);
}
// =======================強制轉向播放=====================================

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
