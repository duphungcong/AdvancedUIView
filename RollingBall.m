//
//  RollingBall.m
//  AdvancedUIView
//
//  Created by du phung cong on 10/8/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "RollingBall.h"

@implementation RollingBall
{
    UIImageView *ball;
    NSTimer *timer, *timer2;
    CGFloat angle;
    CGFloat ballRadius;
    CGFloat alpha;
    CGFloat deltaSpeed;
    int goAhead;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    angle = 0.0;
    alpha = 0.0;
    goAhead = 1;
    deltaSpeed = 0.0;
    [self addBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(rollBall)
                                           userInfo:nil
                                            repeats:true];
}

- (void)addBall {
    CGSize mainViewSize = self.view.bounds.size;
    
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"]];
    ballRadius = 32.0;
    ball.center = CGPointMake(ballRadius, mainViewSize.height * 0.5);
    
    [self.view addSubview:ball];
}

- (void)rollBall {
    CGFloat deltaAngle;
    if((ball.center.x + ballRadius > self.view.bounds.size.width)) {
        goAhead = -1; // go back
    }
    if(ball.center.x - ballRadius < 0.0) {
        goAhead = 1;
        deltaSpeed = 0;
    }
    
    if(ball.center.x + ballRadius > 250.0) {
        alpha = 0.5;
        if(goAhead == 1) {
            deltaSpeed -= 0.001;
        }
        else {
            deltaSpeed += 0.004;
        }
    }
    
    if(ball.center.x + ballRadius < 250.0) {
        alpha = 0.0;
        if(goAhead == -1) {
            deltaSpeed += 0.0015;
        }
    }
    
    deltaAngle = (0.1 + deltaSpeed) * goAhead;
    if(deltaAngle < 0.0) {
        goAhead = -1;
        NSLog(@"test");
     }
    
    angle += deltaAngle;
    ball.transform = CGAffineTransformMakeRotation(angle);
    ball.center = CGPointMake(ball.center.x + ballRadius * deltaAngle * cosf(alpha),
                              ball.center.y - ballRadius * deltaAngle * sinf(alpha));
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

@end
