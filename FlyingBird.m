//
//  FlyingBird.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/23/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()
{
    UIImageView* bird;
    UIImageView* jungle;
}
@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addBird];
    [self flyUpAndDown];
    //[self flyGoAheadAndBack];
}

- (void)drawJungle {
    UIImageView* backGround = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    backGround.frame = self.view.bounds;
    backGround.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backGround];
}

- (void)addBird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    //bird = [[UIImageView alloc] initWithFrame:CGRectMake(100, self.view.bounds.size.height * 0.5, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0.png"],
                             [UIImage imageNamed:@"bird1.png"],
                             [UIImage imageNamed:@"bird2.png"],
                             [UIImage imageNamed:@"bird3.png"],
                             [UIImage imageNamed:@"bird4.png"],
                             [UIImage imageNamed:@"bird5.png"],
                             ];
    bird.animationRepeatCount = -1;
    bird.animationDuration = 1; // run 6 images in 1 sec
    [self.view addSubview:bird];
    [bird startAnimating];
}

- (void)flyUpAndDown {
    bird.transform = CGAffineTransformIdentity; // reset transform status of bird
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
}

- (void)flyGoAheadAndBack {
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height * 0.5);
    } completion:^(BOOL finished) {
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, -1), CGAffineTransformMakeRotation(M_PI));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, self.view.bounds.size.height * 0.5);
        } completion:^(BOOL finished) {
            [self flyGoAheadAndBack];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
