//
//  TripBean.h
//  Speedboy
//
//  Created by TaHoangMinh on 11/24/15.
//  Copyright © 2015 TaHoangMinh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TripBean : NSObject

@property NSString *strSubject;
@property NSString *idTrip;
@property NSString *strContent;
@property NSString *idmember;
@property NSString *strLocations;
@property NSString *strCurrencyStd;
@property int intShareFlag;
@property int intFriendShareLevel;
@property int intNotify;
@property NSString *decAvgRating;
@property NSString *dtStart;
@property NSString *dtEnd;
@property NSString *strPicture;
@property NSString *dtLastUpdateDate;
@property NSString *strField1;
@property NSString *idTripFavorites;


+ (TripBean *) parseFromDict:(NSDictionary *)dict;
+ (NSMutableArray *) parseFromArray:(NSArray *)arr;

@end
