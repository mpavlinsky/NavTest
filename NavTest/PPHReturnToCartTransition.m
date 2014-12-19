//
//  PPHReturnToCartTransition.m
//  PayPal Here iPhone
//
//  Created by Pavlinsky, Matthew on 12/17/14.
//  Copyright (c) 2014 PayPal. All rights reserved.
//

#import "PPHReturnToCartTransition.h"
//#import "PPHOrderEntryViewController.h"

@implementation PPHReturnToCartTransition


// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // Currently only two keys are defined by the
    // system - UITransitionContextToViewControllerKey, and
    // UITransitionContextFromViewControllerKey.
    // Animators should not directly manipulate a view controller's views and should
    // use viewForKey: to get views instead.
    UIViewController *from = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *to = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

//    if ([to isKindOfClass:[PPHOrderEntryViewController class]]) {
//        from.view.frame = CGRectMake(100, 100, 100, 100);
//        to.view.frame = CGRectMake(200, 200, 200, 200);
//    }
//    } else {
//        to.view.frame =
//    }


//    [transitionContext completeTransition:YES];
}

//
//@optional
//
//// This is a convenience and if implemented will be invoked by the system when the transition context's completeTransition: method is invoked.
//- (void)animationEnded:(BOOL) transitionCompleted;


@end

@implementation PPHReturnToCartTransitionDelegate

//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    return [PPHReturnToCartTransition new];
//}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed  {
    return [PPHReturnToCartTransition new];
}

//
//- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source NS_AVAILABLE_IOS(8_0);
//
//}
@end

