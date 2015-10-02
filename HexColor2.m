//
//  HexColor2.m
//  AdvancedUIView
//
//  Created by du phung cong on 9/30/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import "HexColor2.h"
#import "UIColor+Extend.h"

@implementation HexColor2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(40, 100, 100, 50)];
    label.backgroundColor = [[UIColor alloc] initWithHex:@"#45ADA8" alpha:1.0];
    [self.view addSubview:label];
}

@end
