//
//  AppDelegate.m
//  NavTest
//
//  Created by Pavlinsky, Matthew on 12/18/14.
//  Copyright (c) 2014 Pavlinsky, Matthew. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UIViewController *root;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];

    self.root = [PortraitVC new];

    self.window.rootViewController = [[RotationProxyNavController alloc] initWithRootViewController:self.root];
    [self.window makeKeyAndVisible];



    return YES;
}

@end
