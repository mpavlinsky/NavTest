//
//  ViewController.m
//  NavTest
//
//  Created by Pavlinsky, Matthew on 12/18/14.
//  Copyright (c) 2014 Pavlinsky, Matthew. All rights reserved.
//

#import "ViewController.h"
#import "PPHReturnToCartTransition.h"


@implementation RotationProxyNavController

#pragma mark -
#pragma mark UIViewController
- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([self.viewControllers count] > 0) {
        return [self.visibleViewController preferredStatusBarStyle];
    }
    return UIStatusBarStyleLightContent;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return [self.topViewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

@end

@implementation ColoredVC

- (id)init {
    if (self = [super init]) {
        static int index = 0;
        UIColor *color = [UIColor grayColor];
        switch (index) {
            case 0:
                color = [UIColor redColor];
                break;
            case 1:
                color = [UIColor greenColor];
                break;
            case 2:
                color = [UIColor blueColor];
                break;
            case 3:
                color = [UIColor yellowColor];
                break;
        }
        index ++;

        if (index > 3)
            index = 1;
        
        self.view.backgroundColor = color;
    }

    return self;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [self doTransitionTest];
    }
}

static BOOL transitioning = NO;
- (void)doTransitionTest {
    if (transitioning) {
        return;
    }

    transitioning = YES;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        RotationProxyNavController *landscapeNav = [[RotationProxyNavController alloc] initWithRootViewController:[PortraitVC new]];
        RotationProxyNavController *landscapeNav = [PortraitVC new];
        [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:landscapeNav animated:YES completion:^{
//            RotationProxyNavController *portraitNav = [[RotationProxyNavController alloc] initWithRootViewController:[PortraitVC new]];
            RotationProxyNavController *portraitNav = [PortraitVC new];
            portraitNav.modalPresentationStyle = UIModalPresentationCustom;
            id <UIViewControllerTransitioningDelegate> delegate = [PPHReturnToCartTransitionDelegate new];
            portraitNav.transitioningDelegate = delegate;
            [landscapeNav presentViewController:portraitNav animated:YES completion:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self performSelectorOnMainThread:@selector(dismiss:)
                                           withObject:landscapeNav
                                        waitUntilDone:YES];
//                [landscapeNav dismissViewControllerAnimated:YES completion:nil];
                });
//                [[UIApplication sharedApplication].delegate.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
                transitioning = NO;
            }];
        }];
//    });
}

- (void)dismiss:(UIViewController *)vc {
    [vc dismissViewControllerAnimated:YES completion:nil];
}

@end


@implementation LandscapeVC

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end

@implementation PortraitVC

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
