//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Camp Fire", CLASS: @"CampFire"},
                                    @{TITLE: @"Basic View", CLASS: @"BasicView"},
                                    @{TITLE: @"Chess View", CLASS: @"ChessView"},
                                    @{TITLE: @"Nested Square", CLASS: @"NestedSquare"},
                                    @{TITLE: @"Flying Bird", CLASS: @"FlyingBird"},
                                    @{TITLE: @"Swing Ship", CLASS: @"SwingShip"},
                                    @{TITLE: @"Star Field", CLASS: @"StarField"},
                                    @{TITLE: @"Hex Color #2", CLASS: @"HexColor2"},
                                    @{TITLE: @"Hex Color #3", CLASS: @"HexColor3"},
                                    @{TITLE: @"Rolling Ball", CLASS: @"RollingBall"},
                                    @{TITLE: @"Drop Ball", CLASS: @"DropBall"},
                                    @{TITLE: @"Earth around Sun", CLASS: @"EarthAroundSun"}
                          ]};
    
    mainScreen.menu = @[basic];
    mainScreen.title = @"Advanced UIView";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
