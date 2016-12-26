//
//  AnswerBean.h
//  Speedboy
//
//  Created by Minh Ta Hoang on 8/3/15.
//  Copyright (c) 2015 Ta Hoang Minh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Words : NSObject<NSCoding>

@property NSInteger mId;
@property NSString *word;
@property NSString *result;
@property NSString *strDescription;
@property NSString *favorites;
@property NSString *edited;
@property NSString *translitetation;

@property BOOL isEng2Pa;
@property BOOL isPa2Eng;
@property BOOL isVN;
@end
