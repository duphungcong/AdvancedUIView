//
//  StarField.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/27/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "StarField.h"

@interface StarField ()

@end

@implementation StarField
{
    UIImageView *red, *green, *brown, *violet;
    CGPoint center;
    CGFloat deltaX, deltaY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
    deltaX= 100;
    deltaY = 100;
    [self addStar];
    [self animateStar];
}

- (void)addStar {
    red = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]];
    green = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green.png"]];
    brown = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown.png"]];
    violet = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet.png"]];
    
    [self setCenter];
    
    [self.view addSubview:red];
    [self.view addSubview:green];
    [self.view addSubview:brown];
    [self.view addSubview:violet];
    
}

- (void)setCenter {
    red.center = center;
    green.center = center;
    brown.center = center;
    violet.center = center;
}

- (void)animateStar {
    [UIView animateWithDuration:1 animations:^{
        red.center = CGPointMake(center.x + deltaX, center.y - deltaY);
        green.center = CGPointMake(center.x - deltaX, center.y - deltaY);
        brown.center = CGPointMake(center.x - deltaX, center.y + deltaY);
        violet.center = CGPointMake(center.x + deltaX, center.y + deltaY);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            red.center = CGPointMake(center.x, red.center.y);
            green.center = CGPointMake(green.center.x, center.y);
            brown.center = CGPointMake(center.x, brown.center.y);
            violet.center = CGPointMake(violet.center.x, center.y);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                [self setCenter];
            } completion:^(BOOL finished) {
                [self animateStar];
            }];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
