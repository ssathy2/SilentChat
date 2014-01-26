//
//  DDDEnums.h
//
//  Created by sathyam on 1/9/14.
//  Copyright (c) 2014 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, SSLoginFlow)
{
    SSLoginFlowNone,
    SSLoginFlowRapidRewards,
    SSLoginFlowMyTravel
};

typedef NS_ENUM(NSInteger, SSSidebarContentScreen)
{
    SSSidebarContentScreenCheckin,
    SSSidebarContentScreenBookAir,
    SSSidebarContentScreenBookCar,
    SSSidebarContentScreenDeals,
    SSSidebarContentScreenAboutus,
    SSSidebarContentScreenLogin,
    SSSidebarContentScreenManageTravel,
    SSSideBarContentScreenUpcomingTrips,
    SSSideBarContentScreenPastTrips,
    SSSidebarContentScreenLogout,
    SSSidebarContentScreenUserHomePage
};

typedef NS_ENUM(NSInteger, SSLoginServiceID)
{
    SSLoginServiceIDRelogin,
    SSLoginServiceIDRRPastTrips,
    SSLoginServiceIDRRViewPromotions,
    SSLoginServiceIDGetMySwLogout,
    SSLoginServiceIDRRNewLogin,
    SSLoginServiceIDRRUpcomingTrips
};

@interface SSEnums : NSObject
+ (NSDictionary*)SSLoginServiceIDDictionary;
@end