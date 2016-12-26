//
//  NUAPI.h
//  Nushi
//
//  Created by Ta Hoang Minh on 2/9/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//
typedef enum
{
    API_RESULT_SUCCESS = 1,
    API_RESULT_LOGIC_FAILED = 0,
    API_RESULT_SERVER_ERROR = -1
} API_RESULT;
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface APIService : AFHTTPSessionManager
+ (APIService*) sharedInstance;


@end
