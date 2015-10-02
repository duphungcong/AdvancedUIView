//
//  ColorView.h
//  AdvancedUIView
//
//  Created by du phung cong on 10/1/15.
//  Copyright © 2015 duphungcong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+Extend.h"

@interface ColorView : UIView

- (instancetype)initWithHex:(NSString*)hex alpha:(float)alpha frame:(CGRect)rect;

- (void)fadeOut;

@property (nonatomic, strong) NSString* hex;

@end
