//
//  SSStyledLabel.m
//
//  Created by Sidd Sathyam on 1/17/14.
//  Copyright (c) 2014 dotdotdot. All rights reserved.
//

#import "UIFont+DDDAdditions.h"

@implementation DDDStyledLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self)
	{
		CGFloat pointSize	= self.font.pointSize;
		self.font			= [UIFont helveticaNeueLightWithPointSize:pointSize];
	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
