//
//  UIView+DDDAdditions.h
//
//  Created by Sidd Sathyam on 12/20/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDDAdditions)

- (void)showLoadingOverlay;
- (void)hideLoadingOverlay;

- (void)darkenView;
- (void)undarkView;

- (UIImage*)blurView;
- (void)unBlurView;

- (void)setDarkViewAlpha:(CGFloat)alpha;
@end
