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
@property (nonatomic) AVPlayerViewController *avPlayerViewController;
@property(nonatomic,strong)UISlider *volumeViewSlider;
@property (nonatomic,strong) UIView *volumeControlView;
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
    
    self.volumeControlView = [[UIView alloc] initWithFrame:CGRectMake(self.avPlayerViewController.view.frame.size.height / 2,
                                                                     0,
                                                                     self.view.frame.size.height /2,
                                                                     self.view.frame.size.width)
                              ];
    [self.avPlayerViewController.view addSubview:self.volumeControlView];
    [self.view addSubview:self.avPlayerViewController.view];
    
    self.view.autoresizesSubviews = TRUE;
    
    [self createGesture];

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

#pragma mark - 创建手势
- (void)createGesture
{
    //获取系统音量
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    _volumeViewSlider = nil;
    for (UIView *view in [volumeView subviews]){
        if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
            _volumeViewSlider = (UISlider *)view;
            break;
        }
    }
    
    // 添加平移手势，用来控制音量和快进快退
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panDirection:)];
    [self.volumeControlView addGestureRecognizer:pan];
}

#pragma mark - 平移手势方法
- (void)panDirection:(UIPanGestureRecognizer *)pan
{
    CGPoint veloctyPoint = [pan velocityInView:self.view];
    [self verticalMoved:veloctyPoint.y]; // 垂直移动方法只要y方向的值
}

#pragma mark - pan垂直移动的方法
- (void)verticalMoved:(CGFloat)value
{
    // 更改系统的音量
    self.volumeViewSlider.value -= value / 10000; // 越小幅度越小
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
