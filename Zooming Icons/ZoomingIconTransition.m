//
//  ZoomingIconTransition.m
//  Zooming Icons
//
//  Created by Chelsea Liu on 7/16/15.
//  Copyright (c) 2015 Chelsea Liu. All rights reserved.
//

#import "ZoomingIconTransition.h"

@implementation ZoomingIconTransition

NSTimeInterval const kZoomingIconTransitionDuration = 1;


- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    return kZoomingIconTransitionDuration;
    
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    NSTimeInterval timeInterval = [self transitionDuration:transitionContext];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView]; //transitions happen inside containerView / sandbox
    
    [containerView addSubview:fromViewController.view];
    [containerView addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:timeInterval animations:^{
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    return self;
}



@end
