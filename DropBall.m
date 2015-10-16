//
//  DropBall.m
//  AdvancedUIView
//
//  Created by du phung cong on 10/12/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    UIImageView* ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x, y, velocityY, accelerateY, maxHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; // toa do bat dau duoc tinh duoi thanh Navigation
    
    [self addBall];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}

- (void)addBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dropball.png"]];
    ballRadius = 32.0;
    x = mainViewSize.width * 0.5;
    y = ballRadius;
    
    velocityY = 0.0;
    accelerateY = 2.0;
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - ballRadius - statusNavigationBarHeight;
    
    ball.center = CGPointMake(x, y);
    
    [self.view addSubview:ball];
}

- (void)dropBall {
    velocityY += accelerateY;
    y += velocityY;
    if(y > maxHeight) {
        velocityY = -velocityY * 0.9; // damper
        y = maxHeight; // cham san
    }
    
    ball.center = CGPointMake(x, y);
}

@end
