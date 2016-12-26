//
//  TripsBean.h
//  Speedboy
//
//  Created by TaHoangMinh on 11/20/15.
//  Copyright © 2015 TaHoangMinh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kTRIP_TYPE_New_Trip = 1,
    kTRIP_TYPE_Update_Trip = 2,
    kTRIP_TYPE_New_Rate = 3,
    kTRIP_TYPE_Update_Comment = 4,
    kTRIP_TYPE_New_Photo = 5,
    kTRIP_TYPE_Edit_Photo = 6,
    kTRIP_TYPE_New_Check_In= 7,
    kTRIP_TYPE_Update_Checkin = 8,
} kTRIP_TYPE;

@interface TripsUpdateBean : NSObject


@property NSString *dtCreateDate;
@property NSString *idMember;
@property NSString *idTrip;
@property NSString *idTripupdate;
@property NSString *intType;
@property NSString *strContent;
@property NSString *strField1;
@property NSString *strFirstName;
@property NSString *strLastName;
@property NSString *strPhoto;
@property NSArray *arrPhoto;
@property NSString *strPicture;
@property NSString *strSubject;
@property NSString *strTitle;


+ (NSMutableArray *) parseFromArray:(NSArray *)arr;
+ (TripsUpdateBean *) parseFromDict:(NSDictionary *)dict;

@end
