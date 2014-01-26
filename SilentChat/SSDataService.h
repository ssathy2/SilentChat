//
//  DDDDataService.h
//  SWAiOS
//
//  Created by Sidd Sathyam on 12/14/13.
//  Copyright (c) 2013 dotdotdot. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DDDURLJSONResponseCallback)(NSDictionary *jsonResponse, NSError *error);

@interface SSDataService : NSObject

- (void)fetchJSONatURL:(NSURL *)url withHTTPMethod:(NSString *)httpMethod postBody:(NSString*)body headers:(NSDictionary *)headers withCallback:(DDDURLJSONResponseCallback)callback;

- (void) clearDataServiceCookies;

@end
