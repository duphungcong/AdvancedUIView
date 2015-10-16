//
//  EarthAroundSun.m
//  AdvancedUIView
//
//  Created by du phung cong on 10/16/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "EarthAroundSun.h"

@interface EarthAroundSun ()

@end

@implementation EarthAroundSun
{
    UIImageView *sun, *earth, *moon;
    CGFloat distanceEarthToSun, distanceMoonToEarth;
    CGFloat angleEarth, angleMoon;
    CGPoint sunCenter, earthCenter;
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self addSunEarthMoon];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
}

- (void)addSunEarthMoon {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.png"]];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    moon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.png"]];
    
    sunCenter = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    sun.center = sunCenter;
    
    distanceEarthToSun = mainViewSize.width * 0.5 - 60.0;
    angleEarth = 0.0;
    earthCenter = [self computePositionOfEarth:angleEarth];
    earth.center = earthCenter;
    
    distanceMoonToEarth = 24.0 + 16.0 + 5.0;
    angleMoon = 0.0;
    moon.center = [self computePositionOfMoon:angleMoon];
    
    
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    [self.view addSubview:moon];
}

- (CGPoint)computePositionOfEarth:(CGFloat)angle {
    return  CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle), sunCenter.y + distanceEarthToSun * sin(angle));
}

- (CGPoint)computePositionOfMoon:(CGFloat)angle {
    return  CGPointMake(earthCenter.x + distanceMoonToEarth * cos(angle), earthCenter.y + distanceMoonToEarth * sin(angle));
}

- (void)spinEarth {
    angleEarth += 0.01;
    earthCenter = [self computePositionOfEarth:angleEarth];
    earth.center = earthCenter;
    [self spinMoon];
}

- (void)spinMoon {
    angleMoon += 0.1;
    moon.center = [self computePositionOfMoon:angleMoon];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
