//
//  TripsBean.m
//  Speedboy
//
//  Created by TaHoangMinh on 11/20/15.
//  Copyright © 2015 TaHoangMinh. All rights reserved.
//

#import "TripsUpdateBean.h"

@implementation TripsUpdateBean


+ (TripsUpdateBean *) parseFromDict:(NSDictionary *)dict;
{
    TripsUpdateBean *obj = [[TripsUpdateBean alloc] init];
    if ((id)dict == [NSNull null] || ![dict isKindOfClass:[NSDictionary class]]) {
        return obj;
    }

    obj.dtCreateDate = SAFE_STR(dict[@"dtCreateDate"]);
    obj.idMember = SAFE_STR(dict[@"idMember"]);
    obj.idTrip = SAFE_STR(dict[@"idTrip"]);
    obj.idTripupdate = SAFE_STR(dict[@"idTripupdate"]);
    obj.intType = SAFE_STR(dict[@"intType"]);
    obj.strContent = SAFE_STR(dict[@"strContent"]);
    obj.strField1 = SAFE_STR(dict[@"strField1"]);
    obj.strFirstName = SAFE_STR(dict[@"strFirstName"]);
    obj.strLastName = SAFE_STR(dict[@"strLastName"]);
    obj.strPhoto = SAFE_STR(dict[@"strPhoto"]);
    NSString *str = [obj.strPhoto stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    if (![Utils isEmpty:str]) {
        obj.arrPhoto = [Utils dictByJSONString:str];
    } else {
        obj.arrPhoto = [NSArray array];
    }
    obj.strPicture = SAFE_STR(dict[@"strPicture"]);
    obj.strSubject = SAFE_STR(dict[@"strSubject"]);
    obj.strTitle = SAFE_STR(dict[@"strTitle"]);

    return obj;
}


+ (NSMutableArray *) parseFromArray:(NSArray *)arr;
{
    NSMutableArray *arrResult = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        TripsUpdateBean *obj = [TripsUpdateBean parseFromDict:dic];
        [arrResult addObject:obj];
    }
    return arrResult;
}

@end
