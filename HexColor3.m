//
//  HexColor3.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/30/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "HexColor3.h"
#import "ColorView.h"

@implementation HexColor3
{
    ColorView *view1, *view2, *view3, *view4, *view5;
    NSArray *cpArray; //Color Pattern Array
    int colorPatternIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSArray* cp1 = @[@"69D2E7", @"A7DBD8", @"E0E4CC", @"F38630", @"FA6900"];
    NSArray* cp2 = @[@"556270", @"4ECDC4", @"C7F464", @"FF6B6B", @"C44D58"];
    NSArray* cp3 = @[@"ECD078", @"D95B43", @"C02942", @"542437", @"53777A"];
    NSArray* cp4 = @[@"413E4A", @"73626E", @"B38184", @"F0B49E", @"F7E4BE"];
    NSArray* cp5 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD", @"E5FCC2"];
    NSArray* cp6 = @[@"99B898", @"FECEA8", @"FF847C", @"E84A5F", @"2A363B"];
    cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    
    CGFloat colorViewWidth = 200.0;
    CGFloat colorViewHeight = 40.0;
    CGFloat x0 = (self.view.bounds.size.width - colorViewWidth) * 0.5;
    
    view1 = [[ColorView alloc] initWithHex:@"00A0B0" alpha:1.0 frame:CGRectMake(x0, 10, colorViewWidth, colorViewHeight)];
    view2 = [[ColorView alloc] initWithHex:@"6A4A3C" alpha:1.0 frame:CGRectMake(x0, 60, colorViewWidth, colorViewHeight)];
    view3 = [[ColorView alloc] initWithHex:@"CC333F" alpha:1.0 frame:CGRectMake(x0, 110, colorViewWidth, colorViewHeight)];
    view4 = [[ColorView alloc] initWithHex:@"EB6841" alpha:1.0 frame:CGRectMake(x0, 160, colorViewWidth, colorViewHeight)];
    view5 = [[ColorView alloc] initWithHex:@"EDC951" alpha:1.0 frame:CGRectMake(x0, 210, colorViewWidth, colorViewHeight)];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    [self.view addSubview:view4];
    [self.view addSubview:view5];
    
    colorPatternIndex = 0;
    
    [self performSelector:@selector(animateColor:)
               withObject:[[NSNumber alloc] initWithInt:colorPatternIndex] afterDelay:1.0];
}

- (void)animateColor:(NSNumber*)cpIndex {
    int index = [cpIndex intValue];
    [UIView animateWithDuration:4.0 animations:^{
        NSArray* cp = cpArray[index];
        view1.hex = cp[0];
        view2.hex = cp[1];
        view3.hex = cp[2];
        view4.hex = cp[3];
        view5.hex = cp[4];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            [view1 fadeOut];
            [view2 fadeOut];
            [view3 fadeOut];
            [view4 fadeOut];
            [view5 fadeOut];
        } completion:^(BOOL finished) {
            self->colorPatternIndex ++;
            if(self->colorPatternIndex == self->cpArray.count) {
                self->colorPatternIndex = 0;
            }
            [self animateColor:[[NSNumber alloc] initWithInt:colorPatternIndex]];

        }];
    }];
}

@end
