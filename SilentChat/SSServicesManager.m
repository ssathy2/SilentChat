//
//  SSServicesManager.m
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import "SSServicesManager.h"
#import "SSDataService.h"

static NSString *kCredentialKey		= @"credential";
static NSString *kPasswordKey		= @"password";
static NSString *kAppIDKey			= @"appID";
static NSString *kAppVerKey			= @"appver";
static NSString *kServiceIDKey		= @"serviceID";
static NSString *kChannelKey		= @"channel";
static NSString *kPlatformKey		= @"platform";
static NSString *kLoginFlowKey		= @"loginflow";
static NSString *kPasswordFlagKey	= @"passwordFlag";
static NSString *kCacheIDKey		= @"cacheid";

static NSString *appID				= @"swa";
static NSString *appver				= @"2.0.1";
static NSString *loginServiceID		= @"rrnewlogin";
static NSString *reloginServiceID	= @"relogin";
static NSString *channel			= @"rc";
static NSString *platform			= @"iPhone";
static NSString *passwordFlag		= @"3";


@interface SSServicesManager()
@property (strong, nonatomic) SSDataService *dataService;
@property (strong, nonatomic) NSURL			*baseURL;
@end

@implementation SSServicesManager
CREATE_SHARED_INSTANCE

- (instancetype)init
{
	self = [super init];
	if (self)
	{
		self.dataService = [[SSDataService alloc] init];
		self.baseURL = [NSURL URLWithString:@"https://mobile.southwest.com/middleware/MWServlet"];
	}
	return self;
}

@end
