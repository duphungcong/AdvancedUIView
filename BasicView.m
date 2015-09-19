//
//  BasicView.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/14/15.
//  Copyright (c) 2015 duphungcong. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()

@property (weak, nonatomic) IBOutlet UIView *myView;
// myView must be set to back (Editor -> Arrange -> Sent to Back) or it overlaps the other view when zoom, rotate

@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;
@property (weak, nonatomic) IBOutlet UISwitch *showSwitch;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorSegment;

@end

@implementation BasicView
{
    UISwitch* switchShow;
    NSDictionary* defaultValue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getDefaultValue];
}

- (void)getDefaultValue {
    defaultValue = @{ @"Show" : self.showSwitch.isOn ? @true : @false,
                      @"Alpha" : [NSNumber numberWithFloat:self.alphaSlider.value],
                      @"Rotate" : [NSNumber numberWithFloat:self.rotateSlider.value],
                      @"Scale" : [NSNumber numberWithFloat:self.scaleSlider.value],
                      @"Color" : [NSNumber numberWithLong:self.colorSegment.selectedSegmentIndex]
    };
}

- (IBAction)resetAll:(id)sender {
    if ([defaultValue[@"Show"] boolValue] == true) {
        [self.showSwitch setOn:YES animated:YES];
        self.myView.hidden = false;
    }
    else {
        [self.showSwitch setOn:NO animated:YES];
        self.myView.hidden = true;
    }
    
    self.alphaSlider.value = [defaultValue[@"Alpha"] floatValue];
    self.myView.alpha = (CGFloat)self.alphaSlider.value;
    
    self.rotateSlider.value = [defaultValue[@"Rotate"] floatValue];
    self.scaleSlider.value = [defaultValue[@"Scale"] floatValue];
    [self rotateAndScale];
    
    self.colorSegment.selectedSegmentIndex = [defaultValue[@"Color"] longValue];
    switch (self.colorSegment.selectedSegmentIndex )
    {
        case 0:
            self.myView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            self.myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            self.myView.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            self.myView.backgroundColor = [UIColor greenColor];
            break;
        default:
            break;
    }

}

- (IBAction)onShow:(UISwitch*)sender {
    self.myView.hidden = !sender.on;
}

- (IBAction)onAlphaChange:(UISlider *)sender {
    self.myView.alpha = (CGFloat)sender.value;
}

- (void)rotateAndScale {
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation((CGFloat)self.rotateSlider.value * (CGFloat)M_PI);
    CGAffineTransform scalaTransform = CGAffineTransformMakeScale((CGFloat)self.scaleSlider.value, (CGFloat)self.scaleSlider.value);
    self.myView.transform = CGAffineTransformConcat(rotateTransform, scalaTransform);
}

- (IBAction)onRotate:(UISlider *)sender {
    [self rotateAndScale];
}

- (IBAction)onColorChange:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex)
    {
        case 0:
            self.myView.backgroundColor = [UIColor blackColor];
            break;
        case 1:
            self.myView.backgroundColor = [UIColor redColor];
            break;
        case 2:
            self.myView.backgroundColor = [UIColor blueColor];
            break;
        case 3:
            self.myView.backgroundColor = [UIColor greenColor];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
