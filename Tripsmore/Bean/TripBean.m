//
//  TripBean.m
//  Speedboy
//
//  Created by TaHoangMinh on 11/24/15.
//  Copyright © 2015 TaHoangMinh. All rights reserved.
//

#import "TripBean.h"

@implementation TripBean


+ (TripBean *) parseFromDict:(NSDictionary *)dict;
{
    TripBean *obj = [[TripBean alloc] init];
    if ((id)dict == [NSNull null] || ![dict isKindOfClass:[NSDictionary class]]) {
        return obj;
    }
    
    obj.strSubject = SAFE_STR(dict[@"strSubject"]);
    obj.idTrip = SAFE_STR(dict[@"idTrip"]);
    obj.strContent = SAFE_STR(dict[@"strContent"]);
    obj.idmember = SAFE_STR(dict[@"idmember"]);
    obj.strField1 = SAFE_STR(dict[@"strField1"]);
    obj.strLocations = SAFE_STR(dict[@"strLocations"]);
    obj.strCurrencyStd = SAFE_STR(dict[@"strCurrencyStd"]);
    obj.intShareFlag = [SAFE_NUM(dict[@"intShareFlag"]) intValue];
    obj.intFriendShareLevel = [SAFE_NUM(dict[@"intFriendShareLevel"]) intValue];
    obj.intNotify = [SAFE_NUM(dict[@"intNotify"]) intValue];
    obj.decAvgRating = SAFE_STR(dict[@"decAvgRating"]);
    obj.dtStart = SAFE_STR(dict[@"dtStart"]);
    obj.dtEnd = SAFE_STR(dict[@"dtEnd"]);
    obj.strPicture = SAFE_STR(dict[@"strPicture"]);
    obj.dtLastUpdateDate = SAFE_STR(dict[@"dtLastUpdateDate"]);
    obj.idTripFavorites = SAFE_STR(dict[@"idTripFavorites"]);
    
    
    return obj;
}


+ (NSMutableArray *) parseFromArray:(NSArray *)arr;
{
    NSMutableArray *arrResult = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        TripBean *obj = [TripBean parseFromDict:dic];
        [arrResult addObject:obj];
    }
    return arrResult;
}


@end
