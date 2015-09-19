//
//  ChessView.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/17/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()

@end

@implementation ChessView
{
    CGFloat margin;
    CGFloat cellWidth;
    
    UIView* containerView;
    UISlider* slider;
}

- (void)loadView {
    [super loadView];
    
    margin = 10.0;
    cellWidth = (self.view.bounds.size.width - 2.0 * margin) / 8.0;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - margin * 2.0, self.view.bounds.size.width - margin * 2.0)];
    containerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:containerView];
    containerView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
    
    NSLog(@"width = %2.1f, height = %2.1f", self.view.bounds.size.width, self.view.bounds.size.height);
    
    for (int rowIndex = 0; rowIndex < 8; rowIndex++) {
        for (int colIndex = 0; colIndex < 8; colIndex++) {
            CGRect rect = CGRectMake(colIndex * cellWidth, rowIndex * cellWidth, cellWidth, cellWidth);
            UIView* cell = [[UIView alloc] initWithFrame:rect];
            if (rowIndex % 2 == 0) {
                cell.backgroundColor = (colIndex % 2 == 0) ? [UIColor blackColor] : [UIColor whiteColor];
            }
            else {
                cell.backgroundColor = (colIndex % 2 == 0) ? [UIColor whiteColor] : [UIColor blackColor];
            }
            
            [containerView addSubview:cell];
        }
    }
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - 100, self.view.bounds.size.width - 40, 10)];
    slider.maximumValue = 1;
    slider.minimumValue = -1;
    slider.value = 0;
    [slider addTarget:self action:@selector(onRotate) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)onRotate {
    containerView.transform = CGAffineTransformMakeRotation((CGFloat)slider.value * (CGFloat)M_PI);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
