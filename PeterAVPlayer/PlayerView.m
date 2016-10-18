//
//  PlayerView.m
//  PeterAVPlayer
//
//  Created by Peter.Hsu on 2016/10/18.
//  Copyright © 2016年 Peter.Hsu. All rights reserved.
//

#import "PlayerView.h"


@implementation PlayerView

- (AVPlayer *)player {
    return self.playerLayer.player;
}

- (void)setPlayer:(AVPlayer *)player {
    self.playerLayer.player = player;
}

// Override UIView method
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayerLayer *)playerLayer {
    return (AVPlayerLayer *)self.layer;
}

@end







