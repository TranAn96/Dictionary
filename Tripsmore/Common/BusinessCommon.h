//
//  UDBusinessCommon.h
//  Speedboy
//
//  Created by Minh Ta Hoang on 7/24/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kGenderMale @"MALE"
#define kGenderFemale @"FEMALE"

@interface BusinessCommon : NSObject

+ (NSMutableAttributedString *) homeText1:(NSString *)text1
                                    text2:(NSString *)text2
                                    text3:(NSString *)text3;
@end
