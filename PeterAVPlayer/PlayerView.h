//
//  PlayerView.h
//  PeterAVPlayer
//
//  Created by Peter.Hsu on 2016/10/18.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PlayerView : UIView

@property (nonatomic ,strong) AVPlayer *player;
@property (readonly) AVPlayerLayer *playerLayer;

@end
