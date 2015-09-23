//
//  NestedSquare.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/20/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquares)
               withObject:nil
               afterDelay:2];
}

// Draw all nested squares
- (void)drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat rectWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    //NSLog(@"%2.1f", statusNavigationBarHeight);
    
    CGPoint center = CGPointMake(mainViewSize.width * 0.5, (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    for (int i = 0; i < 10; i++) {
        UIView* square;
        if(i % 2 == 0 ) {
            square = [self drawSquareWith:rectWidth
                                andRotate:false
                                 atCenter:center];
        }
        else {
            square = [self drawSquareWith:rectWidth
                                andRotate:true
                                 atCenter:center];
        }
        rectWidth = rectWidth * 0.707; // 1 / square(2) = 0.707
        [self.view addSubview:square];
    }
}

- (UIView*)drawSquareWith: (CGFloat)width
                andRotate: (BOOL)rotate
                 atCenter: (CGPoint)center {
    UIView* square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor darkGrayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}

- (void)rotateAllSquares {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
            if(i % 2 == 0) {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            }
            else {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
