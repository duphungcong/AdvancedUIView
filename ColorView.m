//
//  ColorView.m
//  AdvancedUIView
//
//  Created by du phung cong on 10/1/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "ColorView.h"

@implementation ColorView
{
    UILabel *label;
}
- (instancetype)initWithHex:(NSString *)hex alpha:(float)alpha frame:(CGRect)rect {
    self = [super initWithFrame:rect];
    
    self.backgroundColor = [[UIColor alloc] initWithHex:hex alpha:alpha];
    
    if(rect.size.width > 150 && rect.size.height > 30) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, rect.size.width - 10.0, 30)];
        label.center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
        label.textAlignment = NSTextAlignmentCenter;
        label.text = hex;
        [self addSubview:label];
    }
    
    return self;
}

// Setter function
- (void)setHex:(NSString *)hex {
    self.backgroundColor = [[UIColor alloc] initWithHex:hex alpha:1.0];
    label.text = hex;
    label.textColor = [UIColor blackColor];
}

- (void)fadeOut {
    self.backgroundColor = [[UIColor alloc] initWithHex:self.hex
                                                  alpha:0.1];
    label.textColor = [[UIColor alloc] initWithHex:@"000000" alpha:0.1];
}

@end
