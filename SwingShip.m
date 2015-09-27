//
//  SwingShip.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/24/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "SwingShip.h"
#import <AVFoundation/AVFoundation.h>
@interface SwingShip ()

@end

@implementation SwingShip
{
    UIImageView *ship;
    UIImageView *sea1, *sea2, *sea3, *sea4;
    AVAudioPlayer* audioPlayer;
    CGFloat width;
    CGFloat height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    width = self.view.bounds.size.width;
    height = self.view.bounds.size.height;

    [self drawShipAndSea];
    [self animateShip];
    [self animateSea];
    [self playSong];
}

- (void)drawShipAndSea {
    sea1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea_01.jpg"]];
    sea1.frame = self.view.bounds;
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea_02.jpg"]];
    sea2.frame = CGRectMake(width, 0, width, height);
    [self.view addSubview:sea2];
    
    sea3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea_03.jpg"]];
    sea3.frame = CGRectMake(width, 0, width, height);
    [self.view addSubview:sea3];
    
    sea4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sea_04.jpg"]];
    sea4.frame = CGRectMake(width, 0, width, height);
    [self.view addSubview:sea4];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sailboat.png"]];
    ship.center = CGPointMake(200, 500);
    [self.view addSubview:ship];
}

- (void)animateShip {
    [UIView animateWithDuration:1 animations:^{
        ship.transform = CGAffineTransformMakeRotation(-0.08);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            ship.transform = CGAffineTransformMakeRotation(0.08);
        } completion:^(BOOL finished) {
            [self animateShip];
        }];
    }];
}

- (void)animateSea {
    [UIView animateWithDuration:10 animations:^{
        sea1.frame = CGRectMake(-width, 0, width, height);
        sea2.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        sea3.frame = CGRectMake(width, 0, width, height);
        [UIView animateWithDuration:10 animations:^{
            sea2.frame = CGRectMake(-width, 0, width, height);
            sea3.frame = self.view.bounds;
        } completion:^(BOOL finished) {
            sea4.frame = CGRectMake(width, 0, width, height);
            [UIView animateWithDuration:10 animations:^{
                sea3.frame = CGRectMake(-width, 0, width, height);
                sea4.frame = self.view.bounds;
            } completion:^(BOOL finished) {
                sea1.frame = CGRectMake(width, 0, width, height);
                [UIView animateWithDuration:10 animations:^{
                    sea4.frame = CGRectMake(-width, 0, width, height);
                    sea1.frame = self.view.bounds;
                } completion:^(BOOL finished) {
                    sea2.frame = CGRectMake(width, 0, width, height);
                    [self animateSea];
                }];
            }];
        }];
    }];
}

- (void)playSong {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sharazan" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

- (void)viewWillDisappear:(BOOL)animated {
    [audioPlayer stop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
