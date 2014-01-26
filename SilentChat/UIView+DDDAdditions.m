//
//  UIView+DDDAdditions.m
//
//  Created by Sidd Sathyam on 12/20/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "UIView+DDDAdditions.h"
#import "UIImage+ImageEffects.h"
#import <QuartzCore/QuartzCore.h>

#define kNavigationBarHeight                    64.0f
#define kSpinningIndicatorBackgroundViewHeight	50.0f
#define kSpinningIndicatorBackgroundViewWidth	50.0f

#define kSpinningIndicatorHeight				50.0f
#define kSpinningIndicatorWidth					50.0f

#define kSpinningIndicatorBackgroundTag			1
#define kSpinningIndicatorTag					2
#define kBackgroundOverlayViewTag				3

#define kDarkBackgroundViewTag                  4

@implementation UIView (DDDAdditions)

- (void)showLoadingOverlay
{
	UIView *loadingOverlay = [self viewWithTag:kBackgroundOverlayViewTag];
	if (loadingOverlay)
	{
		UIActivityIndicatorView *activityIndicatorView = (UIActivityIndicatorView*)[loadingOverlay viewWithTag:kSpinningIndicatorTag];
		[activityIndicatorView startAnimating];
		[loadingOverlay setHidden: NO];
	}
	else
	{
		UIView *backgroundOverlayView = [[UIView alloc] initWithFrame:self.frame];
		backgroundOverlayView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
		
		//[self setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8f]];
		UIView *activityIndicationBackgroundView	= [[UIView alloc] initWithFrame:CGRectMake(
																							   (self.bounds.size.width / 2) - (kSpinningIndicatorBackgroundViewWidth / 2),
																							   (self.bounds.size.height / 2) - (kSpinningIndicatorBackgroundViewHeight / 2),
																							   kSpinningIndicatorBackgroundViewWidth,
																							   kSpinningIndicatorBackgroundViewHeight)];
		
		UIActivityIndicatorView *activityIndicator	= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(
																												 activityIndicationBackgroundView.bounds.origin.x,
																												 activityIndicationBackgroundView.bounds.origin.y,
																												 kSpinningIndicatorWidth,
																												 kSpinningIndicatorHeight)];
		activityIndicationBackgroundView.layer.cornerRadius = 5.0f;
		[activityIndicationBackgroundView addSubview:activityIndicator];
		[activityIndicationBackgroundView bringSubviewToFront:activityIndicator];
		[activityIndicationBackgroundView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.8f]];
		[activityIndicationBackgroundView setTag:kSpinningIndicatorBackgroundTag];
		
		[activityIndicator setTag:kSpinningIndicatorTag];
		[activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
		
		[backgroundOverlayView addSubview:activityIndicationBackgroundView];
		[self addSubview:backgroundOverlayView];
		[self bringSubviewToFront:backgroundOverlayView];
		self.userInteractionEnabled = NO;
		[activityIndicator startAnimating];
	}
}

- (void)hideLoadingOverlay
{
	UIView *loadingOverlay = [self viewWithTag:kBackgroundOverlayViewTag];
	if (loadingOverlay)
	{
		UIActivityIndicatorView *activityIndicatorView = (UIActivityIndicatorView*)[loadingOverlay viewWithTag:kSpinningIndicatorTag];
		[activityIndicatorView stopAnimating];
		[loadingOverlay setHidden: YES];
		self.userInteractionEnabled = YES;
	}
}

- (void)darkenView
{
    UIView *darkBackgroundView = [self viewWithTag:kDarkBackgroundViewTag];
    if (!darkBackgroundView)
    {
        darkBackgroundView  = [[UIView alloc] initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y + kNavigationBarHeight, self.bounds.size.width, self.bounds.size.height - kNavigationBarHeight)];
        [darkBackgroundView setTag:kDarkBackgroundViewTag];
    }
    darkBackgroundView.backgroundColor           = [UIColor blackColor];
    darkBackgroundView.userInteractionEnabled    = NO;
    darkBackgroundView.alpha                     = 0.5f;
    [self addSubview:darkBackgroundView];
    [self bringSubviewToFront:darkBackgroundView];
}

- (void)undarkView
{
    UIView *darkBackgroundView = [self viewWithTag:kDarkBackgroundViewTag];
    if (darkBackgroundView)
    {
        darkBackgroundView.hidden = YES;
        [darkBackgroundView removeFromSuperview];
    }
}

- (UIImage*)blurView
{
    // Create the image context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
    
    // There he is! The new API method
    [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
    
    // Get the snapshot
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    
//    // Now apply the blur effect using Apple's UIImageEffect category
    UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
    UIGraphicsEndImageContext();
//
    return blurredSnapshotImage;
}

- (void)unBlurView
{
    
}

- (void)setDarkViewAlpha:(CGFloat)alpha
{
    UIView *darkBackgroundView = [self viewWithTag:kDarkBackgroundViewTag];
    if (darkBackgroundView)
    {
        [darkBackgroundView setAlpha:alpha];
    }
}

@end
