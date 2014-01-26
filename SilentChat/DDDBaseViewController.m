//
//  SSBaseViewController.m
//
//  Created by Sidd Sathyam on 12/19/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "DDDBaseViewController.h"
#import "DDDStyledLabel.h"
#import "UIView+DDDAdditions.h"

@interface DDDBaseViewController ()

@end

@implementation DDDBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)addTitleToViewController
{
	DDDStyledLabel *navTitleLabel						= [[DDDStyledLabel alloc] initWithFrame:CGRectMake(135.0f, 0.0f, 50.0f, 30.0f)];
	navTitleLabel.textAlignment							= NSTextAlignmentCenter;
	navTitleLabel.textColor								= [UIColor lightGrayColor];
	navTitleLabel.text									= self.title;
	[self.navigationItem setTitleView:navTitleLabel];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	[self addTitleToViewController];
	[self applyTransparentNavigationBarStyle];
	[self setNeedsStatusBarAppearanceUpdate];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

- (void)applyTransparentNavigationBarStyle
{
	[self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
	self.navigationController.navigationBar.shadowImage = [UIImage new];
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.view.backgroundColor		= [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setShowLoadingOverlay:(BOOL)showLoadingOverlay
{
	if (_showLoadingOverlay != showLoadingOverlay)
	{
		_showLoadingOverlay = showLoadingOverlay;
		if (_showLoadingOverlay)
		{
			[self.view showLoadingOverlay];
		}
		else
		{
			[self.view hideLoadingOverlay];
		}
		
	}
}

@end
