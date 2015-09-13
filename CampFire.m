//
//  CampFire.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/13/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()
{
    UIImageView* fire;
}
@end

@implementation CampFire

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone; // set duong bien cua view nhin duoc o duoi man hinh hay duoi thanh nav
    [self burnFire];
}

- (void)burnFire {
    fire = [[UIImageView alloc]initWithFrame:self.view.bounds];
    NSMutableArray* images = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i = 1; i < 18; i++) {
        NSString* fileName;
        if (i < 10) {
            fileName = [NSString stringWithFormat:@"campFire0%d.gif", i];
        }
        else {
            fileName = [NSString stringWithFormat:@"campFire%d.gif", i];
        }
        [images addObject:[UIImage imageNamed:fileName]];
        
        fire.animationImages = images;
        fire.animationDuration = 1;
        fire.animationRepeatCount = 0;
        [self.view addSubview:fire];
        [fire startAnimating];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
